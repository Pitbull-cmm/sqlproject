-- Create database products_management
DROP DATABASE IF EXISTS `products_management`;

CREATE DATABASE `products_management` CHARACTER
SET
    utf8mb4 COLLATE utf8mb4_unicode_ci;
    
USE products_management

SELECT * FROM products

-- Create table brands
DROP TABLE IF EXISTS `brands`;

CREATE TABLE brands (
    `id` INT PRIMARY KEY,
    `slug` VARCHAR(191) NOT NULL,
    `is_active` TINYINT(1),
    `createc_at` TIMESTAMP,
    `updated_at` TIMESTAMP
)AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;

-- create table categories

CREATE TABLE categories (
	`id` INT PRIMARY KEY,
	`parent_id` INT NOT NULL,
	`slug` VARCHAR(191) NOT null,
	`position` INT,
	`is_searchable` TINYINT(1),
	`is_active` TINYINT(1),
   `createc_at` TIMESTAMP,
   `updated_at` TIMESTAMP
)AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;

-- create table options

CREATE TABLE `options` (
	`id` INT PRIMARY KEY,
	`type` VARCHAR(191),
	`is_required` TINYINT(1),
	`is_global` TINYINT(1),
	`position` INT,
	`deleted_at` TIMESTAMP,
	`createc_at` TIMESTAMP,
   `updated_at` TIMESTAMP
)AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;

-- create option_values

CREATE TABLE `option_values` (
	`id` INT PRIMARY KEY,
	`option_id` INT NOT NULL,
	`price` DECIMAL(18,4),
	`price_type` VARCHAR(10),
	`position` INT,
	`created_at` TIMESTAMP,
   `updated_at` TIMESTAMP,
   CONSTRAINT FK_option_id FOREIGN KEY (`option_id`) REFERENCES options (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
)AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;

-- create table variations

CREATE TABLE `variations` (
	`id` INT PRIMARY KEY,
	`uid` VARCHAR(191) NOT NULL,
	`type` VARCHAR(191),
	`is_global` TINYINT(1),
	`position` INT,
	`deleted_at` TIMESTAMP,
	`created_at` TIMESTAMP,
	`updated_at` TIMESTAMP,
)AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;

-- create table variation_values

CREATE TABLE `variation_values` (
	`id` INT PRIMARY KEY,
	`variation_id` INT NOT NULL,
	`uid` VARCHAR(191),
	`value` VARCHAR(191),
	`position` INT,
	`createc_at` TIMESTAMP,
   `updated_at` TIMESTAMP,
   CONSTRAINT FK_variation_id FOREIGN KEY (`variation_id`) REFERENCES variations (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
)AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;

-- create table products

CREATE TABLE `products` (
	`id` INT PRIMARY KEY,
	`brand_id` INT NOT NULL,
	`tax_class_id` INT,
	`slug` VARCHAR(191),
	`price` DECIMAL(18,4),
	`special_price` DECIMAL(18,4),
	`special_price_type` VARCHAR(191),
	`special_price_start` DATE,
	`special_price_end` DATE,
	`selling_price` DECIMAL(18,4),
	`sku` VARCHAR(191),
	`manage_stock` TINYINT(1),
	`qty` INT,
	`in_stock` TINYINT(1),
	`viewed` INT,
	`is_active` TINYINT(1),
	`new_from` DATETIME,
	`new_to` DATETIME,
	`position` INT,
	`deleted_at` TIMESTAMP,
	`createc_at` TIMESTAMP,
   `updated_at` TIMESTAMP,
    CONSTRAINT FK_brand_id FOREIGN KEY (`brand_id`) REFERENCES brands (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
)AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;

-- create table product_variants

CREATE TABLE `product_variants` (
	`id` INT PRIMARY KEY,
	`uid` VARCHAR(191),
	`uids` TEXT,
	`product_id` INT NOT NULL,
	`name` VARCHAR(191),
	`price` DECIMAL(18,4),
	`special_price` DECIMAL(18,4),
	`special_price_type` VARCHAR(191),
	`special_price_start` DATE,
	`special_price_end` DATE,
	`selling_price` DECIMAL(18,4),
	`sku` VARCHAR(191),
	`manage_stock` TINYINT(1),
	`qty` INT,
	`in_stock` TINYINT(1),
	`is-default` TINYINT(1),
	`is_active` TINYINT(1),
	`position` INT,
	`deleted_at` TIMESTAMP,
	`createc_at` TIMESTAMP,
   `updated_at` TIMESTAMP,
    CONSTRAINT FK_product_id FOREIGN KEY (`product_id`) REFERENCES products (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
)AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;
	`

-- create table `product_variations`

CREATE TABLE `product_variations` (
	`product_id` INT NOT NULL,
	`variation_id` INT NOT NULL,
	CONSTRAINT PK_product_variations_variation_id_product_id PRIMARY KEY (`product_id`, `variation_id`),
	CONSTRAINT FK_variation_id FOREIGN KEY (`variation_id`) REFERENCES options (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT FK_product_id FOREIGN KEY (`product_id`) REFERENCES products (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;

	
	
-- create table product_categories

CREATE TABLE product_categories (
	`category_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	CONSTRAINT PK_product_categories_category_id_product_id PRIMARY KEY (`order_id`, `product_id`),
	CONSTRAINT FK_category_id FOREIGN KEY (`category_id`) REFERENCES categories (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT FK_product_id FOREIGN KEY (`product_id`) REFERENCES products (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;

-- create table product_options

CREATE TABLE product_options (
	`product_id` INT NOT NULL,
	`option_id` INT NOT NULL,
	CONSTRAINT PK_product_options_option_id_product_id PRIMARY KEY (`product_id`, `option_id`),
	CONSTRAINT FK_option_id FOREIGN KEY (`option_id`) REFERENCES options (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT FK_product_id FOREIGN KEY (`product_id`) REFERENCES products (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = UTF8MB4_UNICODE_CI;
