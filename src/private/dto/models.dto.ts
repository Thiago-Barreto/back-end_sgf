/* eslint-disable prettier/prettier */
export interface ModelsDTO {
  ID: number;
  Nome: string;
  Cod_sap: string;
  Descricao: string;
  Status: string;
  Qtd_inner: number;
  Qtd_caixa: number;
  Peso_master: number;
  Peso_inner: number;
  Ean: string;
  Roteiro: string;
  ProcessLevel: string;
  FamilyType: string;
  auxPcbaType: string;
  prefixSerial: string;
  createUser: number;
}

export interface ModelsUpdateDTO {
  ID: number;
  Nome: string;
  Cod_sap: string;
  Descricao: string;
  Status: string;
  Qtd_inner: number;
  Qtd_caixa: number;
  Peso_master: number;
  Peso_inner: number;
  Ean: string;
  Roteiro: string;
  ProcessLevel: string;
  FamilyType: string;
  auxPcbaType: string;
  prefixSerial: string;
  updateUser: number;
}
