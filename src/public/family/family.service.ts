/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */

import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class FamilyService {
  constructor(private readonly prismaService: PrismaService) {}

  async family() {
    try {
      const family = await this.prismaService.packing_modelo.findMany({
        select: {
          FamilyType: true,
        },
        distinct: ['FamilyType'],
      });
      return family;
    } catch (error) {
      console.log(error);
    }
  }
}
