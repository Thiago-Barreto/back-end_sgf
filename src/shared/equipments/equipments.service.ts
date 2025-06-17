/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */

import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { EquipmentDTO, MvEquipmentDTO } from './dto/equipment.dto';
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
        sector === 'System Developer'
          ? {}
          : { sector: sector, status: { not: 'DESATIVADO' } };
      const equipments = await this.prismaService.equipment.findMany({
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
            code_sap: data.code_sap,
            invoice: data.invoice,
            dataInvoice: data.invoice === '' ? null : dateFormatLocal,
            description: data.description,
            family: data.family,
            product: data.product,
            amount: Number(data.amount),
            brand: data.brand,
            requiresCalibration: data.requiresCalibration,
            shed: data.shed,
            location: data.location,
            status: 'Bom',
            sector: sector,
            UserCad: data.UserCad,
            DateCad: dateFormatLocal,
          },
        });

        currentSerial = newSerial;
      }

      return {
        message: `Equipamentos para o código '${data.code_sap}', cadastrados com sucesso.`,
        title: 'Equipamentos Cadastrados',
      };
    } catch (error) {
      console.log(error);
    }
  }

  async updateEquipment(id: number, data: EquipmentDTO) {
    try {
      console.log(id, data);

      await this.prismaService.equipment.update({
        where: {
          id: Number(id),
        },
        data: {
          ...data,
          nextCalibration:
            data.nextCalibration === '' ? null : data.nextCalibration,
          UserUpdate: data.UserUpdate,
          DateUpdate: dateFormatLocal,
        },
      });

      return {
        message: 'Equipamento atualizado com sucesso.',
        title: 'Atualização',
      };
    } catch (error) {
      console.log(error);
    }
  }

  async exitMovement(data: MvEquipmentDTO) {
    try {
      const alreadyEqpActive = await this.prismaService.mov_eqp.findMany({
        where: {
          id_code: data.id,
          status: 'ATIVO',
        },
      });
      if (alreadyEqpActive.length > 0) {
        return {
          result: false,
          message: `Não foi possível realizar a movimentação, o equipamento já está 'ATIVO' na linha '${alreadyEqpActive[0]?.line}'`,
          title: 'Equipamento em Linha',
        };
      }

      await this.prismaService.mov_eqp.create({
        data: {
          id_code: data.id,
          user_exit: data.user_exit,
          date_exit: dateFormatLocal,
          status: 'ATIVO',
          line: data.line,
          shed: data.shed,
          user_return: data.user_return !== 0 ? Number(data.user_return) : null,
          date_return: data.user_return !== 0 ? dateFormatLocal : null,
        },
      });
      await this.prismaService.equipment.update({
        where: {
          id: data.id,
        },
        data: {
          status: 'ATIVO',
          location: data.line,
        },
      });
      return {
        result: 201,
        message:
          'Movimentação de equipamento realizada, acompanhe o retorno no modulo de movimentações.',
        title: 'Movimentação realizada',
      };
    } catch (error) {
      console.log(error);
      return {
        result: false,
        message:
          'Erro ao processar a movimentação. Se o erro persistir, entrar em contato com a Eng. de Software, IMEDIATAMENTE.',
        title: 'Erro desconhecido',
      };
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
