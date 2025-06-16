/* eslint-disable prettier/prettier */

import { Controller, Get } from '@nestjs/common';
import { FamilyService } from './family.service';

@Controller('family')
export class FamilyController {
  constructor(private readonly familyService: FamilyService) {}

  @Get('view')
  async viewFamily() {
    try {
      return await this.familyService.family();
    } catch (error) {
      console.log(error);
    }
  }
}
