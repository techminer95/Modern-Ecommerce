-- MySQL Script generated by MySQL Workbench
-- 09/07/16 09:57:37
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema modern_ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema modern_ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `modern_ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `modern_ecommerce` ;

-- -----------------------------------------------------
-- Table `modern_ecommerce`.`companies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`companies` (
  `company_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `status` INT(11) NOT NULL,
  `create_date` DATETIME NOT NULL,
  PRIMARY KEY (`company_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`roles` (
  `role_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `description` VARCHAR(255) CHARACTER SET 'utf8' NULL,
  PRIMARY KEY (`role_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`users` (
  `user_id` VARCHAR(32) NOT NULL,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `role_id` INT(10) UNSIGNED NOT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `password_hash` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `middle_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `status` INT(11) NOT NULL,
  `create_date` DATETIME NOT NULL,
  `salt` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`address` (
  `adress_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(32) NOT NULL,
  `adress` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `phone` TEXT CHARACTER SET 'utf8' NOT NULL,
  `fax` TEXT CHARACTER SET 'utf8' NOT NULL,
  `city` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `country` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`adress_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`theme` (
  `theme_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `version` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `thumbnail` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `source_path` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`theme_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`app`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`app` (
  `theme_id` INT(10) UNSIGNED NOT NULL,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `app_domain` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`theme_id`, `company_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`product_attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`product_attributes` (
  `attribute_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`attribute_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`categories` (
  `category_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `parent_id` INT(10) UNSIGNED NULL,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `status` INT(11) NOT NULL,
  `description` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`history` (
  `history_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `type` INT(11) NOT NULL,
  `create_date` DATETIME NOT NULL,
  `value` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`history_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`orders` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(32) NOT NULL,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  `is_active` SMALLINT(5) UNSIGNED NULL DEFAULT '1',
  `is_virtual` SMALLINT(5) UNSIGNED NULL DEFAULT '0',
  `is_multi_shipping` SMALLINT(5) UNSIGNED NULL DEFAULT '1',
  `status` INT(11) NOT NULL,
  `items_count` INT(10) UNSIGNED NULL DEFAULT '0',
  `items_quantity` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `grand_total` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `base_grand_total` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `checkout_comment` VARCHAR(255) NULL DEFAULT NULL,
  `customer_email` VARCHAR(255) NULL DEFAULT NULL,
  `customer_prefix` VARCHAR(40) NULL DEFAULT NULL,
  `customer_firstname` VARCHAR(255) NULL DEFAULT NULL,
  `customer_middlename` VARCHAR(40) NULL DEFAULT NULL,
  `customer_lastname` VARCHAR(255) NULL DEFAULT NULL,
  `customer_suffix` VARCHAR(40) NULL DEFAULT NULL,
  `customer_dob` DATETIME NULL DEFAULT NULL,
  `customer_is_guest` SMALLINT(5) UNSIGNED NULL DEFAULT '0',
  `remote_ip` VARCHAR(32) NULL DEFAULT NULL,
  `customer_gender` VARCHAR(255) NULL DEFAULT NULL,
  `subtotal` DECIMAL(12,4) NULL DEFAULT NULL,
  `base_subtotal` DECIMAL(12,4) NULL DEFAULT NULL,
  `is_changed` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`order_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`order_address` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT(10) UNSIGNED NOT NULL,
  `adress_id` INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  `region_id` INT(11) NULL DEFAULT NULL,
  `region` VARCHAR(255) NULL DEFAULT NULL,
  `postcode` VARCHAR(255) NULL DEFAULT NULL,
  `prefix` VARCHAR(255) NULL DEFAULT NULL,
  `suffix` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`products` (
  `product_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `browsing_name` VARCHAR(255) NOT NULL,
  `sale_price` DOUBLE NOT NULL,
  `list_price` DOUBLE NOT NULL,
  `default_image` VARCHAR(255) NOT NULL,
  `overview` VARCHAR(255) NOT NULL,
  `quantity` INT(10) UNSIGNED NOT NULL,
  `is_stock_controlled` TINYINT(1) NULL,
  `status` INT(11) NOT NULL,
  `description` VARCHAR(255) NULL,
  `rank` INT(11) NOT NULL,
  `sku` VARCHAR(100) NOT NULL,
  `created_on` DATETIME NOT NULL,
  `updated_on` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`order_detail` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `order_id` INT(10) UNSIGNED NOT NULL,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  `is_virtual` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `sku` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `free_shipping` SMALLINT(5) UNSIGNED NULL DEFAULT '0',
  `weight` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `quantity` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `price` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `base_price` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `row_total` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `base_row_total` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `row_weight` DECIMAL(12,4) NULL DEFAULT '0.0000',
  `product_type` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`payments` (
  `payment_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `desc` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`order_payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`order_payments` (
  `order_id` INT(10) UNSIGNED NOT NULL,
  `payment_id` INT(10) UNSIGNED NOT NULL,
  `transaction_id` VARCHAR(255) NOT NULL,
  `status` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`, `payment_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`order_reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`order_reports` (
  `report_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT(10) UNSIGNED NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `note` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`report_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`product_attribute_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`product_attribute_details` (
  `product_id` INT(10) UNSIGNED NOT NULL,
  `attribute_id` INT(10) UNSIGNED NOT NULL,
  `value_string` VARCHAR(255) NULL,
  `value_numberic` DOUBLE NULL,
  PRIMARY KEY (`product_id`, `attribute_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`reviews` (
  `review_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(32) NOT NULL,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `rank` INT(10) NOT NULL,
  `comment` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`review_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`suppliers` (
  `supplier_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `status` INT(11) NOT NULL,
  `create_date` DATETIME NOT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`supplier_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`supplier_products` (
  `product_id` INT(10) UNSIGNED NOT NULL,
  `supplier_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `supplier_id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`user_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`user_tokens` (
  `token` VARCHAR(32) NOT NULL,
  `company_id` INT(10) UNSIGNED NOT NULL,
  `user_id` VARCHAR(32) NOT NULL,
  `login_date` DATETIME NOT NULL,
  `expiration_date` DATETIME NOT NULL,
  PRIMARY KEY (`token`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `modern_ecommerce`.`product_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modern_ecommerce`.`product_categories` (
  `product_id` INT(10) UNSIGNED NOT NULL,
  `category_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`))
ENGINE = MyISAM;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
