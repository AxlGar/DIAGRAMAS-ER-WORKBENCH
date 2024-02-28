-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ER- RelacionBinaria- MN
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ER- RelacionBinaria- MN
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ER- RelacionBinaria- MN` DEFAULT CHARACTER SET utf8 ;
USE `ER- RelacionBinaria- MN` ;

-- -----------------------------------------------------
-- Table `ER- RelacionBinaria- MN`.`MÉDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER- RelacionBinaria- MN`.`MÉDICO` (
  `codmed` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codmed`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER- RelacionBinaria- MN`.`PACIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER- RelacionBinaria- MN`.`PACIENTE` (
  `codpac` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codpac`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER- RelacionBinaria- MN`.`CITA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER- RelacionBinaria- MN`.`CITA` (
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `MÉDICO_codmed` INT NOT NULL,
  `PACIENTE_codpac` INT NOT NULL,
  INDEX `fk_CITA_MÉDICO_idx` (`MÉDICO_codmed` ASC) VISIBLE,
  INDEX `fk_CITA_PACIENTE1_idx` (`PACIENTE_codpac` ASC) VISIBLE,
  CONSTRAINT `fk_CITA_MÉDICO`
    FOREIGN KEY (`MÉDICO_codmed`)
    REFERENCES `ER- RelacionBinaria- MN`.`MÉDICO` (`codmed`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CITA_PACIENTE1`
    FOREIGN KEY (`PACIENTE_codpac`)
    REFERENCES `ER- RelacionBinaria- MN`.`PACIENTE` (`codpac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
