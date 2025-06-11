/* eslint-disable prettier/prettier */
import { Controller, Get, Query } from '@nestjs/common';
import { DashboardService } from './dashboard.service';

@Controller('dashboard')
export class DashboardController {
  constructor(private readonly dashboardService: DashboardService) {}

  @Get('npi')
  async npi(@Query('month') month: number) {
    try {
      return await this.dashboardService.npi(month);
    } catch (error) {
      console.log(error);
    }
  }
}
