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
-- Table `mydb`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EMPLEADO` (
  `nif` INT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`E-E`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-E` (
  `departamtento` INT NOT NULL,
  `EMPLEADO_nif-esresponsable` INT NULL,
  `EMPLEADO_nif-1tieneresponsable` INT NULL,
  PRIMARY KEY (`EMPLEADO_nif-esresponsable`, `EMPLEADO_nif-1tieneresponsable`),
  INDEX `fk_E-E_EMPLEADO_idx` (`EMPLEADO_nif-esresponsable` ASC) VISIBLE,
  INDEX `fk_E-E_EMPLEADO1_idx` (`EMPLEADO_nif-1tieneresponsable` ASC) VISIBLE,
  CONSTRAINT `fk_E-E_EMPLEADO`
    FOREIGN KEY (`EMPLEADO_nif-esresponsable`)
    REFERENCES `mydb`.`EMPLEADO` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_E-E_EMPLEADO1`
    FOREIGN KEY (`EMPLEADO_nif-1tieneresponsable`)
    REFERENCES `mydb`.`EMPLEADO` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
