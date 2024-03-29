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
-- Table `mydb`.`POLIZA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`POLIZA` (
  `numero` INT NOT NULL,
  `tipo` ENUM("vida", "automovil", "vivienda") NOT NULL,
  `fecha_ini` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `matricula` VARCHAR(10) NULL,
  `domicilio` TINYTEXT NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BENEFICIARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BENEFICIARIO` (
  `dni` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_nacim` DATE NULL,
  `POLIZA_numero` INT NOT NULL,
  PRIMARY KEY (`dni`),
  INDEX `fk_BENEFICIARIO_POLIZA_idx` (`POLIZA_numero` ASC) VISIBLE,
  CONSTRAINT `fk_BENEFICIARIO_POLIZA`
    FOREIGN KEY (`POLIZA_numero`)
    REFERENCES `mydb`.`POLIZA` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
