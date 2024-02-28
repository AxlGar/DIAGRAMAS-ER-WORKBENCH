-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ejemplos
-- -----------------------------------------------------
-- Ejemplos de trancisión

-- -----------------------------------------------------
-- Schema ejemplos
--
-- Ejemplos de trancisión
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ejemplos` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `ejemplos` ;

-- -----------------------------------------------------
-- Table `ejemplos`.`LIBROS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejemplos`.`LIBROS` (
  `isbn` INT NOT NULL,
  `titulo_principal` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `subitutlo` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
  `editorial` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `idioma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`isbn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejemplos`.`AUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejemplos`.`AUTOR` (
  `autor` VARCHAR(30) NOT NULL,
  `LIBROS_isbn` INT NOT NULL,
  INDEX `fk_AUTOR_LIBROS1_idx` (`LIBROS_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_AUTOR_LIBROS1`
    FOREIGN KEY (`LIBROS_isbn`)
    REFERENCES `ejemplos`.`LIBROS` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejemplos`.`EDICIÓN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejemplos`.`EDICIÓN` (
  `numero` INT NOT NULL,
  `año` VARCHAR(45) NOT NULL,
  `LIBROS_isbn` INT NOT NULL,
  INDEX `fk_EDICIÓN_LIBROS_idx` (`LIBROS_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_EDICIÓN_LIBROS`
    FOREIGN KEY (`LIBROS_isbn`)
    REFERENCES `ejemplos`.`LIBROS` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
