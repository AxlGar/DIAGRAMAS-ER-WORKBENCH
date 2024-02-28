-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EJEMPLO3.1-2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EJEMPLO3.1-2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EJEMPLO3.1-2` DEFAULT CHARACTER SET utf8 ;
USE `EJEMPLO3.1-2` ;

-- -----------------------------------------------------
-- Table `EJEMPLO3.1-2`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLO3.1-2`.`EMPLEADO` (
  `Nif` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EJEMPLO3.1-2`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLO3.1-2`.`DEPARTAMENTO` (
  `Cod-dpto` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Localidad` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod-dpto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EJEMPLO3.1-2`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLO3.1-2`.`EMPLEADO` (
  `Nif` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EJEMPLO3.1-2`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLO3.1-2`.`DEPARTAMENTO` (
  `Cod-dpto` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Localidad` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod-dpto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EJEMPLO3.1-2`.`EMP-DPTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EJEMPLO3.1-2`.`EMP-DPTO` (
  `EMPLEADO_Nif` INT NOT NULL,
  `DEPARTAMENTO_Cod-dpto` INT NOT NULL,
  PRIMARY KEY (`EMPLEADO_Nif`, `DEPARTAMENTO_Cod-dpto`),
  INDEX `fk_EMP-DPTO_DEPARTAMENTO1_idx` (`DEPARTAMENTO_Cod-dpto` ASC) VISIBLE,
  CONSTRAINT `fk_EMP-DPTO_EMPLEADO1`
    FOREIGN KEY (`EMPLEADO_Nif`)
    REFERENCES `EJEMPLO3.1-2`.`EMPLEADO` (`Nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMP-DPTO_DEPARTAMENTO1`
    FOREIGN KEY (`DEPARTAMENTO_Cod-dpto`)
    REFERENCES `EJEMPLO3.1-2`.`DEPARTAMENTO` (`Cod-dpto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
