

-- MySQL Script generated by MySQL Workbench
-- Fri Mar 12 14:33:35 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_farmacia_do_bem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_farmacia_do_bem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_farmacia_do_bem` DEFAULT CHARACTER SET utf8 ;
USE `db_farmacia_do_bem` ;

-- -----------------------------------------------------
-- Table `db_farmacia_do_bem`.`tb_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_farmacia_do_bem`.`tb_categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `fabricante` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE INDEX `id_categoria_UNIQUE` (`id_categoria` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_farmacia_do_bem`.`tb_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_farmacia_do_bem`.`tb_produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `quantidade_mg` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(4,2) NOT NULL,
  `id_cat` INT NOT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE INDEX `id_produto_UNIQUE` (`id_produto` ASC) VISIBLE,
  INDEX `id_cat_idx` (`id_cat` ASC) VISIBLE,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_cat`)
    REFERENCES `db_farmacia_do_bem`.`tb_categoria` (`id_categoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO tb_categoria(fabricante, tipo) VALUES
("Pfizer","Anti-inflamatório"),
("AstraZeneca","Analgésico"),
("Novartis","Analgésico");

INSERT INTO tb_produto(nome, quantidade_mg, preco, id_cat) VALUES
("Remedieras", "500mg", 25.90, 1),
("Remediolas","250mg", 32.50, 3),
("Remetchuvaras" , "1g", 42.50, 2),
("Remivaras","700mg", 20.50, 1);

-- selects

SELECT * FROM tb_produto WHERE preco > 50;
SELECT * FROM tb_produto WHERE preco >=3 AND preco<=60;
SELECT * FROM tb_produto WHERE nome LIKE "%B%";

-- inner join

SELECT * FROM tb_produto 
INNER JOIN tb_categoria ON tb_produto.id_cat = tb_categoria.id_categoria
WHERE tb_categoria.fabricante = "Pfizer";

