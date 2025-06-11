-- CreateTable
CREATE TABLE `CameraDefects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(10) NOT NULL,
    `description` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SGF_setup_control` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `line` VARCHAR(45) NOT NULL,
    `current_product` VARCHAR(150) NOT NULL,
    `product_setup` VARCHAR(150) NOT NULL,
    `requester` INTEGER NOT NULL,
    `responsible` INTEGER NOT NULL,
    `setup_type` VARCHAR(50) NOT NULL,
    `setup_start_date` DATETIME(0) NULL,
    `UserStart` INTEGER NULL,
    `setup_end_date` DATETIME(0) NULL,
    `UserEnd` INTEGER NULL,
    `interval_between_times` VARCHAR(100) NULL,
    `observations` TEXT NULL,
    `status` VARCHAR(100) NOT NULL,
    `CreateUser` INTEGER NOT NULL,
    `CreateDate` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SoundBoxDefects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(10) NOT NULL,
    `description` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TVDefects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(10) NOT NULL,
    `description` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `accesscontrol_devices` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) NULL,
    `location` VARCHAR(10) NULL,
    `ipConfig` VARCHAR(20) NOT NULL,

    UNIQUE INDEX `accesscontrol_devices_IPConfig_IDX`(`ipConfig`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `accesscontrol_measdata` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `device` INTEGER NULL,
    `unixdate` INTEGER NULL,
    `datetime` DATETIME(0) NULL,
    `rsg` INTEGER NULL,
    `rsl` INTEGER NULL,
    `rsr` INTEGER NULL,
    `rhg` INTEGER NULL,
    `erg` VARCHAR(3) NULL,
    `msg` VARCHAR(100) NULL,
    `userid` VARCHAR(30) NULL,
    `tmp` FLOAT NULL,
    `hum` FLOAT NULL,
    `username` VARCHAR(100) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `accesscontrol_user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` VARCHAR(50) NOT NULL,
    `userName` VARCHAR(100) NOT NULL,
    `profile` INTEGER NOT NULL DEFAULT 1,
    `print` INTEGER NOT NULL DEFAULT 1,
    `creationUser` INTEGER NULL,
    `creationDate` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateUser` INTEGER NULL,
    `updateDate` DATETIME(0) NULL,
    `status` VARCHAR(15) NOT NULL DEFAULT 'ATIVO',

    UNIQUE INDEX `userId`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `brc_packing_label_package` (
    `loteID` INTEGER NOT NULL,
    `productBom` VARCHAR(5) NOT NULL,
    `productSku` VARCHAR(50) NOT NULL,
    `peso` DOUBLE NOT NULL DEFAULT 0,
    `ordemProducao` VARCHAR(30) NULL,
    `dataStart` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `dataEnd` DATETIME(0) NULL,
    `userCreate` INTEGER NULL,
    `userPrint` INTEGER NULL,
    `status` VARCHAR(20) NULL DEFAULT 'ABERTO',

    INDEX `brc_packing_label_package_brc_packing_label_produto_FK`(`productBom`, `productSku`),
    PRIMARY KEY (`loteID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `brc_packing_label_produto` (
    `bom` VARCHAR(5) NOT NULL,
    `sku` VARCHAR(50) NOT NULL,
    `bomCode` VARCHAR(50) NOT NULL,
    `skuDescription` VARCHAR(100) NOT NULL,
    `innerQtd` INTEGER NOT NULL,
    `boxQtd` INTEGER NOT NULL,
    `status` VARCHAR(20) NOT NULL,
    `createDate` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `createUser` INTEGER NOT NULL,
    `updateDate` DATETIME(0) NULL,
    `updateUser` INTEGER NULL,
    `family` VARCHAR(3) NULL,
    `innerHeight` FLOAT NULL,
    `heightTolerance` FLOAT NULL,
    `packingType` VARCHAR(20) NOT NULL,
    `packingSn` VARCHAR(50) NULL,

    PRIMARY KEY (`bom`, `sku`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `brc_packing_label_registros` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bomId` VARCHAR(5) NOT NULL,
    `serialNumber` VARCHAR(30) NOT NULL,
    `loteID` INTEGER NOT NULL,
    `boxPosition` VARCHAR(100) NULL,
    `lineId` VARCHAR(10) NOT NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userID` INTEGER NOT NULL,
    `innerPeso` DECIMAL(10, 0) NULL,
    `status` VARCHAR(10) NULL DEFAULT 'PASS',
    `bom` VARCHAR(100) NULL,
    `sku` VARCHAR(100) NULL,

    UNIQUE INDEX `brc_packing_label_registros_unique`(`serialNumber`),
    INDEX `brc_packing_label_registros_brc_packing_label_package_FK`(`loteID`),
    INDEX `brc_packing_label_registros_brc_packing_label_produto_FK`(`bomId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `brc_packing_label_update_changes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bom` VARCHAR(5) NULL,
    `sku` VARCHAR(50) NULL,
    `bomCode` VARCHAR(50) NULL,
    `skuDescription` VARCHAR(100) NULL,
    `innerQtd` INTEGER NULL,
    `boxQtd` INTEGER NULL,
    `status` VARCHAR(20) NULL,
    `createDate` DATETIME(0) NULL,
    `createUser` INTEGER NULL,
    `updateDate` DATETIME(0) NULL,
    `updateUser` INTEGER NULL,
    `family` VARCHAR(3) NULL,
    `innerHeight` FLOAT NULL,
    `heightTolerance` FLOAT NULL,
    `changeType` VARCHAR(50) NULL,
    `packingType` VARCHAR(20) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `brc_remessa_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Produto` VARCHAR(30) NOT NULL,
    `Remessa` VARCHAR(50) NOT NULL,
    `Data` DATETIME(0) NOT NULL,
    `SerialNumber` VARCHAR(50) NOT NULL,
    `DataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `Status` VARCHAR(30) NULL DEFAULT 'FATURADO',

    UNIQUE INDEX `brc_remessa_history_unique`(`SerialNumber`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `brc_ssd_external_test` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `SerialNumber` VARCHAR(20) NOT NULL,
    `SerialSub` VARCHAR(20) NOT NULL,
    `Result` VARCHAR(10) NOT NULL,
    `UserID` INTEGER NOT NULL,
    `DataIn` DATETIME(0) NOT NULL,
    `FinalSnGeneratedDate` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `center_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `center` INTEGER NOT NULL,

    UNIQUE INDEX `center`(`center`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `centro_at` (
    `id` INTEGER NULL,
    `centro` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`centro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `control_sp_pedidos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(60) NOT NULL,
    `description` VARCHAR(190) NOT NULL,
    `dataIn` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `UserCad` INTEGER NOT NULL,
    `DateCad` DATETIME(0) NOT NULL,
    `rcAprovada` VARCHAR(100) NULL,
    `dataRcAprovada` DATETIME(0) NULL,
    `regPedido` VARCHAR(100) NULL,
    `userPedido` VARCHAR(10) NULL,
    `dataPedido` DATETIME(0) NULL,
    `notaFiscal` VARCHAR(50) NULL,
    `quantidadeNf` INTEGER NULL,
    `nfData` DATETIME(0) NULL,
    `userNf` VARCHAR(10) NULL,
    `status` VARCHAR(90) NOT NULL,
    `modality` VARCHAR(90) NULL,
    `dataChegada` DATE NULL,
    `sector` VARCHAR(100) NOT NULL,

    INDEX `code`(`code`),
    INDEX `description`(`description`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `defect_control` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial_number` VARCHAR(100) NOT NULL,
    `defect` VARCHAR(150) NOT NULL,
    `cause` VARCHAR(200) NOT NULL,
    `model` VARCHAR(100) NOT NULL,
    `shift` VARCHAR(100) NOT NULL,
    `technical_entry` INTEGER NOT NULL,
    `data_entry` DATETIME(0) NOT NULL,
    `observation` TEXT NULL,
    `technical_exit` INTEGER NULL,
    `data_exit` DATETIME(0) NULL,
    `date_search` DATE NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `deposit_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `deposit` VARCHAR(30) NOT NULL,

    UNIQUE INDEX `deposit`(`deposit`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `deposito_at` (
    `id` INTEGER NULL,
    `deposito` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`deposito`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `eqp_option` (
    `ideqp_option` INTEGER NOT NULL,
    `eqp_sn` VARCHAR(45) NULL,
    `lic_type` VARCHAR(45) NULL,
    `lic_code` VARCHAR(45) NULL,
    `lic_description` VARCHAR(45) NULL,
    `eqp_optioncol` VARCHAR(45) NULL,

    INDEX `pk_eqp_option_serial_idx`(`eqp_sn`),
    PRIMARY KEY (`ideqp_option`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `equipamentos` (
    `idequipamentos` INTEGER NOT NULL AUTO_INCREMENT,
    `serial_number` VARCHAR(45) NULL,
    `nome` VARCHAR(45) NULL,
    `modelo` VARCHAR(45) NULL,
    `fabricante` VARCHAR(45) NULL,
    `requer_cal` VARCHAR(15) NULL,
    `calib_certificado` VARCHAR(45) NULL,
    `opc_code` INTEGER NULL,
    `nota_fiscal` VARCHAR(45) NULL,
    `data_nf` DATETIME(0) NULL,
    `data_baixa` DATETIME(0) NULL,
    `status` VARCHAR(45) NULL,
    `localizacao` VARCHAR(45) NULL,
    `data_calibracao` DATE NULL,
    `prox_calibracao` DATE NULL,
    `galpao` VARCHAR(45) NULL,
    `UserCad` VARCHAR(100) NULL,
    `DataCad` DATETIME(0) NULL,
    `UserUpdate` VARCHAR(100) NULL,
    `DataUpdate` DATETIME(0) NULL,

    UNIQUE INDEX `serial_number_UNIQUE`(`serial_number`),
    PRIMARY KEY (`idequipamentos`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `equipment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial` VARCHAR(30) NOT NULL,
    `code_sap` VARCHAR(40) NULL,
    `description` VARCHAR(80) NOT NULL,
    `family` VARCHAR(45) NOT NULL,
    `brand` VARCHAR(60) NOT NULL,
    `requiresCalibration` VARCHAR(15) NULL,
    `calibrationCertificate` VARCHAR(60) NULL,
    `invoice` VARCHAR(80) NULL,
    `dataInvoice` DATE NULL,
    `dischargeDate` DATETIME(0) NULL,
    `shed` VARCHAR(20) NOT NULL,
    `status` VARCHAR(20) NOT NULL,
    `location` VARCHAR(45) NOT NULL,
    `calibrationDate` DATE NULL,
    `nextCalibration` DATE NULL,
    `UserCad` INTEGER NULL,
    `DateCad` DATETIME(0) NULL,
    `UserUpdate` INTEGER NULL,
    `DateUpdate` DATETIME(0) NULL,
    `sector` VARCHAR(25) NOT NULL,

    UNIQUE INDEX `unique_serial`(`serial`),
    INDEX `brand`(`brand`),
    INDEX `family`(`family`),
    INDEX `shed`(`shed`),
    INDEX `status`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `equipments_process` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(15) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `location` VARCHAR(100) NOT NULL,
    `shed` VARCHAR(20) NOT NULL,
    `supplier` VARCHAR(60) NOT NULL,
    `calibration_required` VARCHAR(4) NOT NULL,
    `calibration_certificate` VARCHAR(150) NOT NULL,
    `nf` INTEGER NOT NULL,
    `date_of_discharge` DATETIME(0) NULL,
    `calibration_date` DATETIME(0) NULL,
    `next_calibration` DATETIME(0) NULL,
    `user_cad` INTEGER NOT NULL,
    `date_cad` DATETIME(0) NOT NULL,
    `user_up` INTEGER NOT NULL,
    `date_up` DATETIME(0) NOT NULL,

    UNIQUE INDEX `code`(`code`),
    INDEX `shed`(`shed`),
    INDEX `supplier`(`supplier`),
    INDEX `user_cad`(`user_cad`),
    INDEX `user_up`(`user_up`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `family` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `family` VARCHAR(45) NOT NULL,
    `status` VARCHAR(10) NOT NULL,
    `UserCad` INTEGER NULL,
    `DateCad` DATETIME(0) NULL,
    `UserUpdate` INTEGER NULL,
    `DateUpdate` DATETIME(0) NULL,

    UNIQUE INDEX `unique_family`(`family`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fornecedor` (
    `idfornecedor` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NULL,
    `nome_fantasia` VARCHAR(45) NULL,
    `contato` VARCHAR(45) NULL,
    `email` VARCHAR(100) NULL,
    `origem` VARCHAR(45) NULL,
    `data` DATETIME(0) NULL,

    UNIQUE INDEX `nome_fantasia_UNIQUE`(`nome_fantasia`),
    PRIMARY KEY (`idfornecedor`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `historico_tecnicos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tecnico_id` INTEGER NULL,
    `action_type` ENUM('update', 'delete') NULL,
    `action_timestamp` DATETIME(0) NULL,
    `details` TEXT NULL,

    INDEX `tecnico_id`(`tecnico_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `inspection` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `embarque` VARCHAR(60) NULL,
    `code` VARCHAR(60) NULL,
    `partNumberFornec` INTEGER NULL,
    `description` VARCHAR(40) NULL,
    `quantity` INTEGER NULL,
    `packgeQuantity` INTEGER NULL,
    `dateFilter` DATE NULL,

    UNIQUE INDEX `unique_code_inspection`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `jig_test` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial` VARCHAR(30) NULL,
    `description` VARCHAR(250) NULL,
    `codeSAP` VARCHAR(40) NULL,
    `product` VARCHAR(190) NULL,
    `family` VARCHAR(45) NULL,
    `brand` VARCHAR(60) NULL,
    `location` VARCHAR(45) NULL,
    `valueJig` DECIMAL(10, 2) NULL,
    `nf` VARCHAR(20) NULL,
    `po` VARCHAR(20) NULL,
    `dateOfCharged` DATE NULL,
    `shed` VARCHAR(20) NULL,
    `status` VARCHAR(20) NULL,
    `UserCad` INTEGER NULL,
    `DateCad` DATETIME(0) NULL,
    `UserUpdate` INTEGER NULL,
    `DateUpdate` DATETIME(0) NULL,
    `sector` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `serial`(`serial`),
    INDEX `brand`(`brand`),
    INDEX `family`(`family`),
    INDEX `product`(`product`),
    INDEX `shed`(`shed`),
    INDEX `status`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lcdRecovery` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial` VARCHAR(40) NOT NULL,
    `material` VARCHAR(40) NOT NULL,
    `process` VARCHAR(40) NOT NULL,
    `Product` VARCHAR(40) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `unitaryValue` INTEGER NOT NULL,
    `amount` INTEGER NOT NULL,
    `status` VARCHAR(40) NOT NULL,
    `userCad` VARCHAR(40) NOT NULL,
    `dataCad` DATETIME(0) NOT NULL,
    `userUpdate` VARCHAR(40) NOT NULL,
    `dataUpdate` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `linesetup_tool_path` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `modelName` VARCHAR(50) NOT NULL,
    `embarque` VARCHAR(15) NOT NULL,
    `softPath` VARCHAR(300) NOT NULL,
    `softName` VARCHAR(100) NOT NULL,
    `toolPath` VARCHAR(300) NULL,
    `scriptPath` VARCHAR(300) NULL,
    `createUser` VARCHAR(20) NOT NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `status` VARCHAR(20) NOT NULL DEFAULT 'EM USO',

    UNIQUE INDEX `linesetup_tool_path_unique`(`embarque`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `linha_prod` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `line` VARCHAR(45) NULL,

    UNIQUE INDEX `unique_line`(`line`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `material_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `material` VARCHAR(100) NULL,
    `UserCad` VARCHAR(100) NULL,
    `DataCad` DATETIME(0) NULL,

    UNIQUE INDEX `material_at_unique`(`material`),
    INDEX `material`(`material`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mov_eqp` (
    `idmov_entrada` INTEGER NOT NULL AUTO_INCREMENT,
    `destino_ini` VARCHAR(45) NULL,
    `destino_final` VARCHAR(45) NULL,
    `galpao` VARCHAR(45) NULL,
    `tipo` VARCHAR(45) NULL,
    `data` DATETIME(0) NULL,
    `usuario` VARCHAR(45) NULL,
    `serial` VARCHAR(45) NULL,

    PRIMARY KEY (`idmov_entrada`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mov_jigs` (
    `idmov_tools` INTEGER NOT NULL AUTO_INCREMENT,
    `eqp_type` VARCHAR(45) NULL,
    `local_ini` VARCHAR(45) NULL,
    `local_destino` VARCHAR(45) NULL,
    `eqp_code` VARCHAR(45) NULL,
    `data_mov` DATETIME(0) NULL,
    `mov_type` VARCHAR(45) NULL,
    `galpao` VARCHAR(15) NULL,
    `user` VARCHAR(45) NULL,

    PRIMARY KEY (`idmov_tools`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mov_spare_part` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(50) NULL,
    `description` VARCHAR(80) NOT NULL,
    `line` VARCHAR(20) NOT NULL,
    `amountMov` INTEGER NOT NULL,
    `shed` VARCHAR(20) NOT NULL,
    `commentsMov` VARCHAR(200) NULL,
    `status` VARCHAR(20) NOT NULL,
    `UserCad` INTEGER NULL,
    `DateCad` DATETIME(0) NULL,
    `UserReturn` INTEGER NULL,
    `DateReturn` DATETIME(0) NULL,
    `dateSearch` DATE NOT NULL,
    `oneWay` VARCHAR(6) NOT NULL,
    `sector` VARCHAR(100) NOT NULL,

    INDEX `description`(`description`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ns_check_ddr` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER NULL,
    `Line` VARCHAR(10) NULL,
    `SerialNumber` VARCHAR(45) NOT NULL,
    `DataIn` DATETIME(0) NULL,
    `DataFail` DATETIME(0) NULL,
    `Status` VARCHAR(10) NULL,

    UNIQUE INDEX `SerialNumber_UNIQUE`(`SerialNumber`),
    INDEX `fk_userID_idx`(`UserID`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `packing_embarque` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `Modelo` VARCHAR(30) NOT NULL,
    `Processo` VARCHAR(30) NULL,
    `QTD` INTEGER NULL,
    `SwVersion` VARCHAR(100) NULL,
    `status` VARCHAR(20) NOT NULL DEFAULT 'ATIVO',

    UNIQUE INDEX `packing_embarque_UN`(`Processo`),
    INDEX `packing_embarque_FK`(`Modelo`),
    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `packing_linha` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `LinhaID` VARCHAR(10) NOT NULL,
    `Status` VARCHAR(30) NULL,

    UNIQUE INDEX `LinhaID`(`LinhaID`),
    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `packing_modelo` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(30) NOT NULL,
    `Cod_sap` VARCHAR(30) NULL,
    `Descricao` VARCHAR(90) NULL,
    `Status` VARCHAR(30) NOT NULL DEFAULT 'ATIVO',
    `Qtd_inner` INTEGER NULL DEFAULT 1,
    `Qtd_caixa` INTEGER NULL DEFAULT 1,
    `Peso_master` FLOAT NULL DEFAULT 0,
    `Peso_inner` FLOAT NULL DEFAULT 0,
    `Ean` VARCHAR(100) NULL,
    `Roteiro` VARCHAR(30) NULL,
    `ProcessLevel` VARCHAR(8) NULL,
    `FamilyType` VARCHAR(50) NULL,
    `auxPcbaType` VARCHAR(30) NULL DEFAULT 'INTEGRATED',
    `prefixSerial` VARCHAR(50) NULL DEFAULT '',
    `createUser` INTEGER NULL,
    `createDate` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updateUser` INTEGER NULL,
    `updateDate` DATETIME(0) NULL,

    UNIQUE INDEX `packing_modelo_UN`(`Cod_sap`),
    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `packing_nome_estacao` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `Sigla` VARCHAR(30) NOT NULL,
    `Descricao` VARCHAR(30) NULL,
    `Status` VARCHAR(30) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `packing_registro_sn` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `SN` VARCHAR(20) NOT NULL,
    `CaixaBox` VARCHAR(30) NULL,
    `Modelo` VARCHAR(30) NULL,
    `Embarque` VARCHAR(30) NULL,
    `Data_embalagem` VARCHAR(30) NULL,
    `Linha` VARCHAR(30) NULL,
    `ID_Operacional` VARCHAR(30) NULL,

    UNIQUE INDEX `SN`(`SN`),
    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `packing_roteiro` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(30) NOT NULL,
    `Rota` VARCHAR(30) NULL,
    `Status` VARCHAR(30) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plate_defects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(6) NOT NULL,
    `description` VARCHAR(155) NULL,

    UNIQUE INDEX `plate_defects_unique_1`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plates_model` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `model` VARCHAR(75) NULL,

    UNIQUE INDEX `model_UNIQUE`(`model`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `process_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `process` VARCHAR(30) NOT NULL,

    UNIQUE INDEX `process`(`process`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `process_products` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial` VARCHAR(55) NULL,
    `description` VARCHAR(110) NULL,
    `amount` INTEGER NULL,
    `galpao` VARCHAR(100) NULL,
    `observation` VARCHAR(200) NULL,
    `image` VARCHAR(255) NULL,
    `UserCad` VARCHAR(100) NULL,
    `DataCad` DATETIME(0) NULL,
    `UserUpdate` VARCHAR(100) NULL,
    `DataUpdate` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `process_products_mov` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(160) NULL,
    `line` VARCHAR(100) NULL,
    `galpao` VARCHAR(100) NULL,
    `amount` INTEGER NULL,
    `UserCad` VARCHAR(45) NULL,
    `DataCad` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `processo_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `processo` VARCHAR(100) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `boarding` VARCHAR(30) NULL,
    `product` VARCHAR(190) NOT NULL,
    `family` VARCHAR(45) NOT NULL,
    `brand` VARCHAR(60) NULL,
    `codeSAP` VARCHAR(45) NULL,
    `shed` VARCHAR(20) NULL,
    `location` VARCHAR(45) NULL,
    `status` VARCHAR(20) NULL,
    `similar` VARCHAR(255) NULL,
    `UserCad` INTEGER NULL,
    `DateCad` DATETIME(0) NULL,
    `UserUpdate` INTEGER NULL,
    `DateUpdate` DATETIME(0) NULL,

    INDEX `brand`(`brand`),
    INDEX `family`(`family`),
    INDEX `shed`(`shed`),
    INDEX `status`(`status`),
    UNIQUE INDEX `unique_product_shed`(`product`, `shed`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `product` VARCHAR(30) NOT NULL,

    UNIQUE INDEX `product`(`product`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products_process` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial` VARCHAR(55) NOT NULL,
    `description` VARCHAR(110) NOT NULL,
    `amount` INTEGER NOT NULL,
    `shed` VARCHAR(20) NULL,
    `observation` VARCHAR(200) NULL,
    `image` VARCHAR(255) NULL,
    `minimumStock` INTEGER NOT NULL,
    `location` VARCHAR(80) NOT NULL,
    `UserCad` VARCHAR(100) NULL,
    `DataCad` DATETIME(0) NULL,
    `UserUpdate` VARCHAR(100) NULL,
    `DataUpdate` DATETIME(0) NULL,
    `status` VARCHAR(255) NULL,

    INDEX `shed`(`shed`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `produto` (
    `idproduto` INTEGER NOT NULL AUTO_INCREMENT,
    `embarque` VARCHAR(45) NULL,
    `descricao` VARCHAR(255) NULL,
    `linhacomercial` VARCHAR(45) NULL,
    `modelo` VARCHAR(45) NOT NULL,
    `nome_fantasia` VARCHAR(45) NULL,
    `codextrema` VARCHAR(45) NOT NULL,
    `galpao` VARCHAR(100) NULL,
    `UserCad` VARCHAR(100) NULL,
    `DataCad` DATETIME(0) NULL,
    `UserUpdate` VARCHAR(100) NULL,
    `DataUpdate` VARCHAR(100) NULL,

    UNIQUE INDEX `descricao`(`descricao`),
    PRIMARY KEY (`idproduto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `produto_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `produto` VARCHAR(100) NULL,
    `UserCad` VARCHAR(100) NULL,
    `DataCad` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `programming_npi` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(100) NOT NULL,
    `family` VARCHAR(20) NOT NULL,
    `description` VARCHAR(150) NOT NULL,
    `type_of_shipment` VARCHAR(5) NOT NULL,
    `type_of_production` VARCHAR(100) NOT NULL,
    `product_class` VARCHAR(10) NOT NULL,
    `lote_and_fixture` VARCHAR(20) NOT NULL,
    `arrival_of_mp_and_fixture` VARCHAR(100) NOT NULL,
    `halb` VARCHAR(250) NOT NULL,
    `estimated_engineering_pilot_date` DATE NULL,
    `estimated_pilot_production_date` DATE NULL,
    `status` VARCHAR(20) NOT NULL,
    `UserCreate` INTEGER NOT NULL,
    `DateCreate` DATETIME(0) NOT NULL,
    `justification_engineering` TEXT NULL,
    `engineering_pilot_status` VARCHAR(20) NULL,
    `production_pilot_status` VARCHAR(20) NULL,
    `justification_production` TEXT NULL,
    `date_of_the_month` DATE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `programming_npi_support` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(100) NOT NULL,
    `family` VARCHAR(20) NOT NULL,
    `description` VARCHAR(150) NOT NULL,
    `type_of_shipment` VARCHAR(5) NOT NULL,
    `type_of_production` VARCHAR(100) NOT NULL,
    `product_class` VARCHAR(10) NOT NULL,
    `lote_and_fixture` VARCHAR(20) NOT NULL,
    `arrival_of_mp_and_fixture` VARCHAR(100) NOT NULL,
    `estimated_engineering_pilot_date` DATE NULL,
    `estimated_pilot_production_date` DATE NULL,
    `status` VARCHAR(20) NOT NULL,
    `UserCreate` INTEGER NOT NULL,
    `DateCreate` DATETIME(0) NOT NULL,
    `justification_engineering` TEXT NULL,
    `engineering_pilot_status` VARCHAR(20) NULL,
    `production_pilot_status` VARCHAR(20) NULL,
    `justification_production` TEXT NULL,
    `halb` VARCHAR(250) NOT NULL,
    `UserUpdate` INTEGER NOT NULL,
    `DateUpdate` DATETIME(0) NULL,
    `date_of_the_month` DATE NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reg_calib_eqp` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial_number` VARCHAR(45) NULL,
    `desc_eqp` VARCHAR(45) NULL,
    `certificado_antigo` VARCHAR(45) NULL,
    `certificado_novo` VARCHAR(45) NULL,
    `calibracao_atual` DATE NULL,
    `proxima_calibracao` DATE NULL,
    `data_registro` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `relatorio_diario_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lider` VARCHAR(45) NULL,
    `modelo` VARCHAR(65) NULL,
    `galpao` VARCHAR(20) NULL,
    `linha` VARCHAR(18) NULL,
    `turno` VARCHAR(45) NULL,
    `entrada` INTEGER NULL,
    `saida` INTEGER NULL,
    `delta` INTEGER NULL,
    `data_cad` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repair_cause_list` (
    `causeCode` VARCHAR(8) NOT NULL,
    `causeDescription` VARCHAR(100) NOT NULL,
    `Status` VARCHAR(8) NULL,

    PRIMARY KEY (`causeCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repair_defect_list` (
    `defCode` VARCHAR(6) NOT NULL,
    `defType` VARCHAR(30) NOT NULL,
    `defDescription` VARCHAR(100) NULL,
    `Status` VARCHAR(10) NULL,

    PRIMARY KEY (`defCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repair_registros` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serialNumber` VARCHAR(20) NOT NULL,
    `modelName` VARCHAR(50) NOT NULL,
    `codSAP` VARCHAR(30) NOT NULL,
    `codEmbarque` VARCHAR(10) NULL,
    `modelDescription` VARCHAR(100) NULL,
    `defInputCode` VARCHAR(10) NOT NULL,
    `defDiagATCode` VARCHAR(10) NULL,
    `defCauseCode` VARCHAR(10) NULL,
    `dateInputDef` DATETIME(0) NOT NULL,
    `dateDiagDef` DATETIME(0) NULL,
    `repairDate` DATETIME(0) NULL,
    `soluctionCode` VARCHAR(10) NOT NULL,
    `componentLocation` VARCHAR(20) NULL,
    `notes` TEXT NULL,
    `Status` VARCHAR(100) NULL,

    INDEX `repair_registros_repair_cause_list_FK`(`defCauseCode`),
    INDEX `repair_registros_repair_defect_list_FK`(`defInputCode`),
    INDEX `repair_registros_repair_defect_list_FK_1`(`defDiagATCode`),
    INDEX `repair_registros_repair_solve_list_FK`(`soluctionCode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `repair_solve_list` (
    `soluctionCode` VARCHAR(8) NOT NULL,
    `soluctionDescription` VARCHAR(100) NOT NULL,
    `Status` VARCHAR(8) NULL,

    PRIMARY KEY (`soluctionCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reports_lcd_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial` VARCHAR(100) NOT NULL,
    `materialCode` VARCHAR(50) NOT NULL,
    `description` VARCHAR(100) NOT NULL,
    `origem` VARCHAR(100) NOT NULL,
    `defectDetected` VARCHAR(255) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `unitaryValue` DECIMAL(10, 2) NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `status` VARCHAR(30) NULL,
    `dateSearch` DATE NOT NULL,
    `UserCad` INTEGER NOT NULL,
    `DateCad` DATETIME(0) NULL,

    UNIQUE INDEX `unique_serial`(`serial`),
    INDEX `fk_user_at_user`(`UserCad`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reports_scrap_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `center` INTEGER NOT NULL,
    `material` VARCHAR(30) NOT NULL,
    `process` VARCHAR(30) NOT NULL,
    `product` VARCHAR(30) NOT NULL,
    `deposit` VARCHAR(30) NOT NULL,
    `usedCost` VARCHAR(155) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `unitCost` DECIMAL(10, 2) NOT NULL,
    `totalCost` DECIMAL(10, 2) NOT NULL,
    `reason` TEXT NULL,
    `actions` VARCHAR(255) NOT NULL,
    `photograph` VARCHAR(290) NOT NULL,
    `responsible` VARCHAR(255) NOT NULL,
    `status` VARCHAR(250) NOT NULL,
    `DataSearch` DATE NULL,
    `userCad` INTEGER NULL,
    `DataCad` DATETIME(0) NULL,

    INDEX `center`(`center`),
    INDEX `deposit`(`deposit`),
    INDEX `material`(`material`),
    INDEX `process`(`process`),
    INDEX `product`(`product`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reports_spare_part_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial` VARCHAR(50) NOT NULL,
    `materialCode` VARCHAR(100) NOT NULL,
    `description` VARCHAR(100) NOT NULL,
    `origem` VARCHAR(100) NOT NULL,
    `defectDetected` VARCHAR(255) NOT NULL,
    `quantity` INTEGER NULL,
    `unitaryValue` DECIMAL(10, 0) NULL,
    `amount` DECIMAL(10, 0) NULL,
    `status` VARCHAR(100) NOT NULL,
    `dateSearch` DATE NULL,
    `UserCad` INTEGER NOT NULL,
    `DateCad` DATETIME(0) NULL,

    UNIQUE INDEX `reports_spare_part_at_unique`(`serial`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reports_stove_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serial` VARCHAR(100) NOT NULL,
    `description` VARCHAR(100) NOT NULL,
    `stoveLocation` VARCHAR(100) NOT NULL,
    `shed` VARCHAR(100) NOT NULL,
    `status` VARCHAR(30) NULL,
    `UserCad` INTEGER NOT NULL,
    `startDate` DATETIME(0) NULL,
    `endDate` DATETIME(0) NULL,
    `exitUser` INTEGER NULL,
    `exitTime` DATETIME(0) NULL,
    `dateSearch` DATE NULL,

    INDEX `fk_stove_at_shed`(`shed`),
    INDEX `fk_stove_at_stove`(`stoveLocation`),
    INDEX `fk_stove_at_user`(`UserCad`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `return_spare` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descricao` VARCHAR(100) NULL,
    `line` VARCHAR(100) NULL,
    `qtd_remove` INTEGER NULL,
    `galpao` VARCHAR(100) NULL,
    `UserReturn` VARCHAR(100) NULL,
    `observacoes` VARCHAR(255) NULL,
    `discarte` INTEGER NULL,
    `DataReturn` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `return_spare_part` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(80) NOT NULL,
    `shed` VARCHAR(20) NOT NULL,
    `line` VARCHAR(20) NOT NULL,
    `amountReturn` INTEGER NOT NULL,
    `discart` INTEGER NOT NULL,
    `commentsReturn` VARCHAR(200) NOT NULL,
    `UserReturn` INTEGER NULL,
    `DateReturn` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `scrap_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `centro` VARCHAR(255) NULL,
    `descricao_material` VARCHAR(255) NULL,
    `processo` VARCHAR(255) NULL,
    `produto_id` VARCHAR(70) NULL,
    `deposito` VARCHAR(255) NULL,
    `custo_usado` VARCHAR(155) NULL,
    `qtd` INTEGER NULL,
    `custo_unit` VARCHAR(100) NULL,
    `custo_total` VARCHAR(100) NULL,
    `motivo` TEXT NULL,
    `acoes` VARCHAR(255) NULL,
    `foto` VARCHAR(290) NULL,
    `responsavel` VARCHAR(255) NULL,
    `status` VARCHAR(250) NULL,
    `user_cad` VARCHAR(100) NULL,
    `DataCad` DATE NULL,

    INDEX `produto_id`(`produto_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `setor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `setor` VARCHAR(45) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shed` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `shed` VARCHAR(20) NOT NULL,

    UNIQUE INDEX `unique_shed`(`shed`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sintomas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descSintoma` VARCHAR(45) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `solucoes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descSolucao` VARCHAR(55) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sound_box_defects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(10) NOT NULL,
    `description` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `spare_part` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `InternalCode` VARCHAR(100) NULL,
    `code` VARCHAR(30) NOT NULL,
    `description` VARCHAR(190) NOT NULL,
    `product` VARCHAR(190) NOT NULL,
    `family` VARCHAR(45) NOT NULL,
    `amount` INTEGER NOT NULL,
    `meter` FLOAT NULL,
    `similarTo` TEXT NULL,
    `status` VARCHAR(20) NOT NULL,
    `location` VARCHAR(45) NOT NULL,
    `brand` VARCHAR(60) NOT NULL,
    `profileSpare` VARCHAR(200) NULL,
    `minimumStock` INTEGER NOT NULL,
    `shed` VARCHAR(20) NOT NULL,
    `comments` VARCHAR(200) NULL,
    `UserCad` INTEGER NULL,
    `DateCad` DATETIME(0) NULL,
    `UserUpdate` INTEGER NULL,
    `DateUpdate` DATETIME(0) NULL,
    `sector` VARCHAR(100) NOT NULL,

    INDEX `brand`(`brand`),
    INDEX `code`(`code`),
    INDEX `family`(`family`),
    INDEX `product`(`product`),
    INDEX `shed`(`shed`),
    INDEX `status`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `spmaterial` (
    `idspmaterial` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(50) NULL,
    `descricao` VARCHAR(250) NULL,
    `produto` VARCHAR(255) NULL,
    `modelo` VARCHAR(30) NULL,
    `qtd` INTEGER NULL,
    `metro` VARCHAR(100) NULL,
    `similar_to` VARCHAR(50) NULL,
    `status` VARCHAR(20) NULL,
    `localizacao` VARCHAR(45) NULL,
    `nome_fantasia` VARCHAR(95) NULL,
    `imageSpare` VARCHAR(350) NULL,
    `estoq_min` INTEGER NULL,
    `galpao` VARCHAR(100) NULL,
    `comments` VARCHAR(255) NULL,
    `UserCad` VARCHAR(100) NULL,
    `rcAprovada` VARCHAR(200) NULL,
    `pedidoAprovado` VARCHAR(100) NULL,
    `previsaoChegada` DATE NULL,
    `DataCad` DATETIME(0) NULL,
    `UserUpdate` VARCHAR(100) NULL,
    `DataUpdate` DATETIME(0) NULL,

    PRIMARY KEY (`idspmaterial`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `spuser` (
    `idspuser` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `email` VARCHAR(200) NULL,
    `login` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    `sector` VARCHAR(45) NULL,
    `profilePicture` VARCHAR(255) NULL,
    `hierarchy` VARCHAR(45) NULL,
    `isOnline` VARCHAR(45) NULL,
    `DataLogin` DATETIME(0) NULL,
    `UserCad` VARCHAR(100) NULL,
    `DataCad` DATETIME(0) NULL,

    UNIQUE INDEX `email_UNIQUE`(`email`),
    UNIQUE INDEX `idx_spuser_login`(`login`),
    PRIMARY KEY (`idspuser`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `status` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(20) NOT NULL,

    UNIQUE INDEX `unique_status`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stove` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `stove` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `unique_stove`(`stove`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `supplier` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `supplier` VARCHAR(100) NOT NULL,
    `brand` VARCHAR(60) NOT NULL,
    `email` VARCHAR(100) NULL,
    `contact` VARCHAR(40) NULL,
    `origin` VARCHAR(20) NOT NULL,
    `UserCad` INTEGER NULL,
    `DateCad` DATETIME(0) NULL,
    `UserUpdate` INTEGER NULL,
    `DateUpdate` DATETIME(0) NULL,

    UNIQUE INDEX `supplier_unique`(`brand`),
    INDEX `idx_brand`(`brand`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `support_tickets` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `line` VARCHAR(45) NULL,
    `model` VARCHAR(100) NULL,
    `description` TEXT NULL,
    `status` ENUM('Open', 'In Progress', 'Closed') NULL,
    `opening_date` DATETIME(0) NULL,
    `resolution_summary` TEXT NULL,
    `closure_date` DATETIME(0) NULL,

    INDEX `fk_line`(`line`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_ch_cause` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Cause` VARCHAR(35) NULL,
    `Description` VARCHAR(50) NULL,
    `SectorId` INTEGER NULL,
    `CreateUser` INTEGER NULL,
    `CreateDate` DATETIME(0) NULL,
    `UpdateUser` INTEGER NULL,
    `UpdateDate` VARCHAR(100) NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_config` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `MACHINE_ID` VARCHAR(20) NULL,
    `TOOL_PATH` VARCHAR(200) NULL,
    `LOG_PATH` VARCHAR(200) NULL,
    `LINHA` VARCHAR(20) NULL,
    `POSTO` VARCHAR(20) NULL,
    `TIPO_LOG` VARCHAR(20) NULL,
    `DATA_ALTERACAO` VARCHAR(20) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_ddr_eureka` (
    `SerialNumber` INTEGER NOT NULL AUTO_INCREMENT,
    `EurekaSn` VARCHAR(18) NULL,
    `UserId` INTEGER NULL,
    `FixtureID` VARCHAR(20) NULL,
    `Line` VARCHAR(12) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `MemFreq` VARCHAR(20) NULL,
    `addr_line_test` VARCHAR(10) NULL,
    `data_line_test` VARCHAR(10) NULL,
    `MemType` VARCHAR(12) NULL,

    PRIMARY KEY (`SerialNumber`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_ddr_memtest` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `line` VARCHAR(10) NOT NULL,
    `hack` INTEGER NULL,
    `position` INTEGER NULL,
    `macNumber` VARCHAR(12) NOT NULL,
    `eqpNumber` VARCHAR(30) NOT NULL,
    `statusSlot1` VARCHAR(15) NULL,
    `statusSlot2` VARCHAR(15) NULL,
    `testId` INTEGER NULL,
    `createdDate` DATETIME(0) NOT NULL,
    `createdUser` INTEGER NOT NULL,
    `updateDate` DATETIME(0) NULL,
    `updateUser` INTEGER NULL,
    `status` VARCHAR(15) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_ddr_memtest_details` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `testId` INTEGER NULL,
    `cicle` VARCHAR(10) NULL,
    `test0` VARCHAR(100) NULL,
    `test1` VARCHAR(100) NULL,
    `test2` VARCHAR(100) NULL,
    `test3` VARCHAR(100) NULL,
    `test4` VARCHAR(100) NULL,
    `test5` VARCHAR(100) NULL,
    `test6` VARCHAR(100) NULL,
    `test7` VARCHAR(100) NULL,
    `test8` VARCHAR(100) NULL,
    `test9` VARCHAR(100) NULL,
    `test10` VARCHAR(100) NULL,
    `test11` VARCHAR(100) NULL,
    `test12` VARCHAR(100) NULL,
    `test13` VARCHAR(100) NULL,
    `dataIn` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_ddr_memtest_result` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `testId` INTEGER NULL,
    `currentCicle` VARCHAR(10) NULL,
    `mbName` VARCHAR(100) NULL,
    `mbSupplier` VARCHAR(100) NULL,
    `mbVersion` VARCHAR(100) NULL,
    `biosSupplier` VARCHAR(100) NULL,
    `biosVersion` VARCHAR(100) NULL,
    `biosDate` VARCHAR(100) NULL,
    `memType` VARCHAR(100) NULL,
    `memCapacity` VARCHAR(100) NULL,
    `boardId` VARCHAR(100) NULL,
    `serialNumber` VARCHAR(100) NULL,
    `slot` VARCHAR(100) NULL,
    `testTime` VARCHAR(100) NULL DEFAULT '0',
    `dataIn` VARCHAR(100) NULL,
    `dataOut` VARCHAR(100) NULL,
    `status` VARCHAR(50) NULL DEFAULT 'Init',
    `modulePart` VARCHAR(100) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_ddr_spcounter` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `MaterialCode` VARCHAR(20) NOT NULL,
    `MaterialType` VARCHAR(20) NULL,
    `MaterialDescription` VARCHAR(45) NULL,
    `DataCadastro` DATETIME(0) NULL,
    `UsedCycles` INTEGER NULL,
    `DataLastUpdate` DATETIME(0) NULL,
    `Status` VARCHAR(10) NULL,

    UNIQUE INDEX `tracelog_ddr_spcounter_MaterialCode_IDX`(`MaterialCode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_flags` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `keyword` VARCHAR(30) NOT NULL,
    `valor` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `tracelog_flags_unique`(`keyword`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_inner_control` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `InnerCode` VARCHAR(15) NULL,
    `Sku` VARCHAR(15) NULL,
    `Halb` VARCHAR(25) NULL,
    `BomCode` VARCHAR(3) NULL,
    `InnerHeight` FLOAT NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` INTEGER NULL,
    `UpdateDate` DATETIME(0) NULL,
    `UpdateUser` INTEGER NULL,
    `UpnCode` VARCHAR(50) NULL,
    `Status` VARCHAR(15) NULL,
    `Nf` VARCHAR(30) NULL,
    `Shipment` VARCHAR(15) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_label_control` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `SerialNumber` VARCHAR(30) NOT NULL,
    `CreateDate` DATETIME(0) NOT NULL,
    `CreateUser` INTEGER NOT NULL,
    `UsedDate` DATETIME(0) NULL,
    `UsedUser` INTEGER NULL,
    `ReprintDate` DATETIME(0) NULL,
    `ReprintUser` INTEGER NULL,
    `Halb` VARCHAR(50) NOT NULL,
    `Status` VARCHAR(10) NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_mac_consumition` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serialNumber` VARCHAR(50) NOT NULL,
    `macNumber` VARCHAR(16) NOT NULL,
    `macDescription` VARCHAR(50) NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `createUser` VARCHAR(30) NULL,
    `status` VARCHAR(20) NULL DEFAULT 'LIVRE',

    UNIQUE INDEX `tracelog_mac_consumition_UN`(`macNumber`),
    UNIQUE INDEX `tracelog_mac_consumition_serialNumber_IDX`(`serialNumber`, `macNumber`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_mac_control` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `modelName` VARCHAR(50) NOT NULL,
    `macNumber` VARCHAR(16) NOT NULL,
    `embarque` VARCHAR(30) NOT NULL,
    `softwareName` VARCHAR(100) NULL,
    `createDate` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `createUser` VARCHAR(30) NULL,
    `printDate` DATETIME(0) NULL,
    `printUser` VARCHAR(30) NULL,
    `status` VARCHAR(30) NULL DEFAULT 'Ativo',
    `type` VARCHAR(20) NULL DEFAULT 'Impresso',

    UNIQUE INDEX `tracelog_tv_assembly_unique`(`macNumber`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_mac_hssfail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serialNumber` VARCHAR(50) NOT NULL,
    `macNumber` VARCHAR(16) NOT NULL,
    `macDescription` VARCHAR(50) NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `createUser` VARCHAR(30) NULL DEFAULT '99999',
    `Status` VARCHAR(20) NULL DEFAULT 'VINCULADO',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_mac_plancontrol` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `PlanNum` VARCHAR(100) NOT NULL,
    `BTMin` VARCHAR(25) NULL,
    `BTMax` VARCHAR(25) NULL,
    `AllNums` VARCHAR(25) NULL,

    UNIQUE INDEX `tracelog_mac_plancontrol_unique`(`PlanNum`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_mtk_bt` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` INTEGER NULL,
    `Line` VARCHAR(20) NULL,
    `StationID` VARCHAR(50) NULL,
    `Instrument` VARCHAR(100) NULL,
    `Modelo` CHAR(30) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `ErrorLine` VARCHAR(50) NULL,
    `Status` VARCHAR(20) NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_mtk_mmi` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` VARCHAR(11) NOT NULL,
    `FixtureID` VARCHAR(11) NULL,
    `Line` VARCHAR(20) NULL,
    `DataLog` DATETIME(0) NULL,
    `DataIn` DATETIME(0) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` CHAR(30) NULL,
    `StationID` VARCHAR(50) NULL,
    `FailDescription` VARCHAR(35) NULL,
    `Status` VARCHAR(20) NULL,
    `Barcode` VARCHAR(20) NULL,
    `SW_Version` VARCHAR(20) NULL,
    `Speaker` VARCHAR(20) NULL,
    `Headset` VARCHAR(20) NULL,
    `GPS` VARCHAR(20) NULL,
    `Touch_Panel` VARCHAR(20) NULL,
    `Main_Camera` VARCHAR(20) NULL,
    `Sub_Camera` VARCHAR(20) NULL,
    `Storage` VARCHAR(20) NULL,
    `SIM_Card` VARCHAR(20) NULL,
    `TCard` VARCHAR(20) NULL,
    `G_Sensor` VARCHAR(20) NULL,
    `BT` VARCHAR(20) NULL,
    `FM` VARCHAR(20) NULL,
    `WIFI` VARCHAR(20) NULL,
    `Vibrator` VARCHAR(20) NULL,

    INDEX `ID`(`ID`),
    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_mv_equipments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(30) NOT NULL,
    `EquipmentName` VARCHAR(80) NOT NULL,
    `line` VARCHAR(10) NOT NULL,
    `shed` VARCHAR(20) NOT NULL,
    `commentsMov` VARCHAR(200) NULL,
    `status` VARCHAR(20) NOT NULL,
    `CreateUser` INTEGER NOT NULL,
    `CreateDate` DATETIME(0) NULL,
    `ReturnUser` INTEGER NULL,
    `ReturnDate` DATETIME(0) NULL,
    `sector` VARCHAR(100) NOT NULL,

    INDEX `CreateUser`(`CreateUser`),
    INDEX `code`(`code`),
    INDEX `shed`(`shed`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_nfe_control` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `NfCode` VARCHAR(9) NOT NULL,
    `ClientName` VARCHAR(50) NOT NULL,
    `ClientCnpj` VARCHAR(20) NOT NULL,
    `VolumnQuantity` INTEGER NOT NULL,
    `UnityQuantity` INTEGER NOT NULL,
    `Shipment` VARCHAR(15) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(100) NULL,
    `UpdateDate` VARCHAR(100) NULL,
    `UpdateUser` VARCHAR(100) NULL,
    `Status` VARCHAR(15) NULL,

    UNIQUE INDEX `nf_unique`(`NfCode`),
    UNIQUE INDEX `shipment_unique`(`Shipment`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_nfe_control_suport` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `NfCode` VARCHAR(9) NOT NULL,
    `ClientName` VARCHAR(50) NOT NULL,
    `ClientCnpj` VARCHAR(20) NOT NULL,
    `VolumnQuantity` INTEGER NOT NULL,
    `UnityQuantity` INTEGER NOT NULL,
    `Shipment` VARCHAR(15) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(100) NULL,
    `UpdateDate` VARCHAR(100) NULL,
    `UpdateUser` VARCHAR(100) NULL,
    `Status` VARCHAR(15) NULL,

    UNIQUE INDEX `nf_unique`(`NfCode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_nokia_bt` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` INTEGER NULL,
    `Line` VARCHAR(20) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `Status` VARCHAR(20) NULL,
    `ErrorLine` VARCHAR(50) NULL,
    `StationID` VARCHAR(50) NULL,
    `Instrument` VARCHAR(100) NULL,
    `CPVersion` VARCHAR(100) NULL,
    `APVersion` VARCHAR(100) NULL,
    `MemorySize` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` CHAR(30) NULL,
    `GSM_APC_SCAN_GSM850M` FLOAT NULL,
    `GSM_APC_SCAN_EGSM900` FLOAT NULL,
    `GSM_APC_SCAN_DCS1800` FLOAT NULL,
    `GSM_APC_SCAN_PCS1900` FLOAT NULL,
    `EDGE_APC_GSM850M` FLOAT NULL,
    `EDGE_APC_EGSM900` FLOAT NULL,
    `EDGE_APC_DCS1800` FLOAT NULL,
    `EDGE_APC_PCS1900` FLOAT NULL,
    `WCDMA_MaxPower_BAND__1` FLOAT NULL,
    `WCDMA_MaxPower_BAND__5` FLOAT NULL,
    `WCDMA_MaxPower_BAND__8` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band1` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band3` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band5` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band7` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band8` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band20` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band40` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band28A` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band28B` FLOAT NULL,
    `LTE_APC_Line_MaxPower_Band41_120M` FLOAT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_nokia_current` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `Linha` VARCHAR(20) NULL,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` VARCHAR(20) NULL,
    `StationID` VARCHAR(30) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `SerialNumber` VARCHAR(30) NULL,
    `Modelo` CHAR(30) NULL,
    `ErrorLine` VARCHAR(50) NULL,
    `Status` VARCHAR(100) NULL,
    `EnterTestMode` VARCHAR(30) NULL,
    `PowerOnCurrent` VARCHAR(30) NULL,
    `ChargeCurrent` VARCHAR(30) NULL,
    `IdleCurrent` VARCHAR(30) NULL,
    `PowerOff` VARCHAR(30) NULL,
    `ExitTestMode` VARCHAR(30) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_nokia_download` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` VARCHAR(30) NOT NULL,
    `FixtureID` VARCHAR(30) NULL,
    `Linha` VARCHAR(20) NULL,
    `Data_Hora_Log` VARCHAR(20) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` CHAR(30) NULL,
    `ToolVersion` VARCHAR(20) NULL,
    `FirmwareVersion` VARCHAR(20) NULL,
    `RAM_Size` VARCHAR(30) NULL,
    `ROM_Size` VARCHAR(30) NULL,
    `BoardID` VARCHAR(30) NULL,
    `DUT_Adress` VARCHAR(30) NULL,
    `TerminalID` VARCHAR(20) NULL,
    `DataIn` DATETIME(0) NULL,
    `FailDescription` VARCHAR(20) NULL,
    `Status` VARCHAR(20) NULL,

    INDEX `ID`(`ID`),
    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_nokia_ft` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` VARCHAR(20) NULL,
    `Line` VARCHAR(20) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `Status` VARCHAR(100) NULL,
    `ErrorLine` VARCHAR(100) NULL,
    `StationID` VARCHAR(100) NULL,
    `Instrument` VARCHAR(100) NULL,
    `Modelo` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(30) NULL,
    `TXP_DCS1800` INTEGER NULL,
    `TXP_EGSM900` INTEGER NULL,
    `TXP_GSM850M` INTEGER NULL,
    `TXP_PCS1900` INTEGER NULL,
    `MAXP_BAND__1` INTEGER NULL,
    `MAXP_BAND__5` INTEGER NULL,
    `MAXP_BAND__8` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band1` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band3` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band5` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band7` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band8` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band20` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band28A` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band28B` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band38` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band40` INTEGER NULL,
    `LTE_MAX_POWER_Reduce_Band41_120M` INTEGER NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_nokia_functional` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `Linha` VARCHAR(20) NULL,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` VARCHAR(20) NULL,
    `SerialNumber` VARCHAR(30) NULL,
    `Modelo` CHAR(30) NULL,
    `FailDescription` VARCHAR(100) NULL,
    `DataIn` DATETIME(0) NULL,
    `Status` VARCHAR(100) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_nokia_mmi` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` VARCHAR(11) NOT NULL,
    `FixtureID` VARCHAR(11) NULL,
    `Linha` VARCHAR(20) NULL,
    `Data_Hora_Log` DATETIME(0) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` CHAR(30) NULL,
    `BoardID` VARCHAR(20) NULL,
    `Sw_Ver` VARCHAR(20) NULL,
    `DUT_Adress` VARCHAR(11) NULL,
    `TerminalID` VARCHAR(11) NULL,
    `DataIn` DATETIME(0) NULL,
    `FailDescription` VARCHAR(35) NULL,
    `Calibration` VARCHAR(120) NULL,
    `BuildNumber` VARCHAR(11) NULL,
    `Accelerometer` VARCHAR(60) NULL,
    `Speaker` VARCHAR(60) NULL,
    `Headset` VARCHAR(60) NULL,
    `FrontCamera` VARCHAR(11) NULL,
    `MainCamera` VARCHAR(11) NULL,
    `Battery` VARCHAR(11) NULL,
    `SdCard` VARCHAR(11) NULL,
    `Bluetooth` VARCHAR(11) NULL,
    `Optical` VARCHAR(11) NULL,
    `FM` VARCHAR(11) NULL,
    `MainSIMCard` VARCHAR(11) NULL,
    `Wlan` VARCHAR(11) NULL,
    `GPS` VARCHAR(11) NULL,
    `DepthCamera` VARCHAR(11) NULL,
    `Proximity` VARCHAR(20) NULL,
    `VersionInfo` VARCHAR(45) NULL,
    `KeyPad` VARCHAR(20) NULL,
    `Fingerprint` VARCHAR(20) NULL,
    `Vibrator` VARCHAR(20) NULL,
    `SubSIMCard` VARCHAR(20) NULL,
    `MacroCamera` VARCHAR(20) NULL,
    `Status` VARCHAR(20) NULL,

    INDEX `ID`(`ID`),
    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_notebook` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` VARCHAR(20) NULL,
    `FixtureID` VARCHAR(20) NULL,
    `Line` VARCHAR(20) NULL,
    `dataIn` DATETIME(0) NULL,
    `dataLog` DATETIME(0) NULL,
    `Status` VARCHAR(30) NULL,
    `ErrorLine` VARCHAR(100) NULL,
    `SerialNumber` VARCHAR(30) NULL,
    `BiosVersion` VARCHAR(100) NULL,
    `Disk0Size` VARCHAR(30) NULL,
    `Disk1Size` VARCHAR(30) NULL,
    `MemorySize` VARCHAR(30) NULL,
    `CPUType` VARCHAR(100) NULL,
    `ModelName` VARCHAR(100) NULL,
    `ModelCode` VARCHAR(100) NULL,
    `TestTime` VARCHAR(100) NULL,
    `ResultUSB` VARCHAR(20) NULL,
    `ResultKeyboard` VARCHAR(20) NULL,
    `ResultCharger` VARCHAR(20) NULL,
    `ResultSSD` VARCHAR(20) NULL,
    `ResultLAN` VARCHAR(20) NULL,
    `ResultWifi` VARCHAR(20) NULL,
    `ResultCamera` VARCHAR(20) NULL,
    `ResultAudio` VARCHAR(20) NULL,
    `ResultHeadset` VARCHAR(20) NULL,
    `ResultBrithness` VARCHAR(20) NULL,
    `ResultTela` VARCHAR(20) NULL,
    `ResultBluetooth` VARCHAR(20) NULL,
    `ResultBateria` VARCHAR(20) NULL,
    `ResultLED` VARCHAR(20) NULL,
    `ResultTPad` VARCHAR(20) NULL,
    `ResultTPanel` VARCHAR(20) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_oper` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Oper` VARCHAR(20) NOT NULL,
    `Description` VARCHAR(100) NULL,
    `Family` VARCHAR(100) NULL,
    `CreationUser` INTEGER NOT NULL,
    `CreationDate` DATETIME(0) NOT NULL,

    INDEX `USER_KEY`(`CreationUser`),
    UNIQUE INDEX `OPER_FAMILY_UNIQUE_KEY`(`Family`, `Oper`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_pth_keyence_boards` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `programa` VARCHAR(30) NULL,
    `linha` VARCHAR(10) NULL,
    `sn` VARCHAR(30) NULL,
    `result` VARCHAR(10) NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_pth_keyence_componentes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idBoards` INTEGER NULL,
    `posMec` VARCHAR(30) NULL,
    `resultado` VARCHAR(30) NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `ix_tracelog_pth_keyence_componentes_id`(`id`),
    INDEX `tracelog_pth_keyence_componentes_tracelog_pth_keyence_boards_FK`(`idBoards`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_rate` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(5) NOT NULL,
    `ModelId` INTEGER NOT NULL,
    `Rate` INTEGER NOT NULL,
    `DataIn` DATETIME(0) NOT NULL,
    `CreateUserId` INTEGER NOT NULL,
    `DataUpdate` DATETIME(0) NULL,
    `UpdateUserId` INTEGER NULL,

    INDEX `tracelog_rate_packing_modelo_FK`(`ModelId`),
    INDEX `tracelog_rate_tracelog_users_FK`(`CreateUserId`),
    INDEX `tracelog_rate_tracelog_users_FK_1`(`UpdateUserId`),
    UNIQUE INDEX `tracelog_rate_Line_IDX`(`Line`, `ModelId`, `Rate`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_setup_thermal_paste` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `TubeSerial` VARCHAR(30) NOT NULL,
    `FullTubeWeight` FLOAT NOT NULL,
    `EmptyTubeWeight` FLOAT NOT NULL,
    `QtdTarget` INTEGER NOT NULL,
    `QtdProduced` INTEGER NULL,
    `SetupDate` DATETIME(0) NOT NULL,
    `ChangeDate` DATETIME(0) NULL,
    `SetupUser` INTEGER NOT NULL,
    `ChangeUser` INTEGER NULL,
    `Model` VARCHAR(20) NOT NULL,
    `Line` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_smt_aoi_register` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `g_machine_serial` VARCHAR(20) NULL,
    `g_line_name` VARCHAR(20) NULL,
    `g_group_name` VARCHAR(30) NULL,
    `g_board_name` VARCHAR(40) NULL,
    `g_auto_start_datetime` VARCHAR(30) NULL,
    `b_side` VARCHAR(2) NULL,
    `b_board_serial` VARCHAR(30) NULL,
    `b_inspected_datetime` DATETIME(0) NULL,
    `b_operator` VARCHAR(20) NULL,
    `b_result` VARCHAR(10) NULL,
    `b_AOI_result` VARCHAR(5) NULL,
    `b_operator_Judgment` VARCHAR(5) NULL,
    `b_lotnumber` VARCHAR(20) NULL,
    `b_racknumber` VARCHAR(20) NULL,
    `b_rackcount` VARCHAR(20) NULL,
    `b_currentcount` VARCHAR(20) NULL,
    `b_ngcount` VARCHAR(20) NULL,
    `c_reference_name` VARCHAR(20) NULL,
    `c_macro_name` VARCHAR(30) NULL,
    `c_libname` VARCHAR(30) NULL,
    `c_subboard_number` VARCHAR(3) NULL,
    `c_side` VARCHAR(2) NULL,
    `c_result` VARCHAR(10) NULL,
    `c_AOI_result` VARCHAR(10) NULL,
    `c_operator_Judgment` VARCHAR(10) NULL,
    `c_flg` VARCHAR(10) NULL,
    `c_x` VARCHAR(10) NULL,
    `c_y` VARCHAR(10) NULL,
    `c_ShiftX` VARCHAR(30) NULL,
    `c_ShiftY` VARCHAR(30) NULL,
    `c_ShiftT` VARCHAR(20) NULL,
    `w_window_num` VARCHAR(10) NULL,
    `w_pin_num` VARCHAR(5) NULL,
    `w_subpin_num` VARCHAR(10) NULL,
    `w_result` VARCHAR(10) NULL,
    `w_AOI_result` VARCHAR(10) NULL,
    `w_operator_Judgment` VARCHAR(10) NULL,
    `w_ng_kind` VARCHAR(30) NULL,
    `w_ng_name` VARCHAR(40) NULL,
    `w_image` VARCHAR(20) NULL,
    `w_x1` VARCHAR(10) NULL,
    `w_y1` VARCHAR(10) NULL,
    `w_x2` VARCHAR(10) NULL,
    `w_y2` VARCHAR(10) NULL,
    `w_shiftx` VARCHAR(10) NULL,
    `w_shifty` VARCHAR(10) NULL,
    `w_light` VARCHAR(10) NULL,
    `w_algnum` VARCHAR(20) NULL,
    `w_algname` VARCHAR(20) NULL,
    `w_max` VARCHAR(10) NULL,
    `w_min` VARCHAR(10) NULL,
    `w_sample` VARCHAR(10) NULL,
    `w_sample2` VARCHAR(10) NULL,
    `w_sample3` VARCHAR(10) NULL,
    `w_sample4` VARCHAR(10) NULL,
    `w_ocr_result` VARCHAR(10) NULL,
    `status` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_smt_aoi_result` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lotId` VARCHAR(50) NULL,
    `Status` VARCHAR(50) NULL,
    `dataRead` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_smt_spi_register_fail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Component_ID` VARCHAR(50) NULL,
    `PadID` VARCHAR(50) NULL,
    `Volume` VARCHAR(50) NULL,
    `Height` VARCHAR(50) NULL,
    `Area` VARCHAR(50) NULL,
    `OffsetX` VARCHAR(50) NULL,
    `OffsetY` VARCHAR(50) NULL,
    `Barcode` VARCHAR(50) NULL,
    `Job` VARCHAR(500) NULL,
    `Result` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_smt_spi_result` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lotId` VARCHAR(50) NULL,
    `Status` VARCHAR(50) NULL,
    `dataRead` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_sn_brc_basys` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `smtSn` VARCHAR(20) NOT NULL,
    `pcbaSn` VARCHAR(20) NOT NULL,
    `dataIn` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER NOT NULL,
    `status` VARCHAR(12) NULL,

    UNIQUE INDEX `smtSn_UNIQUE`(`smtSn`),
    UNIQUE INDEX `pcbaSn_UNIQUE`(`pcbaSn`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_ssd_ddr_relationship` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `BomCode` VARCHAR(5) NOT NULL,
    `Halb` VARCHAR(50) NOT NULL,
    `Sku` VARCHAR(50) NOT NULL,
    `PackingType` VARCHAR(15) NOT NULL DEFAULT 'Individual',
    `ModelDescription` VARCHAR(50) NULL,
    `PartNumber` VARCHAR(50) NULL,
    `PrintLineInfo` VARCHAR(40) NULL DEFAULT 'ANULARB5 A GARANTIA SE REMOVIDO',
    `FirmwareVersion` VARCHAR(100) NULL,
    `Capacity` FLOAT NULL,
    `Po` VARCHAR(10) NULL,
    `status` VARCHAR(20) NOT NULL,

    INDEX `tracelog_ssd_ddr_relationship_packing_modelo_FK`(`Sku`),
    UNIQUE INDEX `tracelog_ssd_ddr_relationship_BomCode_IDX`(`BomCode`, `Halb`, `Sku`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_ssd_sncontrol` (
    `id` INTEGER NULL AUTO_INCREMENT,
    `SerialNumber` VARCHAR(15) NOT NULL,
    `DataIn` DATETIME(0) NULL,
    `DataPrint` DATETIME(0) NULL,
    `DataFail` DATETIME(0) NULL,
    `Status` INTEGER NULL,

    UNIQUE INDEX `tracelog_ssd_sncontrol_SerialNumber_IDX`(`SerialNumber`),
    INDEX `tracelog_ssd_sncontrol_FK`(`Status`),
    INDEX `tracelog_ssd_sncontrol_id_IDX`(`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_status` (
    `StatusID` INTEGER NOT NULL,
    `Description` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`StatusID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_test_result` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `SerialNumber` VARCHAR(20) NULL,
    `TestType` VARCHAR(20) NULL,
    `StationID` VARCHAR(20) NULL,
    `TestResult` VARCHAR(20) NULL,
    `UserID` INTEGER NULL,
    `CreateDate` DATETIME(0) NULL,
    `Model` VARCHAR(20) NULL,
    `Line` VARCHAR(10) NULL,

    INDEX `SearchingByTestKey`(`SerialNumber`, `TestType`, `TestResult`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_timestamp` (
    `keyWord` VARCHAR(20) NOT NULL,
    `lastUpdate` DATETIME(0) NULL,

    PRIMARY KEY (`keyWord`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tool_control` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `swToolName` VARCHAR(100) NOT NULL,
    `productionOrder` VARCHAR(100) NOT NULL,
    `description` VARCHAR(100) NOT NULL,
    `swPath` VARCHAR(300) NOT NULL,
    `scriptPath` VARCHAR(300) NOT NULL,
    `scriptName` VARCHAR(100) NOT NULL,
    `scriptInfo` VARCHAR(100) NOT NULL,
    `scriptInfoDescription` VARCHAR(100) NOT NULL,
    `createDate` DATETIME(0) NOT NULL,
    `createUser` INTEGER NOT NULL,
    `updateDate` DATETIME(0) NULL,
    `updateUser` INTEGER NULL,
    `Status` VARCHAR(50) NULL,

    INDEX `tracelog_tool_control_FK`(`productionOrder`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_assembly` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productSn` VARCHAR(50) NULL,
    `idPcba` VARCHAR(50) NULL,
    `idPanel` VARCHAR(100) NOT NULL,
    `wifiModule` VARCHAR(50) NULL,
    `wifiDesc` VARCHAR(100) NULL,
    `module1` VARCHAR(50) NULL,
    `modDesc1` VARCHAR(100) NULL,
    `module2` VARCHAR(50) NULL,
    `modDesc2` VARCHAR(100) NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER NOT NULL,
    `updateDate` DATETIME(0) NULL,
    `updateUser` INTEGER NULL,
    `status` VARCHAR(30) NOT NULL DEFAULT 'VINCULADO',
    `model` INTEGER NOT NULL,
    `line` VARCHAR(10) NULL,

    UNIQUE INDEX `tracelog_tv_assembly_unique_1`(`productSn`),
    UNIQUE INDEX `tracelog_tv_assembly_unique`(`idPcba`),
    INDEX `tracelog_tv_assembly_FK`(`model`),
    INDEX `tracelog_tv_assembly_module1_IDX`(`wifiModule`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_assembly_suport` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productSn` VARCHAR(50) NULL,
    `idPcba` VARCHAR(50) NULL,
    `idPanel` VARCHAR(100) NOT NULL,
    `wifiModule` VARCHAR(50) NULL,
    `wifiDesc` VARCHAR(100) NULL,
    `module1` VARCHAR(50) NULL,
    `modDesc1` VARCHAR(100) NULL,
    `module2` VARCHAR(50) NULL,
    `modDesc2` VARCHAR(100) NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER NOT NULL,
    `updateDate` DATETIME(0) NULL,
    `updateUser` INTEGER NULL,
    `status` VARCHAR(30) NOT NULL DEFAULT 'VINCULADO',
    `model` INTEGER NOT NULL,
    `line` VARCHAR(10) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_box_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `boxSn` VARCHAR(20) NOT NULL,
    `boxWeight` FLOAT NOT NULL,
    `idProduct` INTEGER NOT NULL,

    UNIQUE INDEX `tracelog_tv_box_history_UN`(`boxSn`),
    INDEX `tracelog_tv_box_history_FK`(`idProduct`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_fail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `SerialNumber` VARCHAR(20) NOT NULL,
    `test` VARCHAR(10) NOT NULL,
    `dataOut` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_itemlist` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `keyItem` VARCHAR(30) NOT NULL,
    `keyDescription` VARCHAR(100) NULL,
    `operSeq` INTEGER NULL,
    `regexModel` VARCHAR(50) NOT NULL,
    `procStep` VARCHAR(30) NOT NULL DEFAULT 'Items',
    `idModel` INTEGER NOT NULL,
    `createUser` INTEGER NULL,
    `createDate` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `status` VARCHAR(30) NULL DEFAULT 'ATIVO',

    UNIQUE INDEX `tracelog_tv_itemlist_idModel_IDX`(`idModel`, `operSeq`, `procStep`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `keyItem` VARCHAR(10) NOT NULL,
    `keyDescription` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_models` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `modelSapCode` VARCHAR(50) NOT NULL,
    `modelSku` VARCHAR(30) NOT NULL,
    `maxWeight` FLOAT NOT NULL DEFAULT 500,
    `minWeight` FLOAT NOT NULL DEFAULT 470,
    `tolerance` FLOAT NOT NULL DEFAULT 0,
    `wifiType` VARCHAR(30) NULL DEFAULT 'INTEGRATED',
    `createUser` INTEGER NULL,
    `createDate` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `status` VARCHAR(30) NULL DEFAULT 'ATIVO',

    UNIQUE INDEX `id`(`id`),
    UNIQUE INDEX `tracelog_tv_models_UN`(`modelSku`),
    PRIMARY KEY (`modelSapCode`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_pa` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `SerialNumber` VARCHAR(20) NULL,
    `Hipot` INTEGER NOT NULL DEFAULT 0,
    `T1` INTEGER NOT NULL DEFAULT 0,
    `T2` INTEGER NOT NULL DEFAULT 0,
    `T3` INTEGER NOT NULL DEFAULT 0,
    `T4` INTEGER NOT NULL DEFAULT 0,
    `T5` INTEGER NOT NULL DEFAULT 0,
    `T6` INTEGER NOT NULL DEFAULT 0,
    `UserHipot` INTEGER NOT NULL,
    `UserRevision` INTEGER NULL,
    `dataIn` DATETIME(0) NOT NULL,
    `dataOut` DATETIME(0) NULL,

    UNIQUE INDEX `sn_key`(`SerialNumber`),
    INDEX `tracelog_tv_pa_FK`(`T1`),
    INDEX `tracelog_tv_pa_FK_1`(`T2`),
    INDEX `tracelog_tv_pa_FK_2`(`T3`),
    INDEX `tracelog_tv_pa_FK_3`(`T4`),
    INDEX `tracelog_tv_pa_FK_4`(`T5`),
    INDEX `tracelog_tv_pa_FK_5`(`T6`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_packing` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idBox` INTEGER NULL,
    `SerialNumber` VARCHAR(30) NULL,
    `weightPacking` FLOAT NOT NULL,
    `idItems` INTEGER NULL,
    `zplSap` TEXT NULL,
    `DataIn` DATETIME(0) NULL,
    `UserID` INTEGER NULL,
    `Model` VARCHAR(20) NULL,
    `line` VARCHAR(10) NULL,

    UNIQUE INDEX `SerialNumber`(`SerialNumber`),
    INDEX `tracelog_tv_packing_DataIn_IDX`(`DataIn`, `Model`, `line`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_pkacessorio` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `SerialNumber` VARCHAR(30) NOT NULL,
    `acessorio1` VARCHAR(100) NULL,
    `acessorio2` VARCHAR(100) NULL,
    `acessorio3` VARCHAR(100) NULL,
    `acessorio4` VARCHAR(100) NULL,
    `acessorio5` VARCHAR(100) NULL,
    `acessorio6` VARCHAR(100) NULL,
    `acessorio7` VARCHAR(100) NULL,
    `acessorio8` VARCHAR(100) NULL,
    `acessorio9` VARCHAR(100) NULL,
    `acessorio10` VARCHAR(100) NULL,
    `status` VARCHAR(30) NULL DEFAULT 'ABERTO',
    `UserID` INTEGER NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `model` VARCHAR(50) NULL,
    `line` VARCHAR(10) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_pth` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(20) NULL,
    `UserID` VARCHAR(11) NULL,
    `Modelo` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(20) NOT NULL,
    `DataIn` DATETIME(0) NULL,
    `FailCode` VARCHAR(100) NULL,
    `Status` VARCHAR(20) NULL,
    `TouchUp` VARCHAR(10) NULL,
    `Component` VARCHAR(30) NULL,

    INDEX `FK_SerialPTH_idx`(`SerialNumber`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_pth_sn` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(20) NULL,
    `UserID` VARCHAR(11) NULL,
    `Modelo` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(20) NOT NULL,
    `DataIn` DATETIME(0) NULL,
    `Status` VARCHAR(20) NULL,
    `TouchUp` VARCHAR(10) NULL DEFAULT 'No',
    `DataFail` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `id_UNIQUE`(`id`),
    PRIMARY KEY (`SerialNumber`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_rc_mac_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mac` VARCHAR(17) NOT NULL,
    `DataIn` DATETIME(0) NOT NULL,
    `UserID` INTEGER NOT NULL,
    `Status` VARCHAR(4) NULL DEFAULT 'Pass',
    `SerialNumber` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_rc_mac_rework` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mac` VARCHAR(17) NOT NULL,
    `UserID` INTEGER NOT NULL,
    `DataIn` DATETIME(0) NOT NULL,
    `DataFail` DATETIME(0) NULL,
    `UserFail` INTEGER NULL,
    `Status` VARCHAR(4) NULL DEFAULT 'Pass',
    `SerialNumber` VARCHAR(30) NOT NULL,

    UNIQUE INDEX `mac`(`mac`),
    UNIQUE INDEX `tracelog_tv_rc_mac_rework_UN`(`SerialNumber`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_setup` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(5) NOT NULL,
    `Model` VARCHAR(50) NULL,
    `CurrentOp` VARCHAR(20) NULL,
    `OpTarget` INTEGER NULL,
    `OpProduced` INTEGER NULL,
    `Reset` BOOLEAN NULL DEFAULT false,
    `Assembly` BOOLEAN NULL DEFAULT false,

    UNIQUE INDEX `tracelog_tv_setup_UN`(`Line`),
    INDEX `tracelog_tv_setup_FK`(`Model`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_setup_report` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(100) NOT NULL,
    `Model` VARCHAR(100) NOT NULL,
    `CurrentOp` INTEGER NOT NULL,
    `OpTarget` INTEGER NOT NULL,
    `OpProduced` VARCHAR(100) NOT NULL,
    `Flag` VARCHAR(100) NOT NULL,
    `Report` TEXT NOT NULL,
    `UserCreate` INTEGER NOT NULL,
    `DateCreate` DATETIME(0) NOT NULL,
    `UserUpdate` INTEGER NULL,
    `DateUpdate` DATETIME(0) NULL,

    INDEX `Line`(`Line`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `UserId` INTEGER NOT NULL,
    `dataLogin` DATETIME(0) NOT NULL,
    `dataLogout` DATETIME(0) NULL,
    `Test` VARCHAR(5) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_tv_writemac_register` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `model` VARCHAR(40) NULL,
    `lineId` VARCHAR(10) NULL,
    `machineName` VARCHAR(60) NULL,
    `serialNumber` VARCHAR(30) NULL,
    `macNumber` VARCHAR(20) NULL,
    `hdcpKey1` VARCHAR(100) NULL,
    `hdcpKey2` VARCHAR(100) NULL,
    `dataLog` DATETIME(0) NULL,
    `dataIn` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `userId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_upn_control` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `UpnCode` VARCHAR(50) NOT NULL,
    `MasterBoxCode` VARCHAR(50) NULL,
    `Sku` VARCHAR(20) NOT NULL,
    `Halb` VARCHAR(25) NOT NULL,
    `BomCode` VARCHAR(3) NOT NULL,
    `CreateDate` DATETIME(0) NOT NULL,
    `CreateUser` INTEGER NOT NULL,
    `UpdateDate` DATETIME(0) NULL,
    `UpdateUser` INTEGER NULL,
    `Status` VARCHAR(15) NOT NULL,

    UNIQUE INDEX `upn_key`(`UpnCode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_users` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER NOT NULL,
    `CompleteName` VARCHAR(100) NULL,
    `AccessPassword` VARCHAR(50) NULL,
    `AccessLevel` VARCHAR(20) NULL,
    `email` VARCHAR(255) NULL,
    `Status` VARCHAR(20) NOT NULL DEFAULT '',
    `sector` VARCHAR(25) NOT NULL,
    `hierarchy` VARCHAR(50) NULL,
    `profile` TEXT NULL,
    `isOnline` VARCHAR(10) NULL,
    `dateLogin` DATETIME(0) NULL,
    `UserCad` INTEGER NULL,
    `DateCad` DATETIME(0) NULL,
    `userUpdate` INTEGER NULL,
    `dateUpdate` DATETIME(0) NULL,
    `factory` VARCHAR(20) NULL,
    `locality` VARCHAR(20) NULL,

    UNIQUE INDEX `UserID`(`UserID`),
    INDEX `tracelog_users_UserID_IDX`(`UserID`, `CompleteName`, `AccessPassword`),
    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_wifi_result` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `macReference` VARCHAR(30) NOT NULL,
    `mac` VARCHAR(12) NOT NULL,
    `result` VARCHAR(10) NOT NULL,
    `error` VARCHAR(100) NULL DEFAULT 'None',
    `binary` BLOB NULL,
    `dataIn` DATETIME(0) NOT NULL,
    `userId` INTEGER NOT NULL,
    `productionOrder` VARCHAR(20) NULL,
    `machineId` VARCHAR(50) NULL,
    `lineId` VARCHAR(10) NULL DEFAULT 'LT002',
    `test` VARCHAR(50) NULL,

    INDEX `tracelog_wifi_result_dataIn_IDX`(`dataIn`),
    INDEX `tracelog_wifi_result_macReference_IDX`(`macReference`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(20) NULL,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` INTEGER NULL,
    `TestType` VARCHAR(100) NULL,
    `StationID` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` VARCHAR(50) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `ErrorLine` VARCHAR(100) NULL,
    `Status` VARCHAR(20) NULL,

    INDEX `tracelog_zte_DataLog_IDX`(`DataLog`, `StationID`, `Status`),
    INDEX `tracelog_zte_SerialNumber_IDX`(`SerialNumber`),
    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_aging_car` (
    `CarID` INTEGER NOT NULL,
    `CarDescription` VARCHAR(45) NULL,
    `A1` VARCHAR(12) NULL DEFAULT '0',
    `A2` VARCHAR(12) NULL DEFAULT '0',
    `A3` VARCHAR(12) NULL DEFAULT '0',
    `A4` VARCHAR(12) NULL DEFAULT '0',
    `A5` VARCHAR(12) NULL DEFAULT '0',
    `A6` VARCHAR(12) NULL DEFAULT '0',
    `A7` VARCHAR(12) NULL DEFAULT '0',
    `A8` VARCHAR(12) NULL DEFAULT '0',
    `A9` VARCHAR(12) NULL DEFAULT '0',
    `A10` VARCHAR(12) NULL DEFAULT '0',
    `A11` VARCHAR(12) NULL DEFAULT '0',
    `A12` VARCHAR(12) NULL DEFAULT '0',
    `B1` VARCHAR(12) NULL DEFAULT '0',
    `B2` VARCHAR(12) NULL DEFAULT '0',
    `B3` VARCHAR(12) NULL DEFAULT '0',
    `B4` VARCHAR(12) NULL DEFAULT '0',
    `B5` VARCHAR(12) NULL DEFAULT '0',
    `B6` VARCHAR(12) NULL DEFAULT '0',
    `B7` VARCHAR(12) NULL DEFAULT '0',
    `B8` VARCHAR(12) NULL DEFAULT '0',
    `B9` VARCHAR(12) NULL DEFAULT '0',
    `B10` VARCHAR(12) NULL DEFAULT '0',
    `B11` VARCHAR(12) NULL DEFAULT '0',
    `B12` VARCHAR(12) NULL DEFAULT '0',
    `C1` VARCHAR(12) NULL DEFAULT '0',
    `C2` VARCHAR(12) NULL DEFAULT '0',
    `C3` VARCHAR(12) NULL DEFAULT '0',
    `C4` VARCHAR(12) NULL DEFAULT '0',
    `C5` VARCHAR(12) NULL DEFAULT '0',
    `C6` VARCHAR(12) NULL DEFAULT '0',
    `C7` VARCHAR(12) NULL DEFAULT '0',
    `C8` VARCHAR(12) NULL DEFAULT '0',
    `C9` VARCHAR(12) NULL DEFAULT '0',
    `C10` VARCHAR(12) NULL DEFAULT '0',
    `C11` VARCHAR(12) NULL DEFAULT '0',
    `C12` VARCHAR(12) NULL DEFAULT '0',
    `D1` VARCHAR(12) NULL DEFAULT '0',
    `D2` VARCHAR(12) NULL DEFAULT '0',
    `D3` VARCHAR(12) NULL DEFAULT '0',
    `D4` VARCHAR(12) NULL DEFAULT '0',
    `D5` VARCHAR(12) NULL DEFAULT '0',
    `D6` VARCHAR(12) NULL DEFAULT '0',
    `D7` VARCHAR(12) NULL DEFAULT '0',
    `D8` VARCHAR(12) NULL DEFAULT '0',
    `D9` VARCHAR(12) NULL DEFAULT '0',
    `D10` VARCHAR(12) NULL DEFAULT '0',
    `D11` VARCHAR(12) NULL DEFAULT '0',
    `D12` VARCHAR(12) NULL DEFAULT '0',
    `E1` VARCHAR(12) NULL DEFAULT '0',
    `E2` VARCHAR(12) NULL DEFAULT '0',
    `E3` VARCHAR(12) NULL DEFAULT '0',
    `E4` VARCHAR(12) NULL DEFAULT '0',
    `E5` VARCHAR(12) NULL DEFAULT '0',
    `E6` VARCHAR(12) NULL DEFAULT '0',
    `E7` VARCHAR(12) NULL DEFAULT '0',
    `E8` VARCHAR(12) NULL DEFAULT '0',
    `E9` VARCHAR(12) NULL DEFAULT '0',
    `E10` VARCHAR(12) NULL DEFAULT '0',
    `E11` VARCHAR(12) NULL DEFAULT '0',
    `E12` VARCHAR(12) NULL DEFAULT '0',
    `F1` VARCHAR(12) NULL DEFAULT '0',
    `F2` VARCHAR(12) NULL DEFAULT '0',
    `F3` VARCHAR(12) NULL DEFAULT '0',
    `F4` VARCHAR(12) NULL DEFAULT '0',
    `F5` VARCHAR(12) NULL DEFAULT '0',
    `F6` VARCHAR(12) NULL DEFAULT '0',
    `F7` VARCHAR(12) NULL DEFAULT '0',
    `F8` VARCHAR(12) NULL DEFAULT '0',
    `F9` VARCHAR(12) NULL DEFAULT '0',
    `F10` VARCHAR(12) NULL DEFAULT '0',
    `F11` VARCHAR(12) NULL DEFAULT '0',
    `F12` VARCHAR(12) NULL DEFAULT '0',
    `G1` VARCHAR(12) NULL DEFAULT '0',
    `G2` VARCHAR(12) NULL DEFAULT '0',
    `G3` VARCHAR(12) NULL DEFAULT '0',
    `G4` VARCHAR(12) NULL DEFAULT '0',
    `G5` VARCHAR(12) NULL DEFAULT '0',
    `G6` VARCHAR(12) NULL DEFAULT '0',
    `G7` VARCHAR(12) NULL DEFAULT '0',
    `G8` VARCHAR(12) NULL DEFAULT '0',
    `G9` VARCHAR(12) NULL DEFAULT '0',
    `G10` VARCHAR(12) NULL DEFAULT '0',
    `G11` VARCHAR(12) NULL DEFAULT '0',
    `G12` VARCHAR(12) NULL DEFAULT '0',
    `H1` VARCHAR(12) NULL DEFAULT '0',
    `H2` VARCHAR(12) NULL DEFAULT '0',
    `H3` VARCHAR(12) NULL DEFAULT '0',
    `H4` VARCHAR(12) NULL DEFAULT '0',
    `H5` VARCHAR(12) NULL DEFAULT '0',
    `H6` VARCHAR(12) NULL DEFAULT '0',
    `H7` VARCHAR(12) NULL DEFAULT '0',
    `H8` VARCHAR(12) NULL DEFAULT '0',
    `H9` VARCHAR(12) NULL DEFAULT '0',
    `H10` VARCHAR(12) NULL DEFAULT '0',
    `H11` VARCHAR(12) NULL DEFAULT '0',
    `H12` VARCHAR(12) NULL DEFAULT '0',
    `I1` VARCHAR(12) NULL DEFAULT '0',
    `I2` VARCHAR(12) NULL DEFAULT '0',
    `I3` VARCHAR(12) NULL DEFAULT '0',
    `I4` VARCHAR(12) NULL DEFAULT '0',
    `I5` VARCHAR(12) NULL DEFAULT '0',
    `I6` VARCHAR(12) NULL DEFAULT '0',
    `I7` VARCHAR(12) NULL DEFAULT '0',
    `I8` VARCHAR(12) NULL DEFAULT '0',
    `I9` VARCHAR(12) NULL DEFAULT '0',
    `I10` VARCHAR(12) NULL DEFAULT '0',
    `I11` VARCHAR(12) NULL DEFAULT '0',
    `I12` VARCHAR(12) NULL DEFAULT '0',
    `J1` VARCHAR(12) NULL DEFAULT '0',
    `J2` VARCHAR(12) NULL DEFAULT '0',
    `J3` VARCHAR(12) NULL DEFAULT '0',
    `J4` VARCHAR(12) NULL DEFAULT '0',
    `J5` VARCHAR(12) NULL DEFAULT '0',
    `J6` VARCHAR(12) NULL DEFAULT '0',
    `J7` VARCHAR(12) NULL DEFAULT '0',
    `J8` VARCHAR(12) NULL DEFAULT '0',
    `J9` VARCHAR(12) NULL DEFAULT '0',
    `J10` VARCHAR(12) NULL DEFAULT '0',
    `J11` VARCHAR(12) NULL DEFAULT '0',
    `J12` VARCHAR(12) NULL DEFAULT '0',
    `TestID` INTEGER NULL,
    `UserID` INTEGER NULL,
    `mac` VARCHAR(18) NULL,
    `Status` INTEGER NULL,

    INDEX `fk_Status_idx`(`Status`),
    INDEX `fk_User_idx`(`UserID`),
    PRIMARY KEY (`CarID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_aging_reg` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `SerialNumber` VARCHAR(12) NULL,
    `CarID` INTEGER NULL,
    `CarPosition` VARCHAR(4) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataOut` DATETIME(0) NULL,
    `TestTime` INTEGER NULL,
    `UserID_In` INTEGER NULL,
    `UserID_Out` INTEGER NULL,
    `TestID` INTEGER NOT NULL,
    `Status` INTEGER NULL,
    `rework` VARCHAR(5) NULL DEFAULT 'No',

    INDEX `fk_CarID_idx`(`CarID`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_aging_test` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `CarID` INTEGER NULL,
    `UserID` INTEGER NULL,
    `TimeStart` DATETIME(0) NULL,
    `TimeEnd` DATETIME(0) NULL,
    `Status` INTEGER NULL,
    `TestID` INTEGER NOT NULL,

    INDEX `fk_CarID_test_idx`(`CarID`),
    INDEX `fk_Status_test_idx`(`Status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_checkx` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `model` VARCHAR(20) NOT NULL,
    `sn_read` VARCHAR(12) NOT NULL,
    `sn` VARCHAR(12) NOT NULL,
    `flags` VARCHAR(12) NOT NULL,
    `soft_version` VARCHAR(20) NOT NULL,
    `test_sn` VARCHAR(4) NOT NULL,
    `test_flags` VARCHAR(4) NOT NULL,
    `test_soft_version` VARCHAR(4) NOT NULL,
    `test_usb` VARCHAR(4) NOT NULL,
    `test_ssid` VARCHAR(4) NOT NULL,
    `test_status` VARCHAR(6) NOT NULL,
    `created` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_checkx_fail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `SerialNumber` VARCHAR(20) NOT NULL,
    `Fail` VARCHAR(20) NOT NULL,
    `UserId` INTEGER NOT NULL,
    `DataIn` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_old` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(20) NULL,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` INTEGER NULL,
    `TestType` VARCHAR(100) NULL,
    `StationID` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` VARCHAR(50) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `ErrorLine` VARCHAR(100) NULL,
    `Status` VARCHAR(20) NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_old2` (
    `Line` VARCHAR(20) NULL,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` INTEGER NULL,
    `TestType` VARCHAR(100) NULL,
    `StationID` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` VARCHAR(50) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `ErrorLine` VARCHAR(100) NULL,
    `Status` VARCHAR(20) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_old3` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(20) NULL,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` INTEGER NULL,
    `TestType` VARCHAR(100) NULL,
    `StationID` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` VARCHAR(50) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `ErrorLine` VARCHAR(100) NULL,
    `Status` VARCHAR(20) NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_old4` (
    `Id` INTEGER NULL,
    `Line` VARCHAR(20) NULL,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` INTEGER NULL,
    `TestType` VARCHAR(100) NULL,
    `StationID` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` VARCHAR(50) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `ErrorLine` VARCHAR(100) NULL,
    `Status` VARCHAR(20) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_old_5` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(20) NULL,
    `FixtureID` VARCHAR(20) NULL,
    `UserID` INTEGER NULL,
    `TestType` VARCHAR(100) NULL,
    `StationID` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(20) NULL,
    `Modelo` VARCHAR(50) NULL,
    `DataIn` DATETIME(0) NULL,
    `DataLog` DATETIME(0) NULL,
    `ErrorLine` VARCHAR(100) NULL,
    `Status` VARCHAR(20) NULL,

    INDEX `tracelog_zte_SerialNumber_IDX`(`SerialNumber`),
    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_pth` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(20) NULL,
    `UserID` VARCHAR(11) NULL,
    `Modelo` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(12) NOT NULL,
    `DataIn` DATETIME(0) NULL,
    `FailCode` VARCHAR(100) NULL,
    `Status` VARCHAR(20) NULL,
    `TouchUp` VARCHAR(10) NULL,
    `Component` VARCHAR(30) NULL,

    INDEX `FK_SerialPTH_idx`(`SerialNumber`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_pth_sn` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Line` VARCHAR(20) NULL,
    `UserID` VARCHAR(11) NULL,
    `Modelo` VARCHAR(50) NULL,
    `SerialNumber` VARCHAR(12) NOT NULL,
    `DataIn` DATETIME(0) NULL,
    `Status` VARCHAR(20) NULL,
    `TouchUp` VARCHAR(10) NULL DEFAULT 'No',
    `DataFail` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `id_UNIQUE`(`id`),
    PRIMARY KEY (`SerialNumber`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tracelog_zte_rework` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `snLabel` VARCHAR(30) NULL,
    `snBoard` VARCHAR(30) NULL,
    `userID` INTEGER NOT NULL,
    `userName` VARCHAR(50) NOT NULL,
    `readFlag` VARCHAR(20) NULL,
    `swVersion` VARCHAR(30) NULL,
    `hwVersion` VARCHAR(30) NULL,
    `ssid0` VARCHAR(30) NULL,
    `ssid4` VARCHAR(30) NULL,
    `dataIn` TIMESTAMP(0) NOT NULL,
    `failDescription` VARCHAR(100) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `turno` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descricao` VARCHAR(45) NULL,

    UNIQUE INDEX `descricao_UNIQUE`(`descricao`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_at` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user` VARCHAR(100) NOT NULL,
    `login` INTEGER NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `sector` VARCHAR(30) NOT NULL,
    `hierarchy` VARCHAR(25) NOT NULL,
    `profile` VARCHAR(200) NOT NULL,
    `UserCad` INTEGER NULL,
    `DateCad` DATETIME(0) NULL,
    `isOnline` VARCHAR(10) NULL,
    `DataLogin` DATETIME(0) NULL,
    `UserUpdate` INTEGER NULL,
    `DateUpdate` DATETIME(0) NULL,

    UNIQUE INDEX `unique_user`(`user`),
    UNIQUE INDEX `unique_login`(`login`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `brc_packing_label_package` ADD CONSTRAINT `brc_packing_label_package_brc_packing_label_produto_FK` FOREIGN KEY (`productBom`, `productSku`) REFERENCES `brc_packing_label_produto`(`bom`, `sku`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `brc_packing_label_registros` ADD CONSTRAINT `brc_packing_label_registros_brc_packing_label_package_FK` FOREIGN KEY (`loteID`) REFERENCES `brc_packing_label_package`(`loteID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `eqp_option` ADD CONSTRAINT `pk_eqp_option_serial` FOREIGN KEY (`eqp_sn`) REFERENCES `equipamentos`(`serial_number`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `equipment` ADD CONSTRAINT `fk_equipments_brand` FOREIGN KEY (`brand`) REFERENCES `supplier`(`brand`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `equipment` ADD CONSTRAINT `fk_equipments_shed` FOREIGN KEY (`shed`) REFERENCES `shed`(`shed`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `equipment` ADD CONSTRAINT `fk_equipments_status` FOREIGN KEY (`status`) REFERENCES `status`(`status`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `equipments_process` ADD CONSTRAINT `fk_equipments_process_shed` FOREIGN KEY (`shed`) REFERENCES `shed`(`shed`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `equipments_process` ADD CONSTRAINT `fk_equipments_process_supplier` FOREIGN KEY (`supplier`) REFERENCES `supplier`(`brand`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `equipments_process` ADD CONSTRAINT `fk_equipments_process_user_cad` FOREIGN KEY (`user_cad`) REFERENCES `tracelog_users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `equipments_process` ADD CONSTRAINT `fk_equipments_process_user_up` FOREIGN KEY (`user_up`) REFERENCES `tracelog_users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `jig_test` ADD CONSTRAINT `fk_jig_brand` FOREIGN KEY (`brand`) REFERENCES `supplier`(`brand`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `jig_test` ADD CONSTRAINT `fk_jig_shed` FOREIGN KEY (`shed`) REFERENCES `shed`(`shed`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `jig_test` ADD CONSTRAINT `fk_jig_status` FOREIGN KEY (`status`) REFERENCES `status`(`status`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `ns_check_ddr` ADD CONSTRAINT `fk_userID` FOREIGN KEY (`UserID`) REFERENCES `tracelog_users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `packing_embarque` ADD CONSTRAINT `packing_embarque_FK` FOREIGN KEY (`Modelo`) REFERENCES `packing_modelo`(`Cod_sap`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brand`) REFERENCES `supplier`(`brand`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`shed`) REFERENCES `shed`(`shed`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`status`) REFERENCES `status`(`status`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `products_process` ADD CONSTRAINT `fk_product_process_shed` FOREIGN KEY (`shed`) REFERENCES `shed`(`shed`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repair_registros` ADD CONSTRAINT `repair_registros_repair_cause_list_FK` FOREIGN KEY (`defCauseCode`) REFERENCES `repair_cause_list`(`causeCode`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repair_registros` ADD CONSTRAINT `repair_registros_repair_defect_list_FK` FOREIGN KEY (`defInputCode`) REFERENCES `repair_defect_list`(`defCode`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repair_registros` ADD CONSTRAINT `repair_registros_repair_defect_list_FK_1` FOREIGN KEY (`defDiagATCode`) REFERENCES `repair_defect_list`(`defCode`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `repair_registros` ADD CONSTRAINT `repair_registros_repair_solve_list_FK` FOREIGN KEY (`soluctionCode`) REFERENCES `repair_solve_list`(`soluctionCode`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reports_lcd_at` ADD CONSTRAINT `fk_user_at_user` FOREIGN KEY (`UserCad`) REFERENCES `user_at`(`login`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reports_scrap_at` ADD CONSTRAINT `fk_reports_scrap_at_center` FOREIGN KEY (`center`) REFERENCES `center_at`(`center`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reports_scrap_at` ADD CONSTRAINT `fk_reports_scrap_at_deposit` FOREIGN KEY (`deposit`) REFERENCES `deposit_at`(`deposit`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reports_scrap_at` ADD CONSTRAINT `fk_reports_scrap_at_material` FOREIGN KEY (`material`) REFERENCES `material_at`(`material`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reports_scrap_at` ADD CONSTRAINT `fk_reports_scrap_at_process` FOREIGN KEY (`process`) REFERENCES `process_at`(`process`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reports_scrap_at` ADD CONSTRAINT `fk_reports_scrap_at_product` FOREIGN KEY (`product`) REFERENCES `product_at`(`product`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reports_stove_at` ADD CONSTRAINT `fk_stove_at_shed` FOREIGN KEY (`shed`) REFERENCES `shed`(`shed`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reports_stove_at` ADD CONSTRAINT `fk_stove_at_stove` FOREIGN KEY (`stoveLocation`) REFERENCES `stove`(`stove`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `reports_stove_at` ADD CONSTRAINT `fk_stove_at_user` FOREIGN KEY (`UserCad`) REFERENCES `user_at`(`login`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `spare_part` ADD CONSTRAINT `fk_spare_part_brand` FOREIGN KEY (`brand`) REFERENCES `supplier`(`brand`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `spare_part` ADD CONSTRAINT `fk_spare_part_shed` FOREIGN KEY (`shed`) REFERENCES `shed`(`shed`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `spare_part` ADD CONSTRAINT `fk_spare_part_status` FOREIGN KEY (`status`) REFERENCES `status`(`status`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `support_tickets` ADD CONSTRAINT `fk_line` FOREIGN KEY (`line`) REFERENCES `linha_prod`(`line`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_mac_consumition` ADD CONSTRAINT `tracelog_mac_consumition_tracelog_mac_control_FK` FOREIGN KEY (`macNumber`) REFERENCES `tracelog_mac_control`(`macNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_mv_equipments` ADD CONSTRAINT `fk_tracelog_mv_equipments` FOREIGN KEY (`code`) REFERENCES `equipment`(`serial`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_mv_equipments` ADD CONSTRAINT `fk_tracelog_mv_equipments_CreateUser` FOREIGN KEY (`CreateUser`) REFERENCES `tracelog_users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_mv_equipments` ADD CONSTRAINT `fk_tracelog_mv_equipments_shed` FOREIGN KEY (`shed`) REFERENCES `shed`(`shed`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_oper` ADD CONSTRAINT `USER_KEY` FOREIGN KEY (`CreationUser`) REFERENCES `tracelog_users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_pth_keyence_componentes` ADD CONSTRAINT `tracelog_pth_keyence_componentes_tracelog_pth_keyence_boards_FK` FOREIGN KEY (`idBoards`) REFERENCES `tracelog_pth_keyence_boards`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_rate` ADD CONSTRAINT `tracelog_rate_packing_modelo_FK` FOREIGN KEY (`ModelId`) REFERENCES `packing_modelo`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_rate` ADD CONSTRAINT `tracelog_rate_tracelog_users_FK` FOREIGN KEY (`CreateUserId`) REFERENCES `tracelog_users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_rate` ADD CONSTRAINT `tracelog_rate_tracelog_users_FK_1` FOREIGN KEY (`UpdateUserId`) REFERENCES `tracelog_users`(`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_ssd_ddr_relationship` ADD CONSTRAINT `tracelog_ssd_ddr_relationship_packing_modelo_FK` FOREIGN KEY (`Sku`) REFERENCES `packing_modelo`(`Cod_sap`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_ssd_sncontrol` ADD CONSTRAINT `tracelog_ssd_sncontrol_FK` FOREIGN KEY (`Status`) REFERENCES `tracelog_status`(`StatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tool_control` ADD CONSTRAINT `tracelog_tool_control_FK` FOREIGN KEY (`productionOrder`) REFERENCES `packing_embarque`(`Processo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_assembly` ADD CONSTRAINT `tracelog_tv_assembly_FK` FOREIGN KEY (`model`) REFERENCES `packing_modelo`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_box_history` ADD CONSTRAINT `tracelog_tv_box_history_FK` FOREIGN KEY (`idProduct`) REFERENCES `tracelog_tv_models`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_itemlist` ADD CONSTRAINT `tracelog_tv_itemlist_FK` FOREIGN KEY (`idModel`) REFERENCES `packing_modelo`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_pa` ADD CONSTRAINT `tracelog_tv_pa_FK` FOREIGN KEY (`T1`) REFERENCES `tracelog_status`(`StatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_pa` ADD CONSTRAINT `tracelog_tv_pa_FK_1` FOREIGN KEY (`T2`) REFERENCES `tracelog_status`(`StatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_pa` ADD CONSTRAINT `tracelog_tv_pa_FK_2` FOREIGN KEY (`T3`) REFERENCES `tracelog_status`(`StatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_pa` ADD CONSTRAINT `tracelog_tv_pa_FK_3` FOREIGN KEY (`T4`) REFERENCES `tracelog_status`(`StatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_pa` ADD CONSTRAINT `tracelog_tv_pa_FK_4` FOREIGN KEY (`T5`) REFERENCES `tracelog_status`(`StatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_pa` ADD CONSTRAINT `tracelog_tv_pa_FK_5` FOREIGN KEY (`T6`) REFERENCES `tracelog_status`(`StatusID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_pth` ADD CONSTRAINT `FK_SerialPTHtv` FOREIGN KEY (`SerialNumber`) REFERENCES `tracelog_tv_pth_sn`(`SerialNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `tracelog_tv_setup` ADD CONSTRAINT `tracelog_tv_setup_FK` FOREIGN KEY (`Model`) REFERENCES `packing_modelo`(`Cod_sap`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_tv_setup` ADD CONSTRAINT `tracelog_tv_setup_FK_1` FOREIGN KEY (`Line`) REFERENCES `packing_linha`(`LinhaID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tracelog_zte_aging_car` ADD CONSTRAINT `fk_Status` FOREIGN KEY (`Status`) REFERENCES `tracelog_status`(`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `tracelog_zte_aging_reg` ADD CONSTRAINT `fk_CarID` FOREIGN KEY (`CarID`) REFERENCES `tracelog_zte_aging_car`(`CarID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `tracelog_zte_aging_test` ADD CONSTRAINT `fk_CarID_test` FOREIGN KEY (`CarID`) REFERENCES `tracelog_zte_aging_car`(`CarID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `tracelog_zte_aging_test` ADD CONSTRAINT `fk_Status_test` FOREIGN KEY (`Status`) REFERENCES `tracelog_status`(`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `tracelog_zte_pth` ADD CONSTRAINT `FK_SerialPTH` FOREIGN KEY (`SerialNumber`) REFERENCES `tracelog_zte_pth_sn`(`SerialNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION;
