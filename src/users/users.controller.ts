/* eslint-disable prettier/prettier */
import { Body, Controller, Get, Param, Post, Put } from '@nestjs/common';
import { SignInDTO, UserDTO, UserUpdate } from './dto/user.dto';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private readonly userService: UsersService) {}

  @Post('signup')
  async create(@Body() data: UserDTO) {
    try {
      console.log(data);
      return this.userService.signUp(data);
    } catch (error) {
      console.log(error);
    }
  }

  @Post('signin')
  async signIn(@Body() data: SignInDTO) {
    try {
      console.log('Login: ', data);
      return this.userService.signIn(data);
    } catch (error) {
      console.log(error);
    }
  }

  @Put('logout/:id')
  async logout(@Param('id') id: number) {
    console.log(id);
    return this.userService.logout(id);
  }

  @Put('update/profile/:UserID')
  async updateUserProfile(
    @Param('UserID') UserID: number,
    @Body() data: UserUpdate,
  ) {
    try {
      return await this.userService.updateUserProfile(Number(UserID), data);
    } catch (error) {
      console.log(error);
    }
  }

  @Get('view')
  async viewAllUsers() {
    try {
      return await this.userService.viewUsersSystem();
    } catch (error) {
      console.log(error);
    }
  }
}
