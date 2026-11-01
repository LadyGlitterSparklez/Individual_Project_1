-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Boardgame_Cafe.db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Boardgame_Cafe.db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Boardgame_Cafe.db` DEFAULT CHARACTER SET utf8 ;
USE `Boardgame_Cafe.db` ;

-- -----------------------------------------------------
-- Table `Boardgame_Cafe.db`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Boardgame_Cafe.db`.`Menu` (
  `item_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(75) NOT NULL,
  `price` DECIMAL(7,2) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `is_available` TINYINT NOT NULL,
  `category` VARCHAR(62) NOT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Boardgame_Cafe.db`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Boardgame_Cafe.db`.`Customers` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(75) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `phone_number` VARCHAR(25) NOT NULL,
  `member_tier` VARCHAR(25) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Boardgame_Cafe.db`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Boardgame_Cafe.db`.`Employees` (
  `employee_id` INT NOT NULL,
  `position` VARCHAR(50) NOT NULL,
  `pay_per_hour` DECIMAL(6,2) NOT NULL,
  `name` VARCHAR(75) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `address` VARCHAR(150) NOT NULL,
  `hiredate` DATETIME NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Boardgame_Cafe.db`.`Boardgames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Boardgame_Cafe.db`.`Boardgames` (
  `boardgame_id` INT NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  `retail_price` DECIMAL(10,2) NOT NULL,
  `genre` VARCHAR(35) NOT NULL,
  `min_player_count` INT NOT NULL,
  `backup_copies_qty` INT NOT NULL,
  `max_player_count` INT NOT NULL,
  `playtime_mins` INT NULL,
  PRIMARY KEY (`boardgame_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Boardgame_Cafe.db`.`Reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Boardgame_Cafe.db`.`Reservations` (
  `reservation_id` INT NOT NULL,
  `reservation_type` VARCHAR(50) NOT NULL,
  `approved_by` INT NOT NULL,
  `reserved_by` INT NOT NULL,
  `datetime_reserved` DATETIME NOT NULL,
  `party_size` INT NOT NULL,
  `base_rate` DECIMAL(7,2) NOT NULL,
  `boardgame_reserved` INT NULL,
  PRIMARY KEY (`reservation_id`),
  INDEX `reserved_by_idx` (`reserved_by` ASC) VISIBLE,
  INDEX `approved_by_idx` (`approved_by` ASC) VISIBLE,
  INDEX `boardgame_reserved_idx` (`boardgame_reserved` ASC) VISIBLE,
  CONSTRAINT `reserved_by`
    FOREIGN KEY (`reserved_by`)
    REFERENCES `Boardgame_Cafe.db`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `approved_by`
    FOREIGN KEY (`approved_by`)
    REFERENCES `Boardgame_Cafe.db`.`Employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `boardgame_reserved`
    FOREIGN KEY (`boardgame_reserved`)
    REFERENCES `Boardgame_Cafe.db`.`Boardgames` (`boardgame_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
