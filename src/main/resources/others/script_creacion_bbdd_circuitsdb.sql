SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `circuitsdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
ALTER DATABASE `circuitsdb` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `circuitsdb` ;



-- -----------------------------------------------------------------------
-- Table `circuitsdb`.`authorities`  => Tabla de roles de los usuarios
-- Relacion de uno a varios con users
-- -----------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`authorities`;
CREATE TABLE `authorities` (
    `nid` INT NOT NULL AUTO_INCREMENT,
    `authority` VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (`nid`)
) ENGINE = InnoDB;


-- ------------------------------------------------------------------
-- Table `circuitsdb`.`Users` => Administradores y resp. de equipo
-- Relacion de varios a uno con authorities
-- ------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`users`;
CREATE TABLE `users` (
	`nid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`username` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL,
	`password` varchar(50) NOT NULL,
	`valid` BOOLEAN DEFAULT FALSE,
	`nid_auth` INT,
	FOREIGN KEY (nid_auth) REFERENCES authorities (nid)
) ENGINE = InnoDB;



-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`equipo`
-- Relaciones:
-- 1) 1 equipo varios pilotos
-- 2) 1 equipo varios coches
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`equipo`;
CREATE TABLE `equipo` (
	`nid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`nombre` varchar(50) NOT NULL,
	`logo_imagen` varchar(255),
	`twitter` varchar(100),
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


-- ---------------------------------------------------------------------------------------------------------------
-- Table `circuitsdb`.`piloto`.
-- Relaciones:
-- 1) varios pilotos 1 Equipo
-- ---------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`piloto`;
CREATE TABLE `piloto` (
	`nid` INT NOT NULL auto_increment PRIMARY KEY,
	`nombre` varchar(50) NOT NULL,
	`apellidos` varchar(50) NOT NULL,
	`siglas` varchar(3),
	`dorsal` INT,
	`imagen` varchar(255),
	`pais` varchar(50) NOT NULL,
	`twitter` varchar(100),
	`nid_team` INT,
	FOREIGN KEY (nid_team) REFERENCES equipo (nid)
) ENGINE = InnoDB;


DROP TABLE IF EXISTS `circuitsdb`.`votacion`;
CREATE TABLE `votacion` (
	`nid` INT NOT NULL auto_increment PRIMARY KEY,
	`titulo` varchar(50) NOT NULL,
	`descripcion` text,
    `fecha_limite` DATE NOT NULL
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------------------------------------------------
-- Table `circuitsdb`.`piloto_has_votacion`. Tabla de relacion entre piloto y votacion (many to many).
-- ---------------------------------------------------------------------------------------------------------------


-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`noticias`.
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`noticias`;
CREATE TABLE `noticias` (
	`nid` INT NOT NULL auto_increment PRIMARY KEY,
	`titulo` varchar(150) NOT NULL,
	`imagen` varchar(255),
	`texto` text CHARACTER SET utf8 COLLATE utf8_general_ci,
    `fecha` DATE NOT NULL
) ENGINE = InnoDB;

-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`calendar`.
-- Relacion uno a uno con circuito, el administrador introduce fecha y selecciona el circuito
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`calendar`;
CREATE TABLE `calendar` (
	`nid` INT NOT NULL auto_increment PRIMARY KEY,
	`fecha` DATE NOT NULL,
	`nombre` varchar(50) NOT NULL,
	`ubicacion` varchar(50) NOT NULL,
	`estado` varchar(50) NOT NULL
) ENGINE = InnoDB;

-- -------------------------------------------------------------------------------------
-- Table `circuitsdb`.`circuitos`.
-- -------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `circuitsdb`.`circuitos`;
CREATE TABLE `circuitos` (
	`nid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`nombre` varchar(50) NOT NULL,
	`ciudad` varchar(50) NOT NULL,
	`pais` varchar(50) NOT NULL,
	`trazado_imagen` varchar(255),
	`longitud` INT NOT NULL,
	`curvas_lentas` INT NOT NULL,
	`curvas_medias` INT NOT NULL,
	`curvas_rapidas` INT NOT NULL,
	`calendar` BOOLEAN DEFAULT TRUE
) ENGINE = InnoDB;




INSERT INTO circuitsdb.authorities (authority) VALUES ('ROLE_ADMIN');
INSERT INTO circuitsdb.authorities (authority) VALUES ('ROLE_RESPON');

INSERT INTO `circuitsdb`.`users` (username, email, password, valid, nid_auth) VALUES ('Admin', 'admin@gmail.com', '12345', TRUE, 1);
INSERT INTO `circuitsdb`.`users` (username, email, password, valid, nid_auth) VALUES ('Team', 'team@gmail.com', '12345', TRUE, 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
