/* eslint-disable prettier/prettier */
/* eslint-disable @typescript-eslint/no-redundant-type-constituents */

export interface ProgrammingNpi {
  DateCreate: string;
  UserCreate: number;
  arrival_of_mp_and_fixture: string;
  code: string;
  date_of_the_month: string;
  description: string;
  engineering_pilot_status: string;
  estimated_engineering_pilot_date: string;
  estimated_pilot_production_date: string;
  family: string;
  halb: string;
  id: number;
  justification_engineering: null;
  justification_production: null;
  lote_and_fixture: string;
  product_class: string;
  production_pilot_status: string;
  status: 'Concluído' | 'Atrasado' | 'Em Processo' | string;
  type_of_production: string;
  type_of_shipment: string;
}
