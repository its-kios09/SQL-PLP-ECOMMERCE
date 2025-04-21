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