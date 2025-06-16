/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { UsersModule } from './users/users.module';
import { DashboardModule } from './dashboard/dashboard.module';
import { ModelsModule } from './private/engineering/product/models/models.module';
import { NpiModule } from './private/engineering/product/npi/npi.module';
import { EquipmentsModule } from './shared/equipments/equipments.module';
import { FamilyModule } from './public/family/family.module';
import { ShedModule } from './public/shed/shed.module';
import { SupplierModule } from './public/supplier/supplier.module';

@Module({
  imports: [
    UsersModule,
    DashboardModule,
    ModelsModule,
    NpiModule,
    EquipmentsModule,
    FamilyModule,
    ShedModule,
    SupplierModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
