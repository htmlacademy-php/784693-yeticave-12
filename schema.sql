

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- -----------------------------------------------------

-- -----------------------------------------------------
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS yeti
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

USE yeti;
-- -----------------------------------------------------
-- Table `yeti`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yeti`.`user` (
                                             `id` INT NOT NULL AUTO_INCREMENT,
                                             `email` VARCHAR(45) NOT NULL,
                                             `password` CHAR(32) NOT NULL,
                                             `name` VARCHAR(45) NOT NULL,
                                             `contacts` TEXT NOT NULL,
                                             PRIMARY KEY (`id`),
                                             UNIQUE INDEX `email_UNIQUE` (`email` ASC),
                                             INDEX `idx_user_email_password` (`email` ASC, `password` ASC))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yeti`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yeti`.`category` (
                                                 `id` INT NOT NULL AUTO_INCREMENT,
                                                 `title` VARCHAR(255) NOT NULL,
                                                 PRIMARY KEY (`id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yeti`.`lot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yeti`.`lot` (
                                            `id` INT NOT NULL AUTO_INCREMENT,
                                            `user_id` INT NOT NULL,
                                            `start_bid` MEDIUMINT UNSIGNED NOT NULL,
                                            `end_date` DATE NOT NULL,
                                            `bit_step` MEDIUMINT UNSIGNED NOT NULL,
                                            `title` VARCHAR(255) NOT NULL,
                                            `category_id` INT NOT NULL,
                                            PRIMARY KEY (`id`),
                                            INDEX `idx_lot_user_id` (`user_id` ASC),
                                            INDEX `fk_lot_category1_idx` (`category_id` ASC) ,
                                            CONSTRAINT `fk_lot_user_id_user_id`
                                                FOREIGN KEY (`user_id`)
                                                    REFERENCES `yeti`.`user` (`id`)
                                                    ON DELETE CASCADE
                                                    ON UPDATE RESTRICT,
                                            CONSTRAINT `fk_lot_category_id_category_id`
                                                FOREIGN KEY (`category_id`)
                                                    REFERENCES `yeti`.`category` (`id`)
                                                    ON DELETE CASCADE
                                                    ON UPDATE RESTRICT)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yeti`.`lot_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yeti`.`lot_image` (
                                                  `id` INT NOT NULL AUTO_INCREMENT,
                                                  `path` VARCHAR(63) NOT NULL,
                                                  `lot_id` INT NOT NULL,
                                                  PRIMARY KEY (`id`),
                                                  INDEX `idx_lot_image_lot_id` (`lot_id` ASC),
                                                  CONSTRAINT `fk_lot_image_lot_id_lot_id`
                                                      FOREIGN KEY (`lot_id`)
                                                          REFERENCES `yeti`.`lot` (`id`)
                                                          ON DELETE CASCADE
                                                          ON UPDATE RESTRICT)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yeti`.`lot_bid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yeti`.`lot_bid` (
                                                `id` INT NOT NULL,
                                                `lot_bidcol` VARCHAR(45) NULL,
                                                `price` INT NOT NULL,
                                                `lot_id` INT NOT NULL,
                                                `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                `user_id` INT NOT NULL,
                                                PRIMARY KEY (`id`),
                                                INDEX `fk_lot_bid_lot1_idx` (`lot_id` ASC),
                                                INDEX `fk_lot_bid_user1_idx` (`user_id` ASC),
                                                CONSTRAINT `fk_lot_bid_lot1`
                                                    FOREIGN KEY (`lot_id`)
                                                        REFERENCES `yeti`.`lot` (`id`)
                                                        ON DELETE NO ACTION
                                                        ON UPDATE NO ACTION,
                                                CONSTRAINT `fk_lot_bid_user1`
                                                    FOREIGN KEY (`user_id`)
                                                        REFERENCES `yeti`.`user` (`id`)
                                                        ON DELETE NO ACTION
                                                        ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
