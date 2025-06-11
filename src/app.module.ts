/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { UsersModule } from './users/users.module';
import { DashboardModule } from './dashboard/dashboard.module';
import { ModelsModule } from './private/engineering/product/models/models.module';

@Module({
  imports: [UsersModule, DashboardModule, ModelsModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
