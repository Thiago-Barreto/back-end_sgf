/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */

import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { EquipmentDTO } from './dto/equipment.dto';
import { factoryMap } from './utils/factory';
import { stateMap } from './utils/state';
import { sectorMap } from './utils/sector';
import { dateFormatLocal } from './utils/date/formatted';

@Injectable()
export class EquipmentsService {
  constructor(private readonly prismaService: PrismaService) {}

  async equipments(sector: string) {
    try {
      console.log(sector);
      const whereCondition =
        sector === 'System Developer' ? {} : { sector: sector };
      const equipments = await this.prismaService.equipment.findMany({
        select: {
          id: true,
          serial: true,
          code_sap: true,
          description: true,
          family: true,
          brand: true,
          requiresCalibration: true,
          calibrationCertificate: true,
          invoice: true,
          dataInvoice: true,
          dischargeDate: true,
          shed: true,
          status: true,
          location: true,
          calibrationDate: true,
          nextCalibration: true,
          amount: true,
          product: true,
          similar: true,
        },
        where: whereCondition,
      });
      return equipments;
    } catch (error) {
      console.log(error);
    }
  }

  async createEquipment(
    sector: string,
    locality: string,
    factory: string,
    data: EquipmentDTO,
  ) {
    try {
      console.log(data);
      const enterprise = factoryMap[factory];
      const state = stateMap[locality];
      const sectorFab = sectorMap[sector];

      const sectorSearch = await this.prismaService.equipment.findMany({
        where: {
          sector: sector,
        },
        select: {
          serial: true,
        },
        orderBy: {
          serial: 'desc',
        },
        take: 1,
      });

      let lastSerial = '00000';
      if (sectorSearch.length > 0) {
        console.log('Last Serial: ', sectorSearch[0].serial);
        lastSerial = sectorSearch[0].serial;
      }

      let currentSerial = lastSerial;

      for (let i = 0; i < Number(data.amountEqp); i++) {
        const sequencialPart = currentSerial.substring(
          currentSerial.length - 5,
        );
        console.log('Sequencial Part: ', sequencialPart);

        const nextSequencial = incrementSerial(sequencialPart);
        console.log('Next Sequencial: ', nextSequencial);

        const newSerial = `${enterprise}${state}EQP${sectorFab}${nextSequencial}`;
        console.log('New Serial: ', newSerial);

        await this.prismaService.equipment.create({
          data: {
            serial: newSerial,
            description: data.description,
            code_sap: data.code_sap,
            family: data.family,
            brand: data.brand,
            shed: data.shed,
            location: data.location,
            status: 'ATIVO',
            sector: sector,
            UserCad: data.UserCad,
            DateCad: dateFormatLocal,
          },
        });

        currentSerial = newSerial;
      }
    } catch (error) {
      console.log(error);
    }
  }
}

function incrementSerial(serial: string): string {
  const lastChar = serial.charAt(serial.length - 1);

  let nextChar;

  if (lastChar === '9') {
    nextChar = 'A';
  } else if (lastChar >= 'A' && lastChar < 'F') {
    nextChar = String.fromCharCode(lastChar.charCodeAt(0) + 1);
  } else if (lastChar === 'F') {
    nextChar = '0';
    return incrementSerial(serial.substring(0, serial.length - 1)) + nextChar;
  } else {
    nextChar = (parseInt(lastChar, 10) + 1).toString();
  }
  return serial.substring(0, serial.length - 1) + nextChar;
}
