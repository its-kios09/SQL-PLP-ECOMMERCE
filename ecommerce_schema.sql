-- Database creation
DROP DATABASE IF EXISTS kenya_ecommerce;

CREATE DATABASE kenya_ecommerce;

USE kenya_ecommerce;

-- Brand table
CREATE TABLE
    brand (
        brand_id INT AUTO_INCREMENT PRIMARY KEY,
        brand_name VARCHAR(100) NOT NULL,
        brand_description TEXT,
        founded_year INT,
        headquarters VARCHAR(100),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT uc_brand_name UNIQUE (brand_name)
    );

-- Product category table
CREATE TABLE
    product_category (
        category_id INT AUTO_INCREMENT PRIMARY KEY,
        category_name VARCHAR(100) NOT NULL,
        parent_category_id INT NULL,
        description TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        FOREIGN KEY (parent_category_id) REFERENCES product_category (category_id) ON DELETE SET NULL
    );

-- Size category table
CREATE TABLE
    size_category (
        size_category_id INT AUTO_INCREMENT PRIMARY KEY,
        category_name VARCHAR(50) NOT NULL,
        description VARCHAR(255)
    );

-- Size option table
CREATE TABLE
    size_option (
        size_id INT AUTO_INCREMENT PRIMARY KEY,
        size_category_id INT NOT NULL,
        size_value VARCHAR(20) NOT NULL,
        description VARCHAR(100),
        FOREIGN KEY (size_category_id) REFERENCES size_category (size_category_id)
    );