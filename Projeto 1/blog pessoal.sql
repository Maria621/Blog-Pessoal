------------------------------------------------
-- Schema tb_blog_pessoal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tb_blog_pessoal` DEFAULT CHARACTER SET utf8 ;
USE `tb_blog_pessoal` ;


-- -----------------------------------------------------
-- Table `tb_blog_pessoal`.`tb_temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_temas` (
  `id` BIGINT NOT NULL,
  `descricao` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tb_blog_pessoal`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_usuario` (
  `id` BIGINT NOT NULL,
  `nome` VARCHAR(225) NOT NULL,
  `usuario` VARCHAR(225) NOT NULL,
  `senha` VARCHAR(225) NOT NULL,
  `foto` VARCHAR(225) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tb_blog_pessoal`.`tb_postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_postagens` (
  `id` BIGINT NOT NULL,
  `titulo` VARCHAR(225) NOT NULL,
  `texto` VARCHAR(225) NOT NULL,
  `data` DATE NULL,
  `temas_id` BIGINT NULL,
  `usuario_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_postagens_tb_temas1_idx` (`temas_id` ASC) VISIBLE,
  INDEX `fk_tb_postagens_tb_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagens_tb_temas1`
    FOREIGN KEY (`temas_id`)
    REFERENCES `mydb`.`tb_temas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagens_tb_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
