-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Final
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Schema Final
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Final` ;
USE `Final` ;

-- -----------------------------------------------------
-- Table `Final`.`Store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Store` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `ZipCode` VARCHAR(10) NOT NULL,
  `Phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`User` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zipcode` VARCHAR(10) NOT NULL,
  `Reg_date` DATE NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`Card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Card` (
  `card_id` INT NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(45) NOT NULL,
  `Expiry_date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  `Origination_date` DATE NOT NULL,
  PRIMARY KEY (`card_id`),
  INDEX `User ID_idx` (`user_id` ASC),
  CONSTRAINT `User ID`
    FOREIGN KEY (`user_id`)
    REFERENCES `Final`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `card_id` INT NOT NULL,
  `Store_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `total_cost` DECIMAL NULL,
  PRIMARY KEY (`order_id`),
  INDEX `Store ID_idx` (`Store_id` ASC),
  INDEX `card_id_idx` (`card_id` ASC),
  CONSTRAINT `Store ID`
    FOREIGN KEY (`Store_id`)
    REFERENCES `Final`.`Store` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `card_id`
    FOREIGN KEY (`card_id`)
    REFERENCES `Final`.`Card` (`card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`Bin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Bin` (
  `bin_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `PostalCode` INT(10) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `ImageSensor_ID` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`bin_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`Transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Transaction` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `card_id2` INT NOT NULL,
  `bin_id` INT NOT NULL,
  `date_time` DATETIME NOT NULL,
  `materialtype` VARCHAR(45) NOT NULL,
  `weight` DECIMAL NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `card_id2_idx` (`card_id2` ASC),
  INDEX `bin_id_idx` (`bin_id` ASC),
  CONSTRAINT `card_id2`
    FOREIGN KEY (`card_id2`)
    REFERENCES `Final`.`Card` (`card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bin_id`
    FOREIGN KEY (`bin_id`)
    REFERENCES `Final`.`Bin` (`bin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`Disposal_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Disposal_material` (
  `ID` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `card_id4` INT NOT NULL,
  `plasticweight` DECIMAL NULL,
  `glassweight` DECIMAL NULL,
  `metalweight` DECIMAL NULL,
  `otherweight` DECIMAL NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `card_id4_idx` (`card_id4` ASC),
  CONSTRAINT `card_id4`
    FOREIGN KEY (`card_id4`)
    REFERENCES `Final`.`Card` (`card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`Purchase_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Purchase_material` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `plasticweight` DECIMAL NULL,
  `glassweight` DECIMAL NULL,
  `metalweight` DECIMAL NULL,
  `otherweight` DECIMAL NULL,
  PRIMARY KEY (`ID`),
  INDEX `order_id_idx` (`order_id` ASC),
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `Final`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`Score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Score` (
  `score_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `card_id3` INT NOT NULL,
  `Score` INT UNSIGNED NOT NULL,
  `date_generated` DATE NOT NULL,
  PRIMARY KEY (`score_id`),
  INDEX `card_id3_idx` (`card_id3` ASC),
  CONSTRAINT `card_id3`
    FOREIGN KEY (`card_id3`)
    REFERENCES `Final`.`Card` (`card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`Product_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Product_details` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(7,2) NOT NULL,
  `materialtype` VARCHAR(45) NOT NULL,
  `weight` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`Orders_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`Orders_Product` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Orders_Order_id` INT NOT NULL,
  `Product_details_product_id` INT NOT NULL,
  `Quantity` SMALLINT(5) NOT NULL,
  PRIMARY KEY (`ID`, `Orders_Order_id`, `Product_details_product_id`),
  INDEX `fk_Orders_has_Product details_Product details1_idx` (`Product_details_product_id` ASC),
  INDEX `fk_Orders_has_Product details_Orders1_idx` (`Orders_Order_id` ASC),
  CONSTRAINT `fk_Orders_has_Product details_Orders1`
    FOREIGN KEY (`Orders_Order_id`)
    REFERENCES `Final`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_has_Product details_Product details1`
    FOREIGN KEY (`Product_details_product_id`)
    REFERENCES `Final`.`Product_details` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Final`.`User_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Final`.`User_log` (
  `ID` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(100) NOT NULL,
  `message` VARCHAR(100) NOT NULL,
  `time` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
