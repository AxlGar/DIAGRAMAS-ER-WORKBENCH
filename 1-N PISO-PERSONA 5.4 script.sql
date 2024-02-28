-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PisoPersona5.4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PisoPersona5.4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PisoPersona5.4` DEFAULT CHARACTER SET utf8 ;
USE `PisoPersona5.4` ;

-- -----------------------------------------------------
-- Table `PisoPersona5.4`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PisoPersona5.4`.`Persona` (
  `Nif` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  PRIMARY KEY (`Nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PisoPersona5.4`.`Piso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PisoPersona5.4`.`Piso` (
  `Cod-piso` INT NOT NULL,
  `calle` VARCHAR(45) NULL,
  `número` VARCHAR(45) NULL,
  `planta` VARCHAR(45) NULL,
  `puerta` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod-piso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PisoPersona5.4`.`P-P`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PisoPersona5.4`.`P-P` (
  `Persona_Nif` INT NOT NULL,
  `Precio_alquiler` DOUBLE NULL,
  `Piso_Cod-piso` INT NOT NULL,
  PRIMARY KEY (`Persona_Nif`, `Piso_Cod-piso`),
  INDEX `fk_P-P_Piso1_idx` (`Piso_Cod-piso` ASC) VISIBLE,
  CONSTRAINT `fk_table3_Persona`
    FOREIGN KEY (`Persona_Nif`)
    REFERENCES `PisoPersona5.4`.`Persona` (`Nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_P-P_Piso1`
    FOREIGN KEY (`Piso_Cod-piso`)
    REFERENCES `PisoPersona5.4`.`Piso` (`Cod-piso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PisoPersona5.4`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PisoPersona5.4`.`DEPARTAMENTO` (
  `Cod_Dpto` INT NOT NULL,
  `Nombre_Dpto` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Dpto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PisoPersona5.4`.`PROFESOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PisoPersona5.4`.`PROFESOR` (
  `Nif` INT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `funcion` VARCHAR(45) NULL,
  `DEPARTAMENTO_Cod_Dpto` INT NOT NULL,
  PRIMARY KEY (`DEPARTAMENTO_Cod_Dpto`),
  CONSTRAINT `fk_PROFESOR_DEPARTAMENTO1`
    FOREIGN KEY (`DEPARTAMENTO_Cod_Dpto`)
    REFERENCES `PisoPersona5.4`.`DEPARTAMENTO` (`Cod_Dpto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
