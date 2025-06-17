/* eslint-disable prettier/prettier */

export interface EquipmentDTO {
  id: number;
  serial: string;
  code_sap: string;
  description: string;
  family: string;
  brand: string;
  requiresCalibration: string;
  calibrationCertificate: string;
  invoice: string;
  dataInvoice: string;
  dischargeDate: string;
  shed: string;
  status: string;
  location: string;
  calibrationDate: string;
  nextCalibration: string;
  amountEqp: number;
  UserCad: number;
  amount: number;
  product: string;
  similar: string;
  UserUpdate: number;
}

export interface MvEquipmentDTO {
  id: number;
  id_code: number;
  user_exit: number;
  date_exit: string;
  status: string;
  line: string;
  shed: string;
  shedMov: string;
  user_return: number;
  date_return: string;
}
