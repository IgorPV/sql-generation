-- MySQL Script generated by MySQL Workbench
-- Fri Mar 12 12:12:37 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_generation_game_online
-- -----------------------------------------------------
-- 
-- 

-- -----------------------------------------------------
-- Schema db_generation_game_online
--
-- 
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_generation_game_online` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `db_generation_game_online` ;

-- -----------------------------------------------------
-- Table `db_generation_game_online`.`tb_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_generation_game_online`.`tb_classes` (
  `nome_classe` VARCHAR(50) NOT NULL,
  `nome_subclasse` VARCHAR(50) NOT NULL,
  `id_classe` INT NOT NULL AUTO_INCREMENT,
  UNIQUE INDEX `nome_subclasse_UNIQUE` (`nome_subclasse` ASC) VISIBLE,
  UNIQUE INDEX `id_classe_UNIQUE` (`id_classe` ASC) VISIBLE,
  PRIMARY KEY (`id_classe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_generation_game_online`.`tb_personagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_generation_game_online`.`tb_personagem` (
  `id_personagem` INT NOT NULL AUTO_INCREMENT,
  `nome_personagem` VARCHAR(50) NOT NULL,
  `clan_personagem` VARCHAR(50) NULL DEFAULT 'Personagem Sem Clan',
  `atk_personagem` INT(4) NOT NULL DEFAULT 500,
  `def_personagem` INT(4) NOT NULL DEFAULT 500,
  `id_classe_personagem` INT NOT NULL,
  PRIMARY KEY (`id_personagem`),
  UNIQUE INDEX `id_personagem_UNIQUE` (`id_personagem` ASC) VISIBLE,
  UNIQUE INDEX `nome_personagem_UNIQUE` (`nome_personagem` ASC) VISIBLE,
  INDEX `id_classe_idx` (`id_classe_personagem` ASC) VISIBLE,
  CONSTRAINT `id_classe`
    FOREIGN KEY (`id_classe_personagem`)
    REFERENCES `db_generation_game_online`.`tb_classes` (`id_classe`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- INSERINDO VALORES PARA A TB_CLASSES

INSERT INTO tb_classes(nome_classe,nome_subclasse) VALUES
("Mago","Feiticeiro"),
("Mago", "Druida"),
("Guerreiro", "Paladino"),
("Guerreiro", "Bárbaro"),
("Mercenário", "Ladrão");

-- INSERINDO VALORES PARA TB_PERSONAGEM

INSERT INTO tb_personagem(nome_personagem,atk_personagem,def_personagem,id_classe_personagem) VALUES
("MonsterKill",5000,2000,4),
("Ntrz", 3000,2000 , 2),
("DefTop", 4000,6000 , 3),
("MeGaThIeF", 3500,1500 , 5),
("Ntrz2",800 , 1000, 1);

-- selecionando personagens com atk maior que 2000

SELECT * FROM tb_personagem WHERE atk_personagem > 2000;

-- selecionando personagens com def entre 1000 e 2000

SELECT * FROM tb_personagem WHERE def_personagem <= 2000 AND def_personagem >= 1000;

-- selecionando personagens com a letra C 

SELECT * FROM tb_personagem WHERE nome_personagem LIKE "%c%";

-- select com inner join

SELECT * FROM tb_personagem 
	INNER JOIN tb_classes ON tb_classes.id_classe = tb_personagem.id_classe_personagem
	WHERE nome_classe = "Mago";
    