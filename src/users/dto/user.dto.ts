/* eslint-disable prettier/prettier */
export interface UserDTO {
  ID: number;
  UserID: number;
  CompleteName: string;
  AccessPassword: string | null;
  AccessLevel: string;
  email: string;
  Status: string;
  sector: string;
  hierarchy: string;
  profile: string;
  isOnline: string;
  dateLogin: Date;
  UserCad: number;
  DateCad: Date;
  userUpdate: number;
  dateUpdate: Date;
  factory: string;
  locality: string;
}

export interface CreateUserDTO {
  UserID: number;
  CompleteName: string;
  AccessPassword: string | null;
  AccessLevel: string;
  email: string;
  Status: string;
  sector: string;
  hierarchy: string;
  profile: string;
  factory: string;
  locality: string;
}

export interface SignInDTO {
  UserID: number;
  AccessPassword: string | null;
}

export interface UserUpdate {
  UserID: number;
  CompleteName: string;
  AccessPassword: string | null;
  email: string;
  profile: string;
}
