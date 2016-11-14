CREATE SCHEMA IF NOT EXISTS `casevsm` DEFAULT CHARACTER SET utf8 ;
USE `casevsm` ;

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC));

CREATE TABLE IF NOT EXISTS `endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` CHAR(2) NOT NULL,
  `cliente` INT NOT NULL,
  PRIMARY KEY (`id`, `cliente`),
  INDEX `fk_endereco_cliente_idx` (`cliente` ASC),
  CONSTRAINT `fk_endereco_cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `casevsm`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `casevsm`.`telefone` (
  `id` INT NULL AUTO_INCREMENT,
  `ddd` CHAR(2) NOT NULL,
  `numero` VARCHAR(9) NOT NULL,
  `cliente` INT NOT NULL,
  PRIMARY KEY (`id`, `cliente`),
  INDEX `fk_telefone_cliente1_idx` (`cliente` ASC),
  CONSTRAINT `fk_telefone_cliente1`
    FOREIGN KEY (`cliente`)
    REFERENCES `casevsm`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);