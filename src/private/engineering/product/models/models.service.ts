/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import * as moment from 'moment-timezone';
import { PrismaService } from 'src/prisma/prisma.service';
import { ModelsDTO, ModelsUpdateDTO } from 'src/private/dto/models.dto';

@Injectable()
export class ModelsService {
  constructor(private readonly prismaService: PrismaService) {}

  async models() {
    try {
      const models = await this.prismaService.packing_modelo.findMany({
        select: {
          ID: true,
          Nome: true,
          Cod_sap: true,
          Descricao: true,
          Status: true,
          Qtd_inner: true,
          Qtd_caixa: true,
          Peso_master: true,
          Peso_inner: true,
          Ean: true,
          Roteiro: true,
          ProcessLevel: true,
          FamilyType: true,
          auxPcbaType: true,
          prefixSerial: true,
          createUser: true,
          createDate: true,
        },
      });
      return models;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

  async newModel(data: ModelsDTO) {
    try {
      console.log('Chegando: ', data);

      const dateFormat = moment
        .tz('America/Manaus')
        .utc()
        .subtract(4, 'hours')
        .format();

      await this.prismaService.packing_modelo.create({
        data: {
          ...data,
          Qtd_caixa: Number(data.Qtd_caixa),
          Qtd_inner: Number(data.Qtd_inner),
          Peso_master: Number(data.Peso_master),
          Peso_inner: Number(data.Peso_inner),
          createUser: data.createUser,
          createDate: dateFormat,
          Status: 'ATIVO',
        },
      });

      return {
        message: 'Modelo criado com sucesso!',
        title: 'Novo modelo',
      };
    } catch (error) {
      console.log('Aqui: ', error);
      if (error.code === 'P2002') {
        throw new HttpException(
          {
            success: false,
            message: 'Modelo já cadastrado.',
            title: 'Duplicado',
          },
          HttpStatus.CONFLICT,
        );
      }
    }
  }

  async updateModel(ID: number, data: ModelsUpdateDTO) {
    try {
      console.log(ID, data);
      await this.prismaService.packing_modelo.update({
        data: {
          ...data,
          Qtd_caixa: Number(data.Qtd_caixa),
          Qtd_inner: Number(data.Qtd_inner),
          Peso_master: Number(data.Peso_master),
          Peso_inner: Number(data.Peso_inner),
          updateUser: data.updateUser,
          updateDate: moment
            .tz('America/Manaus')
            .utc()
            .subtract(4, 'hours')
            .format(),
        },
        where: { ID: Number(ID) },
      });
      return {
        message: 'Modelo atualizado com sucesso!',
        title: 'Atualização',
      };
    } catch (error) {
      console.log(error);
      if (error.code === 'P2002') {
        throw new HttpException(
          {
            success: false,
            message:
              'Não pode atualizar o código do SAP para outro já existente.',
            title: 'Duplicidade',
          },
          HttpStatus.CONFLICT,
        );
      }
    }
  }
}
