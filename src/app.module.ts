/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { UsersModule } from './users/users.module';
import { DashboardModule } from './dashboard/dashboard.module';
import { ModelsModule } from './private/engineering/product/models/models.module';
import { NpiModule } from './private/engineering/product/npi/npi.module';

@Module({
  imports: [UsersModule, DashboardModule, ModelsModule, NpiModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
