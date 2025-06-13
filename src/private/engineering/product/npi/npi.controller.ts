/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
import { Body, Controller, Get, Param, Post, Put } from '@nestjs/common';
import { NpiService } from './npi.service';
import { NewProgrammingNpi, UpdateProgrammingNpi } from './dto/npi.dto';

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
      // console.log(data);
      return await this.npiService.newProgrammingNpi(data);
    } catch (error) {
      console.log(error);
    }
  }

  @Put('update/:id')
  async updateProgrammingNpi(
    @Param('id') id: number,
    @Body() data: UpdateProgrammingNpi,
  ) {
    try {
      return await this.npiService.updateProgrammingNpi(id, data);
    } catch (error) {
      console.log(error);
    }
  }
}
