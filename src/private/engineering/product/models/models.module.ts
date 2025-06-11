/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { ModelsService } from './models.service';
import { PrismaService } from 'src/prisma/prisma.service';
import { ModelsController } from './models.controller';

@Module({
  providers: [ModelsService, PrismaService],
  controllers: [ModelsController],
})
export class ModelsModule {}
