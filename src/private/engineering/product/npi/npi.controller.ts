/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
import { Body, Controller, Get, Post } from '@nestjs/common';
import { NpiService } from './npi.service';
import { NewProgrammingNpi } from './dto/npi.dto';

@Controller('npi')
export class NpiController {
  constructor(private readonly npiService: NpiService) {}

  @Get('view')
  async npi() {
    try {
      return await this.npiService.npi();
    } catch (error) {
      console.log(error);
    }
  }

  @Post('create')
  async newProgrammingNpi(@Body() data: NewProgrammingNpi) {
    try {
      console.log(data);
      return await this.npiService.newProgrammingNpi(data);
    } catch (error) {
      console.log(error);
    }
  }
}
