-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PC` DEFAULT CHARACTER SET utf8 ;
USE `PC` ;

-- -----------------------------------------------------
-- Table `PC`.`PILOTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PC`.`PILOTO` (
  `Nif` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `table3col` VARCHAR(45) NULL,
  `COCHE_Matricula` INT NOT NULL,
  PRIMARY KEY (`Nif`, `COCHE_Matricula`),
  INDEX `fk_PILOTO_COCHE1_idx` (`COCHE_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_PILOTO_COCHE1`
    FOREIGN KEY (`COCHE_Matricula`)
    REFERENCES `PC`.`COCHE` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PC`.`COCHE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PC`.`COCHE` (
  `Matricula` INT NOT NULL,
  `Asientos` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `PILOTO_Nif` INT NOT NULL,
  PRIMARY KEY (`Matricula`, `PILOTO_Nif`),
  INDEX `fk_COCHE_PILOTO_idx` (`PILOTO_Nif` ASC) VISIBLE,
  CONSTRAINT `fk_COCHE_PILOTO`
    FOREIGN KEY (`PILOTO_Nif`)
    REFERENCES `PC`.`PILOTO` (`Nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PC`.`P-C`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PC`.`P-C` (
  `PILOTO_Nif` INT NOT NULL,
  `PILOTO_COCHE_Matricula` INT NOT NULL,
  PRIMARY KEY (`PILOTO_Nif`, `PILOTO_COCHE_Matricula`),
  CONSTRAINT `fk_P-C_PILOTO1`
    FOREIGN KEY (`PILOTO_Nif` , `PILOTO_COCHE_Matricula`)
    REFERENCES `PC`.`PILOTO` (`Nif` , `COCHE_Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
