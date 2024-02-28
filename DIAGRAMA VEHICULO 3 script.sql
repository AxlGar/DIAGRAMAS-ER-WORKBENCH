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
-- Table `mydb`.`CONDUCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONDUCE` (
  `codemp` INT NOT NULL,
  `matricula` VARCHAR(10) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  PRIMARY KEY (`codemp`, `matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehiculo_copy1_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehiculo_copy1_copy1` (
  `modelo` VARCHAR(15) NOT NULL,
  `CONDUCE_matricula` VARCHAR(10) NOT NULL,
  INDEX `fk_Vehiculo_copy1_copy1_CONDUCE1_idx` (`CONDUCE_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Vehiculo_copy1_copy1_CONDUCE1`
    FOREIGN KEY (`CONDUCE_matricula`)
    REFERENCES `mydb`.`CONDUCE` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado_copy1_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado_copy1_copy1` (
  `nombre` VARCHAR(30) NOT NULL,
  `CONDUCE_codemp` INT NOT NULL,
  INDEX `fk_Empleado_copy1_copy1_CONDUCE1_idx` (`CONDUCE_codemp` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_copy1_copy1_CONDUCE1`
    FOREIGN KEY (`CONDUCE_codemp`)
    REFERENCES `mydb`.`CONDUCE` (`codemp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
