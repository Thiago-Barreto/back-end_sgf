import { Module } from '@nestjs/common';
import { NpiService } from './npi.service';
import { NpiController } from './npi.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  providers: [NpiService, PrismaService],
  controllers: [NpiController],
})
export class NpiModule {}
