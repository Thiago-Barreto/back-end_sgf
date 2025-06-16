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
}
