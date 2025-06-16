import { Module } from '@nestjs/common';
import { EquipmentsService } from './equipments.service';
import { PrismaService } from 'src/prisma/prisma.service';
import { EquipmentsController } from './equipments.controller';

@Module({
  providers: [EquipmentsService, PrismaService],
  controllers: [EquipmentsController],
})
export class EquipmentsModule {}
