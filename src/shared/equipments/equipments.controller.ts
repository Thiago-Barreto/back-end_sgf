/* eslint-disable prettier/prettier */
import { Body, Controller, Get, Post, Query } from '@nestjs/common';
import { EquipmentsService } from './equipments.service';
import { EquipmentDTO } from './dto/equipment.dto';

@Controller('equipments')
export class EquipmentsController {
  constructor(private readonly equipmentService: EquipmentsService) {}

  @Get('view')
  async viewEquipment(@Query('sector') sector: string) {
    try {
      return await this.equipmentService.equipments(sector);
    } catch (error) {
      console.log(error);
    }
  }

  @Post('create')
  async createEquipments(
    @Query('sector') sector: string,
    @Query('locality') locality: string,
    @Query('factory') factory: string,
    @Body() data: EquipmentDTO,
  ) {
    try {
      return await this.equipmentService.createEquipment(
        sector,
        locality,
        factory,
        data,
      );
    } catch (error) {
      console.log(error);
    }
  }
}
