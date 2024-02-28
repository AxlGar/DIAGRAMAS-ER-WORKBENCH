-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`POLIZA_VIVIENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`POLIZA_VIVIENDA` (
  `domicilio` TINYTEXT NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BENEFICIARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BENEFICIARIO` (
  `dni` INT NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `fecha_nacim` DATE NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`POLIZA_VIDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`POLIZA_VIDA` (
  `BENEFICIARIO_dni` INT NOT NULL,
  `numero` INT NOT NULL,
  INDEX `fk_POLIZA_VIDA_BENEFICIARIO1_idx` (`BENEFICIARIO_dni` ASC) VISIBLE,
  PRIMARY KEY (`numero`),
  CONSTRAINT `fk_POLIZA_VIDA_BENEFICIARIO1`
    FOREIGN KEY (`BENEFICIARIO_dni`)
    REFERENCES `mydb`.`BENEFICIARIO` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`POLIZA_AUTOMOVIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`POLIZA_AUTOMOVIL` (
  `matricula` VARCHAR(10) NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`matricula`, `numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`POLIZA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`POLIZA` (
  `fecha_ini` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `POLIZA_VIVIENDA_numero` INT NOT NULL,
  `POLIZA_VIDA_numero` INT NOT NULL,
  `POLIZA_AUTOMOVIL_numero` INT NOT NULL,
  INDEX `fk_POLIZA_POLIZA_VIVIENDA1_idx` (`POLIZA_VIVIENDA_numero` ASC) VISIBLE,
  INDEX `fk_POLIZA_POLIZA_VIDA1_idx` (`POLIZA_VIDA_numero` ASC) VISIBLE,
  INDEX `fk_POLIZA_POLIZA_AUTOMOVIL1_idx` (`POLIZA_AUTOMOVIL_numero` ASC) VISIBLE,
  CONSTRAINT `fk_POLIZA_POLIZA_VIVIENDA1`
    FOREIGN KEY (`POLIZA_VIVIENDA_numero`)
    REFERENCES `mydb`.`POLIZA_VIVIENDA` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLIZA_POLIZA_VIDA1`
    FOREIGN KEY (`POLIZA_VIDA_numero`)
    REFERENCES `mydb`.`POLIZA_VIDA` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLIZA_POLIZA_AUTOMOVIL1`
    FOREIGN KEY (`POLIZA_AUTOMOVIL_numero`)
    REFERENCES `mydb`.`POLIZA_AUTOMOVIL` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
