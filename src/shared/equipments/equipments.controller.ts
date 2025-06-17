/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
import {
  Body,
  Controller,
  Get,
  HttpException,
  HttpStatus,
  Param,
  Post,
  Put,
  Query,
} from '@nestjs/common';
import { EquipmentsService } from './equipments.service';
import { EquipmentDTO, MvEquipmentDTO } from './dto/equipment.dto';

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

  @Put('update/:id')
  async updateEquipment(@Param('id') id: number, @Body() data: EquipmentDTO) {
    try {
      console.log(id, data);
      return await this.equipmentService.updateEquipment(id, data);
    } catch (error) {
      console.log(error);
    }
  }

  @Post('create/movement/exit')
  async exitMovement(@Body() data: MvEquipmentDTO) {
    try {
      const response = await this.equipmentService.exitMovement(data);
      if (!response.result) {
        throw new HttpException(
          {
            message: response.message,
            title: response.title,
            result: response.result,
          },
          HttpStatus.BAD_REQUEST,
        );
      }
      return {
        result: response.result,
        message: response.message,
        title: response.title,
      };
    } catch (error) {
      console.log(error);
      return {
        result: error.response.result,
        message: error.response.message,
        title: error.response.title,
      };
    }
  }
}
