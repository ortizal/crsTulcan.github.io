-- MySQL Script generated by MySQL Workbench
-- Wed Sep  9 14:26:36 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema libros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema libros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libros` DEFAULT CHARACTER SET utf8 ;
USE `libros` ;

-- -----------------------------------------------------
-- Table `libros`.`dewey`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`dewey` (
  `iddewey` INT NOT NULL AUTO_INCREMENT,
  `codigo` FLOAT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`iddewey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libros`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`estado` (
  `idestado` INT NOT NULL AUTO_INCREMENT,
  `estadocol` VARCHAR(45) NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libros`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`libros` (
  `idlibros` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(60) NULL,
  `autor` TEXT NULL,
  `edicion` VARCHAR(45) NULL,
  `ibsn` VARCHAR(45) NULL,
  `cutter` VARCHAR(45) NULL,
  `dewey_iddewey` INT NOT NULL,
  `añoPublicacion` YEAR NULL,
  `fechaIngreso` DATE NULL,
  `codigo` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `editorial` TEXT NULL,
  `nLibros` INT NULL,
  `nPaginas` INT NULL,
  `estado_idestado` INT NOT NULL,
  PRIMARY KEY (`idlibros`),
  INDEX `fk_libros_dewey_idx` (`dewey_iddewey` ASC) VISIBLE,
  INDEX `fk_libros_estado1_idx` (`estado_idestado` ASC) VISIBLE,
  CONSTRAINT `fk_libros_dewey`
    FOREIGN KEY (`dewey_iddewey`)
    REFERENCES `libros`.`dewey` (`iddewey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libros_estado1`
    FOREIGN KEY (`estado_idestado`)
    REFERENCES `libros`.`estado` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libros`.`pabellon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`pabellon` (
  `idpabellon` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idpabellon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libros`.`celda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`celda` (
  `idcelda` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `pabellon_idpabellon` INT NOT NULL,
  PRIMARY KEY (`idcelda`),
  INDEX `fk_celda_pabellon1_idx` (`pabellon_idpabellon` ASC) VISIBLE,
  CONSTRAINT `fk_celda_pabellon1`
    FOREIGN KEY (`pabellon_idpabellon`)
    REFERENCES `libros`.`pabellon` (`idpabellon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libros`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `cedula` VARCHAR(45) NULL,
  `pabellon_idpabellon` INT NOT NULL,
  `celda_idcelda` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_pabellon1_idx` (`pabellon_idpabellon` ASC) VISIBLE,
  INDEX `fk_usuario_celda1_idx` (`celda_idcelda` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_pabellon1`
    FOREIGN KEY (`pabellon_idpabellon`)
    REFERENCES `libros`.`pabellon` (`idpabellon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_celda1`
    FOREIGN KEY (`celda_idcelda`)
    REFERENCES `libros`.`celda` (`idcelda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libros`.`prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`prestamo` (
  `idprestamo` INT NOT NULL AUTO_INCREMENT,
  `diaPrestamo` DATE NULL,
  `diaDevolucion` DATE NULL,
  `usuario_idusuario` INT NOT NULL,
  `libros_idlibros` INT NOT NULL,
  PRIMARY KEY (`idprestamo`),
  INDEX `fk_prestamo_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  INDEX `fk_prestamo_libros1_idx` (`libros_idlibros` ASC) VISIBLE,
  CONSTRAINT `fk_prestamo_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `libros`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prestamo_libros1`
    FOREIGN KEY (`libros_idlibros`)
    REFERENCES `libros`.`libros` (`idlibros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;