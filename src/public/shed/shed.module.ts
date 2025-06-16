import { Module } from '@nestjs/common';
import { ShedService } from './shed.service';
import { ShedController } from './shed.controller';

@Module({
  providers: [ShedService],
  controllers: [ShedController]
})
export class ShedModule {}
