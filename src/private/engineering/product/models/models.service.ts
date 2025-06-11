/* eslint-disable prettier/prettier */
/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

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
      console.log(models);
      return models;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }
}
