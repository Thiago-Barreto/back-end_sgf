/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
import { Injectable } from '@nestjs/common';
import * as moment from 'moment-timezone';
import { PrismaService } from 'src/prisma/prisma.service';
import { NewProgrammingNpi } from './dto/npi.dto';

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
      const formattedDate = npi.map((item) => ({
        ...item,
        estimated_engineering_pilot_date: moment(
          item.estimated_engineering_pilot_date,
        ).format('DD/MM/YYYY'),
        estimated_pilot_production_date: moment(
          item.estimated_pilot_production_date,
        ).format('DD/MM/YYYY'),
      }));
      console.log(formattedDate);
      return formattedDate;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

  async newProgrammingNpi(data: NewProgrammingNpi) {
    try {
      console.log('Tá: ', data);
      const dateFormat = moment
        .tz('America/Manaus')
        .utc()
        .subtract(4, 'hours')
        .format();
      await this.prismaService.programming_npi.create({
        data: {
          ...data,
          UserCreate: data.UserCreate,
          DateCreate: dateFormat,
          date_of_the_month: data.estimated_engineering_pilot_date,
        },
      });
    } catch (error) {
      console.log(error);
    }
  }
}
