-- This script inserts sample data into the database tables.
-- It assumes that the tables have already been created and are empty.
-- The script includes data for brands, categories, subcategories, size categories, size options,   
-- colors, attribute categories, attribute types, products, product images, product variations,
-- product attributes, and product items.
-- The data is structured to reflect a typical e-commerce scenario with various products and their attributes.

USE  kenya_ecommerce;

-- Insert brands
INSERT INTO
    brand (brand_name, description)
VALUES
    (
        'Nike',
        'American athletic footwear and apparel corporation'
    ),
    (
        'Apple',
        'American multinational technology company'
    ),
    (
        'Samsung',
        'South Korean multinational electronics company'
    ),
    (
        'Adidas',
        'German multinational corporation that designs and manufactures shoes'
    );

-- Insert categories
INSERT INTO
    product_category (category_name, description)
VALUES
    ('Electronics', 'Devices and gadgets'),
    ('Clothing', 'Apparel and fashion items'),
    ('Footwear', 'Shoes and boots');

-- Insert subcategories
INSERT INTO
    product_category (category_name, parent_category_id, description)
VALUES
    (
        'Smartphones',
        1,
        'Mobile phones with advanced features'
    ),
    ('Laptops', 1, 'Portable computers'),
    ('T-Shirts', 2, 'Casual short-sleeved shirts'),
    (
        'Running Shoes',
        3,
        'Footwear designed for running'
    );

-- Insert size categories
INSERT INTO
    size_category (category_name, description)
VALUES
    ('Clothing', 'Standard clothing sizes'),
    ('Shoes', 'Footwear sizes'),
    (
        'Electronics',
        'Size categories for electronic devices'
    );

-- Insert size options
INSERT INTO
    size_option (size_category_id, size_value, description)
VALUES
    (1, 'S', 'Small'),
    (1, 'M', 'Medium'),
    (1, 'L', 'Large'),
    (1, 'XL', 'Extra Large'),
    (2, '8', 'US Size 8'),
    (2, '9', 'US Size 9'),
    (2, '10', 'US Size 10'),
    (3, 'Standard', 'Standard size for electronics');

-- Insert colors
INSERT INTO
    color (color_name, hex_code, description)
VALUES
    ('Red', '#FF0000', 'Bright red'),
    ('Black', '#000000', 'Pure black'),
    ('White', '#FFFFFF', 'Pure white'),
    ('Blue', '#0000FF', 'Deep blue'),
    ('Space Gray', '#717378', 'Modern gray tone');

-- Insert attribute categories
INSERT INTO
    attribute_category (category_name, description)
VALUES
    (
        'Physical',
        'Physical characteristics of the product'
    ),
    ('Technical', 'Technical specifications'),
    ('Material', 'Material composition');

-- Insert attribute types
INSERT INTO
    attribute_type (type_name, description)
VALUES
    ('Text', 'Textual attribute'),
    ('Number', 'Numeric attribute'),
    ('Boolean', 'True/False attribute');

-- Insert products
INSERT INTO
    product (
        product_name,
        description,
        brand_id,
        category_id,
        base_price
    )
VALUES
    (
        'iPhone 13 Pro',
        'Latest Apple smartphone with A15 Bionic chip',
        2,
        4,
        999.00
    ),
    (
        'Air Max 90',
        'Classic Nike running shoes',
        1,
        7,
        120.00
    ),
    (
        'Galaxy S21',
        'Samsung flagship smartphone',
        3,
        4,
        799.99
    ),
    (
        'Ultraboost 21',
        'Adidas running shoes with Boost technology',
        4,
        7,
        180.00
    );

-- Insert product images
INSERT INTO
    product_image (
        product_id,
        image_url,
        alt_text,
        is_primary,
        display_order
    )
VALUES
    (
        1,
        'https://example.com/iphone13pro1.jpg',
        'iPhone 13 Pro front view',
        TRUE,
        1
    ),
    (
        1,
        'https://example.com/iphone13pro2.jpg',
        'iPhone 13 Pro side view',
        FALSE,
        2
    ),
    (
        2,
        'https://example.com/airmax901.jpg',
        'Nike Air Max 90 front view',
        TRUE,
        1
    ),
    (
        3,
        'https://example.com/galaxys211.jpg',
        'Samsung Galaxy S21 front view',
        TRUE,
        1
    ),
    (
        4,
        'https://example.com/ultraboost211.jpg',
        'Adidas Ultraboost 21 side view',
        TRUE,
        1
    );

-- Insert product variations
INSERT INTO
    product_variation (product_id, variation_name)
VALUES
    (1, 'Storage Capacity'),
    (2, 'Colorway'),
    (3, 'Storage Capacity'),
    (4, 'Colorway');

-- Insert product attributes
INSERT INTO
    product_attribute (
        product_id,
        attribute_category_id,
        attribute_type_id,
        attribute_name,
        attribute_value
    )
VALUES
    (1, 2, 2, 'Storage', '128'),
    (1, 2, 2, 'RAM', '6'),
    (1, 2, 1, 'Processor', 'A15 Bionic'),
    (2, 3, 1, 'Upper Material', 'Leather and Mesh'),
    (3, 2, 2, 'Storage', '256'),
    (4, 3, 1, 'Upper Material', 'Primeknit');

-- Insert product items (specific variations)
INSERT INTO
    product_item (
        product_id,
        sku,
        quantity_in_stock,
        price,
        color_id,
        size_id,
        variation_id,
        image_id
    )
VALUES
    (1, 'IP13P-128-BLK', 50, 999.00, 2, 8, 1, 1),
    (1, 'IP13P-256-BLK', 30, 1099.00, 2, 8, 1, 1),
    (2, 'AM90-WHT-RED', 100, 120.00, 3, 5, 2, 3),
    (3, 'GS21-256-GRY', 40, 799.99, 5, 8, 3, 4),
    (4, 'UB21-BLK', 75, 180.00, 2, 6, 4, 5);