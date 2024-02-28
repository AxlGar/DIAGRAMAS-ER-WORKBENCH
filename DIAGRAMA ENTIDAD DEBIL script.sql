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
  `num_emp` INT NOT NULL,
  `num_dept` INT NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `fecha_ingreso` DATE NOT NULL,
  PRIMARY KEY (`num_dept`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPARTAMENTO` (
  `nombre` VARCHAR(30) NOT NULL,
  `presupuesto` INT NOT NULL,
  `EMPLEADO_num_dept` INT NOT NULL,
  INDEX `fk_DEPARTAMENTO_EMPLEADO_idx` (`EMPLEADO_num_dept` ASC) VISIBLE,
  CONSTRAINT `fk_DEPARTAMENTO_EMPLEADO`
    FOREIGN KEY (`EMPLEADO_num_dept`)
    REFERENCES `mydb`.`EMPLEADO` (`num_dept`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
