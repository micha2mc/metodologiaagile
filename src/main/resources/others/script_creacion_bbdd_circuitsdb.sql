SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `circuitsdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `circuitsdb` ;
-- ------------------------------------------------------------------
-- Table `circuitsdb`.`Users` => Administradores y resp. de equipo
-- ------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`users`;
CREATE TABLE `users` (
	`nid` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL,
	`password` varchar(50) NOT NULL,
	PRIMARY KEY (`nid`),
	UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE
) ENGINE = InnoDB;

-- -----------------------------------------------------------------------
-- Table `circuitsdb`.`authorities`  => Tabla de roles de los usuarios
-- -----------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`authorities`;
CREATE TABLE `authorities` (
    `nid` INT NOT NULL AUTO_INCREMENT,
    `authority` VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (`nid`)
) ENGINE = InnoDB;

-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`Users_has_Authorities` Tabla relacion entre usuarios y los roles
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`users_has_authorities`;
CREATE TABLE `users_has_authorities` (
	`id_user_fk` INT NOT NULL,
	`id_authorities_fk` INT NOT NULL,
	PRIMARY KEY (`id_user_fk`,`id_authorities_fk`),
    INDEX `fk_users_has_authorities_authorities1_idx` (`id_authorities_fk` ASC) VISIBLE,
    INDEX `fk_users_has_authorities_users1_idx` (`id_user_fk` ASC) VISIBLE
) ENGINE = InnoDB;

-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`equipo` 
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`equipo`;
CREATE TABLE `equipo` (
	`nid` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(50) NOT NULL,
	`logo_imagen` varchar(255),
	`twitter` varchar(100),
	PRIMARY KEY (`nid`)
) ENGINE = InnoDB;

-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`coche` 
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`coche`;
CREATE TABLE `coche` (
	`nid` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(50) NOT NULL,
	`codigo` varchar(10),
	`ers_curvas_lentas` INT,
	`ers_curvas_medias` INT,
	`ers_curvas_rapidas` INT,
	`consumo` INT,
	PRIMARY KEY (`nid`)
) ENGINE = InnoDB;

-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`equipo_has_coche` Tabla relacion entre equipo y coche
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`equipo_has_coche`;
CREATE TABLE `equipo_has_coche` (
	`id_equipo_fk` INT NOT NULL,
	`id_coche_fk` INT NOT NULL,
	PRIMARY KEY (`id_equipo_fk`,`id_coche_fk`),
    INDEX `fk_equipo_has_coche_coche1_idx` (`id_coche_fk` ASC) VISIBLE,
    INDEX `fk_equipo_has_coche_equipo1_idx` (`id_equipo_fk` ASC) VISIBLE
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------------------------------------------------
-- Table `circuitsdb`.`piloto`. Está relacionada con equipo de uno a varios. Un equipo puede tener varios pilotos
-- ---------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`piloto`;
CREATE TABLE `piloto` (
	`nid` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(50) NOT NULL,
	`apellidos` varchar(50) NOT NULL,
	`siglas` varchar(3),
	`dorsal` INT,
	`imagen` varchar(255),
	`pais` varchar(50) NOT NULL,
	`twitter` varchar(100),
	`id_equipo` INT NOT NULL,
	PRIMARY KEY (`nid`, `id_equipo`),
	INDEX `fk_piloto_equipo_idx` (`id_equipo` ASC) VISIBLE
) ENGINE = InnoDB;


DROP TABLE IF EXISTS `circuitsdb`.`votacion`;
CREATE TABLE `votacion` (
	`nid` INT NOT NULL AUTO_INCREMENT,
	`titulo` varchar(50) NOT NULL,
	`descripcion` text,
    `fecha_limite` DATE NOT NULL,
	PRIMARY KEY (`nid`)
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------------------------------------------------
-- Table `circuitsdb`.`piloto_has_votacion`. Tabla de relacion entre piloto y votacion (many to many). 
-- ---------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`piloto_has_votacion`;
CREATE TABLE `piloto_has_votacion` (
	`id_piloto_fk` INT NOT NULL,
	`id_votacion_fk` INT NOT NULL,
	PRIMARY KEY (`id_piloto_fk`,`id_votacion_fk`),
    INDEX `fk_piloto_has_votacion_votacion1_idx` (`id_votacion_fk` ASC) VISIBLE,
    INDEX `fk_piloto_has_votacion_piloto1_idx` (`id_piloto_fk` ASC) VISIBLE
) ENGINE = InnoDB;

-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`noticias`.
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`noticias`;
CREATE TABLE `noticias` (
	`nid` INT NOT NULL AUTO_INCREMENT,
	`titulo` varchar(50) NOT NULL,
	`imagen` varchar(255),
	`texto` text,
    `fecha` DATE NOT NULL,
	PRIMARY KEY (`nid`)
) ENGINE = InnoDB;

-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`circuitos`.
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`circuitos`;
CREATE TABLE `circuitos` (
	`nid` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(50) NOT NULL,
	`ciudad` varchar(50) NOT NULL,
	`pais` varchar(50) NOT NULL,
	`trazado_imagen` varchar(255),
	`longitud` INT NOT NULL,
	`curvas_lentas` INT NOT NULL,
	`curvas_medias` INT NOT NULL,
	`curvas_rapidas` INT NOT NULL,
	PRIMARY KEY (`nid`)
) ENGINE = InnoDB;

ALTER TABLE `users_has_authorities` ADD CONSTRAINT `users_authorities_fk0` FOREIGN KEY (`id_user_fk`) REFERENCES `users`(`nid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `users_has_authorities` ADD CONSTRAINT `users_authorities_fk1` FOREIGN KEY (`id_authorities_fk`) REFERENCES `authorities`(`nid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `equipo_has_coche` ADD CONSTRAINT `equipo_has_coche_fk0` FOREIGN KEY (`id_equipo_fk`) REFERENCES `equipo`(`nid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `equipo_has_coche` ADD CONSTRAINT `equipo_has_coche_fk1` FOREIGN KEY (`id_coche_fk`) REFERENCES `coche`(`nid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `piloto` ADD CONSTRAINT `piloto_equipo_fk0` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`nid`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `piloto_has_votacion` ADD CONSTRAINT `piloto_has_votacion_fk0` FOREIGN KEY (`id_piloto_fk`) REFERENCES `piloto`(`nid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `piloto_has_votacion` ADD CONSTRAINT `piloto_has_votacion_fk1` FOREIGN KEY (`id_votacion_fk`) REFERENCES `votacion`(`nid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

INSERT INTO circuitsdb.authorities (authority) VALUES ('ROLE_ADMIN');
INSERT INTO circuitsdb.authorities (authority) VALUES ('ROLE_RESPON');

INSERT INTO `circuitsdb`.`users` (username, email, password) VALUES ('Admin', 'admin@gmail.com', '12345');
INSERT INTO `circuitsdb`.`users_has_authorities` VALUES (1, 1);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;







