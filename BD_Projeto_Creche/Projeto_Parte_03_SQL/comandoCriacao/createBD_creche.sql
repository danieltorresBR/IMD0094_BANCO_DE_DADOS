-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bdcreche
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdcreche
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdcreche` DEFAULT CHARACTER SET utf8 ;
USE `bdcreche` ;

-- -----------------------------------------------------
-- Table `bdcreche`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Pessoa` (
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Responsavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Responsavel` (
  `Endereco_Email` VARCHAR(50) NOT NULL,
  `Rua` VARCHAR(45) NULL,
  `Numero` VARCHAR(5) NULL,
  `Bairro` VARCHAR(45) NULL,
  `Cidade` VARCHAR(45) NULL,
  `UF` VARCHAR(2) NULL,
  `CEP` VARCHAR(9) NULL,
  `Pessoa_CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Endereco_Email`, `Pessoa_CPF`),
  UNIQUE INDEX `Endereco_Email_UNIQUE` (`Endereco_Email` ASC) VISIBLE,
  INDEX `fk_Responsavel_Pessoa1_idx` (`Pessoa_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Responsavel_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `bdcreche`.`Pessoa` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Telefone_responsavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Telefone_responsavel` (
  `Telefone` VARCHAR(50) NULL,
  `Responsavel_Endereco_Email` VARCHAR(50) NOT NULL,
  INDEX `fk_Telefone_responsavel_Responsavel_idx` (`Responsavel_Endereco_Email` ASC) VISIBLE,
  PRIMARY KEY (`Responsavel_Endereco_Email`),
  CONSTRAINT `fk_Telefone_responsavel_Responsavel`
    FOREIGN KEY (`Responsavel_Endereco_Email`)
    REFERENCES `bdcreche`.`Responsavel` (`Endereco_Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Professor` (
  `Pessoa_CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Pessoa_CPF`),
  CONSTRAINT `fk_Professor_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `bdcreche`.`Pessoa` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Aluno` (
  `Matricula` VARCHAR(10) NOT NULL,
  `Periodo` INT NOT NULL,
  `Turma` VARCHAR(10) NULL,
  `Data_Nascimento` DATE NOT NULL,
  `Grupo_Sanguineo` VARCHAR(2) NULL,
  `Fator_RH` VARCHAR(1) NULL,
  `Nome_Aluno` VARCHAR(45) NULL,
  PRIMARY KEY (`Matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Pessoa_Autorizada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Pessoa_Autorizada` (
  `Grau_Paresntesco` VARCHAR(45) NOT NULL,
  `Pessoa_CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Pessoa_CPF`),
  INDEX `fk_Pessoa_Autorizada_Pessoa1_idx` (`Pessoa_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_Autorizada_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF`)
    REFERENCES `bdcreche`.`Pessoa` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Folha_Diaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Folha_Diaria` (
  `Data` DATE NOT NULL,
  `Horario_Entrada` TIME NOT NULL,
  `Horario_Saida` TIME NOT NULL,
  `Horario_Dormiu` TIME NULL,
  `Horario_Acordou` TIME NULL,
  `Aviso` VARCHAR(100) NULL,
  `Alimentacao` VARCHAR(100) NULL,
  `Dosagem_Medicacao` INT NULL,
  `Nome_Medicacao` VARCHAR(45) NULL,
  `Horario_Medicacao` TIME NULL,
  `Nome_Adm_Medicacao` VARCHAR(45) NULL,
  `Professor_Pessoa_CPF` VARCHAR(11) NOT NULL,
  `Responsavel_Endereco_Email` VARCHAR(50) NOT NULL,
  `Responsavel_Pessoa_CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Data`, `Professor_Pessoa_CPF`, `Responsavel_Endereco_Email`, `Responsavel_Pessoa_CPF`),
  INDEX `fk_Folha_Diaria_Professor1_idx` (`Professor_Pessoa_CPF` ASC) VISIBLE,
  INDEX `fk_Folha_Diaria_Responsavel1_idx` (`Responsavel_Endereco_Email` ASC, `Responsavel_Pessoa_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Folha_Diaria_Professor1`
    FOREIGN KEY (`Professor_Pessoa_CPF`)
    REFERENCES `bdcreche`.`Professor` (`Pessoa_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Folha_Diaria_Responsavel1`
    FOREIGN KEY (`Responsavel_Endereco_Email` , `Responsavel_Pessoa_CPF`)
    REFERENCES `bdcreche`.`Responsavel` (`Endereco_Email` , `Pessoa_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Aluno_Alergias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Aluno_Alergias` (
  `Alergias` VARCHAR(45) NOT NULL,
  `Aluno_Matricula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Alergias`, `Aluno_Matricula`),
  INDEX `fk_Aluno_Alergias_Aluno1_idx` (`Aluno_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_Alergias_Aluno1`
    FOREIGN KEY (`Aluno_Matricula`)
    REFERENCES `bdcreche`.`Aluno` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Folha_Diaria_Atividade_Realizada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Folha_Diaria_Atividade_Realizada` (
  `Atividade_Realizada` VARCHAR(100) NULL,
  `Folha_Diaria_Data` DATE NOT NULL,
  PRIMARY KEY (`Folha_Diaria_Data`),
  INDEX `fk_Folha_Diaria_Atividade_Realizada_Folha_Diaria1_idx` (`Folha_Diaria_Data` ASC) VISIBLE,
  CONSTRAINT `fk_Folha_Diaria_Atividade_Realizada_Folha_Diaria1`
    FOREIGN KEY (`Folha_Diaria_Data`)
    REFERENCES `bdcreche`.`Folha_Diaria` (`Data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Folha_Diaria_Itens_reposicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Folha_Diaria_Itens_reposicao` (
  `Itens_reposicao` VARCHAR(100) NULL,
  `Folha_Diaria_Data` DATE NOT NULL,
  PRIMARY KEY (`Folha_Diaria_Data`),
  INDEX `fk_Folha_Diaria_Itens_reposicao_Folha_Diaria1_idx` (`Folha_Diaria_Data` ASC) VISIBLE,
  CONSTRAINT `fk_Folha_Diaria_Itens_reposicao_Folha_Diaria1`
    FOREIGN KEY (`Folha_Diaria_Data`)
    REFERENCES `bdcreche`.`Folha_Diaria` (`Data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Pessoa_Autorizada_has_Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Pessoa_Autorizada_has_Aluno` (
  `Pessoa_Autorizada_Pessoa_CPF` VARCHAR(11) NOT NULL,
  `Aluno_Matricula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Pessoa_Autorizada_Pessoa_CPF`, `Aluno_Matricula`),
  INDEX `fk_Pessoa_Autorizada_has_Aluno_Aluno1_idx` (`Aluno_Matricula` ASC) VISIBLE,
  INDEX `fk_Pessoa_Autorizada_has_Aluno_Pessoa_Autorizada1_idx` (`Pessoa_Autorizada_Pessoa_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_Autorizada_has_Aluno_Pessoa_Autorizada1`
    FOREIGN KEY (`Pessoa_Autorizada_Pessoa_CPF`)
    REFERENCES `bdcreche`.`Pessoa_Autorizada` (`Pessoa_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_Autorizada_has_Aluno_Aluno1`
    FOREIGN KEY (`Aluno_Matricula`)
    REFERENCES `bdcreche`.`Aluno` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdcreche`.`Responsavel_has_Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdcreche`.`Responsavel_has_Aluno` (
  `Responsavel_Endereco_Email` VARCHAR(50) NOT NULL,
  `Responsavel_Pessoa_CPF` VARCHAR(11) NOT NULL,
  `Aluno_Matricula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Responsavel_Endereco_Email`, `Responsavel_Pessoa_CPF`, `Aluno_Matricula`),
  INDEX `fk_Responsavel_has_Aluno_Aluno1_idx` (`Aluno_Matricula` ASC) VISIBLE,
  INDEX `fk_Responsavel_has_Aluno_Responsavel1_idx` (`Responsavel_Endereco_Email` ASC, `Responsavel_Pessoa_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Responsavel_has_Aluno_Responsavel1`
    FOREIGN KEY (`Responsavel_Endereco_Email` , `Responsavel_Pessoa_CPF`)
    REFERENCES `bdcreche`.`Responsavel` (`Endereco_Email` , `Pessoa_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Responsavel_has_Aluno_Aluno1`
    FOREIGN KEY (`Aluno_Matricula`)
    REFERENCES `bdcreche`.`Aluno` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
