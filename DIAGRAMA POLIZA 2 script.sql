-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ER-POLIZA2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ER-POLIZA2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ER-POLIZA2` DEFAULT CHARACTER SET utf8 ;
USE `ER-POLIZA2` ;

-- -----------------------------------------------------
-- Table `ER-POLIZA2`.`PÓLIZA_VIDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-POLIZA2`.`PÓLIZA_VIDA` (
  `número` INT NOT NULL,
  `fecha_ini` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  PRIMARY KEY (`número`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-POLIZA2`.`PÓLIZA_AUTOMÓVIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-POLIZA2`.`PÓLIZA_AUTOMÓVIL` (
  `número` INT NOT NULL,
  `fecha_ini` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `mátricula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`número`, `mátricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-POLIZA2`.`PÓLIZA_VIVIENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-POLIZA2`.`PÓLIZA_VIVIENDA` (
  `número` INT NOT NULL,
  `fecha_ini` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `domicilio` GEOMETRY NOT NULL,
  PRIMARY KEY (`número`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-POLIZA2`.`BENEFICIARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-POLIZA2`.`BENEFICIARIO` (
  `dni` INT NOT NULL,
  `nombre` VARCHAR(40) NOT NULL,
  `fecha_nacim` DATE NOT NULL,
  `PÓLIZA_VIDA_número` INT NOT NULL,
  `PÓLIZA_AUTOMÓVIL_número` INT NOT NULL,
  `PÓLIZA_VIVIENDA_número` INT NOT NULL,
  INDEX `fk_BENEFICIARIO_PÓLIZA_VIDA1_idx` (`PÓLIZA_VIDA_número` ASC) VISIBLE,
  INDEX `fk_BENEFICIARIO_PÓLIZA_AUTOMÓVIL1_idx` (`PÓLIZA_AUTOMÓVIL_número` ASC) VISIBLE,
  INDEX `fk_BENEFICIARIO_PÓLIZA_VIVIENDA1_idx` (`PÓLIZA_VIVIENDA_número` ASC) VISIBLE,
  CONSTRAINT `fk_BENEFICIARIO_PÓLIZA_VIDA1`
    FOREIGN KEY (`PÓLIZA_VIDA_número`)
    REFERENCES `ER-POLIZA2`.`PÓLIZA_VIDA` (`número`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BENEFICIARIO_PÓLIZA_AUTOMÓVIL1`
    FOREIGN KEY (`PÓLIZA_AUTOMÓVIL_número`)
    REFERENCES `ER-POLIZA2`.`PÓLIZA_AUTOMÓVIL` (`número`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BENEFICIARIO_PÓLIZA_VIVIENDA1`
    FOREIGN KEY (`PÓLIZA_VIVIENDA_número`)
    REFERENCES `ER-POLIZA2`.`PÓLIZA_VIVIENDA` (`número`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
