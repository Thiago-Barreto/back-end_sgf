/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-argument */
/* eslint-disable @typescript-eslint/no-unsafe-return */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import * as moment from 'moment-timezone';
import { ProgrammingNpi } from './dto/npi';

moment.locale('pt-br');

@Injectable()
export class DashboardService {
  constructor(private readonly prismaService: PrismaService) {}

  async npi(month: string) {
    try {
      const [year, monthNumber] = month.split('-').map(Number);
      const startDate = new Date(year, monthNumber - 1, 1);
      const endDate = new Date(year, monthNumber, 0);
      const programming = await this.getProgrammingByMonth(startDate, endDate);
      const resultMonth = this.groupByStatus(programming);
      const formattedProgramming = this.formatProgrammingDates(programming);

      const families = await this.getDistinctFamilies(year);
      const monthlyCount = await this.countProgrammingByFamily(families);
      const performanceResultData = await this.getNpiPerformanceAnalysis(year);
      return {
        resultMonth,
        programming: formattedProgramming,
        monthlyCount,
        distinctFamilies: families.map((f) => ({ family: f })),
        performance: performanceResultData,
      };
    } catch (error) {
      console.error(error);
      throw error;
    }
  }
  private async getProgrammingByMonth(
    start: Date,
    end: Date,
  ): Promise<ProgrammingNpi[]> {
    return (await this.prismaService.programming_npi.findMany({
      where: {
        estimated_engineering_pilot_date: {
          gte: start,
          lte: end,
        },
      },
    })) as unknown as ProgrammingNpi[];
  }

  private groupByStatus(programming: ProgrammingNpi[]) {
    const monthsData: any = {};
    const validStatuses = ['Concluído', 'Atrasado', 'Em Processo'];

    programming.forEach((item) => {
      const date = new Date(item.date_of_the_month);
      const monthName = date.toLocaleString('default', { month: 'long' });
      const status = item.status;

      monthsData[monthName] ??= {
        month: monthName,
        Concluído: 0,
        Atrasado: 0,
        'Em Processo': 0,
      };

      if (validStatuses.includes(status)) {
        monthsData[monthName][status] += 1;
      }
    });

    return Object.values(monthsData);
  }

  private formatProgrammingDates(
    programming: ProgrammingNpi[],
  ): ProgrammingNpi[] {
    return programming.map((item) => ({
      ...item,
      estimated_engineering_pilot_date: moment(
        item.estimated_engineering_pilot_date,
      ).format('DD/MM/YYYY'),
      estimated_pilot_production_date: moment(
        item.estimated_pilot_production_date,
      ).format('DD/MM/YYYY'),
    }));
  }

  private async getDistinctFamilies(year): Promise<string[]> {
    const families = await this.prismaService.programming_npi.findMany({
      where: {
        estimated_engineering_pilot_date: {
          gte: new Date(year, 0, 1),
          lte: new Date(year, 11, 31),
        },
      },
      select: { family: true },
      distinct: ['family'],
    });
    return families.map((item) => item.family);
  }

  private async countProgrammingByFamily(families: string[]) {
    const allProgramming = await this.prismaService.programming_npi.findMany();

    const monthlyCount = Array.from({ length: 12 }, (_, i) => {
      const entry: any = {
        month: moment().month(i).format('MMMM'),
      };

      families.forEach((family) => {
        entry[family] = 0;
      });

      return entry;
    });

    allProgramming.forEach((item) => {
      const monthIndex = new Date(item.date_of_the_month).getMonth();
      const family = item.family;

      if (families.includes(family)) {
        monthlyCount[monthIndex][family] += 1;
      }
    });

    return monthlyCount;
  }

  private async getNpiPerformanceAnalysis(year) {
    const allProgramming = await this.prismaService.programming_npi.findMany({
      where: {
        estimated_engineering_pilot_date: {
          gte: new Date(year, 0, 1),
          lte: new Date(year, 11, 31),
        },
      },
    });

    const performanceResult = Array.from({ length: 12 }, (_, i) => ({
      month: moment().month(i).format('MMMM'),
      total: 0,
      concluido: 0,
    }));

    allProgramming.forEach((item) => {
      const monthIndex = new Date(item.date_of_the_month).getMonth();

      performanceResult[monthIndex].total += 1;

      if (item.status === 'Concluído') {
        performanceResult[monthIndex].concluido += 1;
      }
    });

    return performanceResult;
  }
}
