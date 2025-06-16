/* eslint-disable prettier/prettier */
/* eslint-disable prettier/prettier */

import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateUserDTO, SignInDTO, UserUpdate } from './dto/user.dto';
import { JwtService } from '@nestjs/jwt';
import * as moment from 'moment-timezone';

moment.locale();

@Injectable()
export class UsersService {
  constructor(
    private readonly prismaService: PrismaService,
    private readonly jwtService: JwtService,
  ) {}

  async signUp(data: CreateUserDTO) {
    try {
      const userAlreadyExists =
        await this.prismaService.tracelog_users.findUnique({
          where: { UserID: Number(data.UserID) },
        });

      if (userAlreadyExists) {
        throw new UnauthorizedException('Usuário já existe.');
      }

      const user = await this.prismaService.tracelog_users.create({
        data: {
          ...data,
          UserID: Number(data.UserID),
        },
      });

      return {
        message: `Usuário '${user.CompleteName}', criado com sucesso`,
      };
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

  async signIn(data: SignInDTO) {
    try {
      const user = await this.prismaService.tracelog_users.findUnique({
        where: {
          UserID: Number(data.UserID),
          AccessPassword: data.AccessPassword,
        },
        select: {
          UserID: true,
          CompleteName: true,
          email: true,
          AccessPassword: true,
          AccessLevel: true,
          sector: true,
          hierarchy: true,
          profile: true,
          dateLogin: true,
          factory: true,
          locality: true,
        },
      });
      if (user) {
        await this.prismaService.tracelog_users.update({
          where: { UserID: Number(data.UserID) },
          data: { isOnline: 'on-line' },
        });
      }
      if (!user) {
        throw new UnauthorizedException('Credenciais inválidas.');
      }
      user.AccessPassword = '';
      const accessToken = await this.jwtService.signAsync({ data });
      return {
        message: 'Seja Bem-vindo(a).',
        token: accessToken,
        user: user,
      };
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

  async logout(id: number) {
    console.log(id);
    try {
      const user = await this.prismaService.tracelog_users.update({
        where: { UserID: Number(id) },
        data: { isOnline: 'off-line' },
      });
      console.log(user);
      return { message: 'Até a próxima' };
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

  async updateUserProfile(UserID: number, data: UserUpdate) {
    try {
      const dateFormat = moment
        .tz('America/Manaus')
        .utc()
        .subtract(4, 'hours')
        .format();

      console.log('Moment (Manaus): ', dateFormat);
      await this.prismaService.tracelog_users.update({
        data: {
          ...data,
          UserID: Number(data.UserID),
          userUpdate: UserID,
          dateUpdate: dateFormat,
        },
        where: { UserID: Number(UserID) },
      });
      return {
        message:
          'Perfil atualizado com sucesso, faça o login novamente com as credenciais novas.',
        title: 'Atualização',
      };
    } catch (error) {
      console.log(error);
      throw error;
    }
  }

  async viewUsersSystem() {
    try {
      const users = await this.prismaService.tracelog_users.findMany({
        select: {
          ID: true,
          UserID: true,
          CompleteName: true,
          AccessLevel: true,
          email: true,
          Status: true,
          sector: true,
          hierarchy: true,
          profile: true,
          isOnline: true,
          factory: true,
          locality: true,
        },
        where: {
          Status: 'ATIVO',
        },
      });
      console.log('Users: ', users);
      return users;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }
}
