/* eslint-disable prettier/prettier */
import { Controller, Get } from '@nestjs/common';
import { ModelsService } from './models.service';

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
}
