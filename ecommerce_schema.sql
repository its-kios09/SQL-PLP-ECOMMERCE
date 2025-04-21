-- Database creation
DROP DATABASE IF EXISTS kenya_ecommerce;

CREATE DATABASE kenya_ecommerce;

USE kenya_ecommerce;

-- Brand table
CREATE TABLE
    brand (
        brand_id INT AUTO_INCREMENT PRIMARY KEY,
        brand_name VARCHAR(100) NOT NULL,
        description TEXT, -- Renamed to description for consistency
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

-- Color table
CREATE TABLE
    color (
        color_id INT AUTO_INCREMENT PRIMARY KEY,
        color_name VARCHAR(50) NOT NULL,
        hex_code VARCHAR(7),
        description VARCHAR(100)
    );

-- Attribute category table
CREATE TABLE
    attribute_category (
        attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
        category_name VARCHAR(100) NOT NULL,
        description TEXT
    );

-- Attribute type table
CREATE TABLE
    attribute_type (
        attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
        type_name VARCHAR(50) NOT NULL,
        description VARCHAR(255)
    );

-- Product table
CREATE TABLE
    product (
        product_id INT AUTO_INCREMENT PRIMARY KEY,
        product_name VARCHAR(255) NOT NULL,
        description TEXT,
        brand_id INT,
        category_id INT,
        base_price DECIMAL(10, 2) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        FOREIGN KEY (brand_id) REFERENCES brand (brand_id) ON DELETE SET NULL,
        FOREIGN KEY (category_id) REFERENCES product_category (category_id) ON DELETE SET NULL
    );

-- Product image table
CREATE TABLE
    product_image (
        image_id INT AUTO_INCREMENT PRIMARY KEY,
        product_id INT NOT NULL,
        image_url VARCHAR(255) NOT NULL,
        alt_text VARCHAR(255),
        is_primary BOOLEAN DEFAULT FALSE,
        display_order INT DEFAULT 0,
        FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE
    );

-- Product variation table
CREATE TABLE
    product_variation (
        variation_id INT AUTO_INCREMENT PRIMARY KEY,
        product_id INT NOT NULL,
        variation_name VARCHAR(100) NOT NULL,
        FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE
    );

-- Product attribute table
CREATE TABLE
    product_attribute (
        attribute_id INT AUTO_INCREMENT PRIMARY KEY,
        product_id INT NOT NULL,
        attribute_category_id INT,
        attribute_type_id INT NOT NULL,
        attribute_name VARCHAR(100) NOT NULL,
        attribute_value TEXT,
        FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE,
        FOREIGN KEY (attribute_category_id) REFERENCES attribute_category (attribute_category_id),
        FOREIGN KEY (attribute_type_id) REFERENCES attribute_type (attribute_type_id)
    );

-- Product item table (specific variations of products)
CREATE TABLE
    product_item (
        item_id INT AUTO_INCREMENT PRIMARY KEY,
        product_id INT NOT NULL,
        sku VARCHAR(50) UNIQUE NOT NULL,
        quantity_in_stock INT NOT NULL DEFAULT 0,
        price DECIMAL(10, 2) NOT NULL,
        color_id INT,
        size_id INT,
        variation_id INT,
        image_id INT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE,
        FOREIGN KEY (color_id) REFERENCES color (color_id) ON DELETE SET NULL,
        FOREIGN KEY (size_id) REFERENCES size_option (size_id) ON DELETE SET NULL,
        FOREIGN KEY (variation_id) REFERENCES product_variation (variation_id) ON DELETE SET NULL,
        FOREIGN KEY (image_id) REFERENCES product_image (image_id) ON DELETE SET NULL
    );