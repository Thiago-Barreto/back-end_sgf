/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
import {
  Body,
  Controller,
  Get,
  HttpException,
  HttpStatus,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { ModelsService } from './models.service';
import { ModelsDTO, ModelsUpdateDTO } from 'src/private/dto/models.dto';

@Controller('models')
export class ModelsController {
  constructor(private readonly modelsService: ModelsService) {}

  @Get('view')
  async viewAllModels() {
    try {
      return await this.modelsService.models();
    } catch (error) {
      console.log(error);
    }
  }

  @Post('create')
  async newModel(@Body() data: ModelsDTO) {
    try {
      console.log(data);
      return await this.modelsService.newModel(data);
    } catch (error) {
      console.log(error);
      throw new HttpException(
        {
          success: false,
          message: error.response.message,
          title: error.response.title,
        },
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  @Put('update/:ID')
  async updateModel(@Param('ID') ID: number, @Body() data: ModelsUpdateDTO) {
    try {
      console.log('ID: ', ID, 'Body: ', data);
      return await this.modelsService.updateModel(Number(ID), data);
    } catch (error) {
      console.log(error);
      throw new HttpException(
        {
          success: false,
          message: error.response.message,
          title: error.response.title,
        },
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
