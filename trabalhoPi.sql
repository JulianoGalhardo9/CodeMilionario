SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- Table `mydb`.`Usuario`

CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` CHAR(15) NOT NULL,
  `nomeUsuario` VARCHAR(60) NOT NULL,
  `senhaUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;

-- Table `Turma`

CREATE TABLE IF NOT EXISTS `mydb`.`Turma` (
  `códigoTurma` SMALLINT(6) NOT NULL,
  `nomeTurma` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`códigoTurma`))
ENGINE = InnoDB;

-- Table `Nivel`

CREATE TABLE IF NOT EXISTS `mydb`.`Nivel` (
  `idNível` INT NOT NULL,
  `descriçãoNível` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idNível`))
ENGINE = InnoDB;

-- Table `Questao_Alternativa`

CREATE TABLE IF NOT EXISTS `mydb`.`Questao_Alternativa` (
  `idQuestaoAlternativa` SMALLINT(5) NOT NULL,
  `Enunciado` TEXT(500) NOT NULL,
  `Resposta` VARCHAR(45) NOT NULL,
  `Questao_Alternativacol` VARCHAR(45) NULL,
  `respostaCorreta` VARCHAR(3) NULL,
  PRIMARY KEY (`idQuestaoAlternativa`))
ENGINE = InnoDB;

-- Table `Materia`

CREATE TABLE IF NOT EXISTS `mydb`.`Materia` (
  `idMateria` TINYINT(2) NOT NULL,
  `nomeMateria` VARCHAR(25) NULL,
  PRIMARY KEY (`idMateria`))
ENGINE = InnoDB;

-- Table `Tipo_Usuario`

CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Usuario` (
  `idTipo_Usuario` INT NOT NULL,
  `tipoUsuario` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idTipo_Usuario`))
ENGINE = InnoDB;

-- Table `TipoAjuda`

CREATE TABLE IF NOT EXISTS `mydb`.`TipoAjuda` (
  `codAjuda` TINYINT(2) NOT NULL,
  `nomeAjuda` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codAjuda`))
ENGINE = InnoDB;

-- Table `Cadastro`

CREATE TABLE IF NOT EXISTS `mydb`.`Cadastro` (
  `Usuario_idUsuario` SMALLINT(11) NOT NULL,
  `Tipo_Usuario_idTipo Usuario` INT NOT NULL,
  `Turma_códigoTurma` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Tipo_Usuario_idTipo_Usuario`, `Turma_códigoTurma`),
  INDEX `fk_Cadastro_Tipo_Usuario1_idx` (`Tipo_Usuario_idTipo_Usuario` ASC) ,
  INDEX `fk_Cadastro_Turma1_idx` (`Turma_códigoTurma` ASC) ,
  CONSTRAINT `fk_Cadastro_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cadastro_Tipo_Usuario1`
    FOREIGN KEY (`Tipo_Usuario_idTipo Usuario`)
    REFERENCES `mydb`.`Tipo_Usuario` (`idTipo Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cadastro_Turma1`
    FOREIGN KEY (`Turma_códigoTurma`)
    REFERENCES `mydb`.`Turma` (`códigoTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table `SelecionarJogo`

CREATE TABLE IF NOT EXISTS `mydb`.`SelecionarJogo` (
  `Cadastro_Usuario_idUsuario` SMALLINT(11) NOT NULL,
  `Cadastro_Tipo_Usuario_idTipo Usuario` INT NOT NULL,
  `Cadastro_Turma_CódigoTurma` SMALLINT(6) NOT NULL,
  `Materia_idMateria` TINYINT(2) NOT NULL,
  `Questao_Alternativa_idQuestaoAlternativa` SMALLINT(5) NOT NULL,
  `TipoAjuda_CodAjuda` TINYINT(2) NOT NULL,
  `Nivel_idNível` INT NOT NULL,
  INDEX `fk_Jogo_Cadastro1_idx` (`Cadastro_Usuario_idUsuario` ASC, `Cadastro_Tipo_Usuario_idTipo Usuario` ASC, `Cadastro_Turma_CódigoTurma` ASC) ,
  INDEX `fk_Jogo_Materia1_idx` (`Materia_idMateria` ASC) ,
  INDEX `fk_Jogo_Questao_Alternativa1_idx` (`Questao_Alternativa_idQuestaoAlternativa` ASC) ,
  INDEX `fk_Jogo_TipoAjuda1_idx` (`TipoAjuda_CodAjuda` ASC) ,
  INDEX `fk_Jogo_Nivel1_idx` (`Nivel_idNível` ASC),
  PRIMARY KEY (`Cadastro_Usuario_idUsuario`),
  CONSTRAINT `fk_Jogo_Cadastro1`
    FOREIGN KEY (`Cadastro_Usuario_idUsuario` , `Cadastro_Tipo_Usuario_idTipo Usuario` , `Cadastro_Turma_CódigoTurma`)
    REFERENCES `mydb`.`Cadastro` (`Usuario_idUsuario` , `Tipo_Usuario_idTipo Usuario` , `Turma_códigoTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogo_Materia1`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `mydb`.`Materia` (`idMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogo_Questao_Alternativa1`
    FOREIGN KEY (`Questao_Alternativa_idQuestaoAlternativa`)
    REFERENCES `mydb`.`Questao_Alternativa` (`idQuestaoAlternativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogo_TipoAjuda1`
    FOREIGN KEY (`TipoAjuda_CodAjuda`)
    REFERENCES `mydb`.`TipoAjuda` (`codAjuda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogo_Nivel1`
    FOREIGN KEY (`Nivel_idNível`)
    REFERENCES `mydb`.`Nivel` (`idNível`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
