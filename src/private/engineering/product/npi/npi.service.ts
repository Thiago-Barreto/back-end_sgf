/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
import { Injectable } from '@nestjs/common';
import * as moment from 'moment-timezone';
import { PrismaService } from 'src/prisma/prisma.service';
import { NewProgrammingNpi, UpdateProgrammingNpi } from './dto/npi.dto';

moment.locale();

@Injectable()
export class NpiService {
  constructor(private readonly prismaService: PrismaService) {}

  async npi() {
    try {
      const npi = await this.prismaService.programming_npi.findMany({
        select: {
          id: true,
          code: true,
          family: true,
          description: true,
          type_of_shipment: true,
          type_of_production: true,
          product_class: true,
          lote_and_fixture: true,
          arrival_of_mp_and_fixture: true,
          halb: true,
          estimated_engineering_pilot_date: true,
          estimated_pilot_production_date: true,
          status: true,
          justification_engineering: true,
          justification_production: true,
          production_pilot_status: true,
          engineering_pilot_status: true,
          date_of_the_month: true,
        },
        orderBy: { id: 'desc' },
      });
      console.log(npi);
      return npi;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

  async newProgrammingNpi(data: NewProgrammingNpi) {
    try {
      const dateFormat = moment
        .tz('America/Manaus')
        .utc()
        .subtract(4, 'hours')
        .format();
      const programmingAlready =
        await this.prismaService.programming_npi.findFirst({
          where: {
            ...(data.family === 'TV' && { code: data.code }),
            ...(data.family === 'DDR' && {
              code: data.code,
              lote_and_fixture: data.lote_and_fixture,
              halb: data.halb,
            }),
          },
        });

      console.log(programmingAlready);

      if (programmingAlready) {
        return {
          success: false,
          message:
            'Programação de npi já cadastrada. Por favor verifique os dados novamente.',
          title: 'Pragramação Duplicada',
        };
      }
      await this.prismaService.programming_npi.create({
        data: {
          ...data,
          UserCreate: data.UserCreate,
          DateCreate: dateFormat,
          estimated_engineering_pilot_date: moment(
            data.estimated_engineering_pilot_date,
          ).format(),
          estimated_pilot_production_date: moment(
            data.estimated_pilot_production_date,
          ).format(),
          date_of_the_month: moment(
            data.estimated_pilot_production_date,
          ).format(),
          status: 'Em Processo',
        },
      });
      return {
        title: 'NPI Programado!',
        message:
          'Programação de NPI cadastrada. Por favor, matenha atualizado a cada processo.',
      };
    } catch (error) {
      console.log(error);
    }
  }

  async updateProgrammingNpi(id: number, data: UpdateProgrammingNpi) {
    try {
      console.log(id, data);
      let status = 'Em Processo';
      if (
        data.engineering_pilot_status === 'Atrasado' ||
        data.production_pilot_status === 'Atrasado'
      ) {
        status = 'Atrasado';
      } else if (
        data.engineering_pilot_status === 'Concluído' &&
        data.production_pilot_status === 'Concluído'
      ) {
        status = 'Concluído';
      }

      await this.prismaService.programming_npi.update({
        data: {
          ...data,
          estimated_engineering_pilot_date: moment(
            data.estimated_engineering_pilot_date,
          ).format(),
          estimated_pilot_production_date: moment(
            data.estimated_pilot_production_date,
          ).format(),
          date_of_the_month: moment(
            data.estimated_engineering_pilot_date,
          ).format(),
          status: status,
        },
        where: { id: Number(id) },
      });
      return {
        title: 'NPI Atualizado!',
        message:
          'Programação de NPI atualizada. Por favor, matenha atualizado a cada processo.',
      };
    } catch (error) {
      console.log(error);
      throw error;
    }
  }
}
