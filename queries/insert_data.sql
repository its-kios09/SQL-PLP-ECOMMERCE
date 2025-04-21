-- This script inserts sample data into the database tables.
-- It assumes that the tables have already been created and are empty.
-- The script includes data for brands, categories, subcategories, size categories, size options,   
-- colors, attribute categories, attribute types, products, product images, product variations,
-- product attributes, and product items.
-- The data is structured to reflect a typical e-commerce scenario with various products and their attributes.

USE  kenya_ecommerce;

-- Insert sample brands
INSERT INTO brand (brand_name, description, founded_year, headquarters) VALUES
('Safaricom', 'Kenyan mobile network operator', 2000, 'Nairobi, Kenya'),
('Bata', 'Footwear and fashion accessories retailer', 1894, 'Nairobi, Kenya'),
('Tusker', 'Kenyan beer brand', 1922, 'Nairobi, Kenya'),
('Jumia', 'E-commerce platform', 2012, 'Nairobi, Kenya');

-- Insert sample product categories
INSERT INTO product_category (category_name, description) VALUES
('Electronics', 'Devices and gadgets'),
('Clothing', 'Apparel and fashion items'),
('Footwear', 'Shoes and boots'),
('Beverages', 'Drinks and beverages');

-- Insert sample subcategories
INSERT INTO product_category (category_name, parent_category_id, description) VALUES
('Smartphones', 1, 'Mobile phones with advanced features'),
('Laptops', 1, 'Portable computers'),
('T-Shirts', 2, 'Casual short-sleeved shirts'),
('Running Shoes', 3, 'Footwear designed for running'),
('Beers', 4, 'Alcoholic beverages');

-- Insert sample size categories
INSERT INTO size_category (category_name, description) VALUES
('Clothing', 'Standard clothing sizes'),
('Shoes', 'Footwear sizes'),
('Electronics', 'Size categories for electronic devices');

-- Insert sample size options
INSERT INTO size_option (size_category_id, size_value, description) VALUES
(1, 'S', 'Small'),
(1, 'M', 'Medium'),
(1, 'L', 'Large'),
(1, 'XL', 'Extra Large'),
(2, '38', 'EU Size 38'),
(2, '39', 'EU Size 39'),
(2, '40', 'EU Size 40'),
(3, 'Standard', 'Standard size for electronics');

-- Insert sample colors
INSERT INTO color (color_name, hex_code, description) VALUES
('Red', '#FF0000', 'Bright red'),
('Black', '#000000', 'Pure black'),
('White', '#FFFFFF', 'Pure white'),
('Blue', '#0000FF', 'Deep blue'),
('Green', '#008000', 'Forest green');

-- Insert sample attribute categories
INSERT INTO attribute_category (category_name, description) VALUES
('Physical', 'Physical characteristics of the product'),
('Technical', 'Technical specifications'),
('Material', 'Material composition');

-- Insert sample attribute types
INSERT INTO attribute_type (type_name, description) VALUES
('Text', 'Textual attribute'),
('Number', 'Numeric attribute'),
('Boolean', 'True/False attribute');

-- Insert sample products
INSERT INTO product (product_name, description, brand_id, category_id, base_price) VALUES
('Safaricom Neon Smart Kitochi', 'Affordable smartphone by Safaricom', 1, 5, 5999.00),
('Bata Toughees', 'Durable school shoes', 2, 7, 2500.00),
('Tusker Lager', 'Kenyan premium lager beer', 3, 9, 200.00),
('Jumia T-Shirt', 'Casual T-shirt from Jumia', 4, 7, 500.00);

-- Insert sample product images
INSERT INTO product_image (product_id, image_url, alt_text, is_primary, display_order) VALUES
(1, 'https://example.com/neon_smart_kitochi.jpg', 'Safaricom Neon Smart Kitochi front view', TRUE, 1),
(2, 'https://example.com/bata_toughees.jpg', 'Bata Toughees front view', TRUE, 1),
(3, 'https://example.com/tusker_lager.jpg', 'Tusker Lager bottle', TRUE, 1),
(4, 'https://example.com/jumia_tshirt.jpg', 'Jumia T-Shirt front view', TRUE, 1);

-- Insert sample product variations
INSERT INTO product_variation (product_id, variation_name) VALUES
(1, 'Storage Capacity'),
(2, 'Colorway'),
(3, 'Pack Size'),
(4, 'Size');

-- Insert sample product attributes
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, attribute_name, attribute_value) VALUES
(1, 2, 2, 'Storage', '16GB'),
(1, 2, 2, 'RAM', '2GB'),
(1, 2, 1, 'Processor', 'Quad-core'),
(2, 3, 1, 'Upper Material', 'Leather'),
(3, 2, 2, 'Pack Size', '6-pack'),
(4, 3, 1, 'Material', 'Cotton');

-- Insert sample product items (specific variations)
INSERT INTO product_item (product_id, sku, quantity_in_stock, price, color_id, size_id, variation_id, image_id) VALUES
(1, 'NEON-16GB-BLK', 50, 5999.00, 2, 8, 1, 1),
(2, 'TOUGHEES-BLK-38', 100, 2500.00, 2, 5, 2, 2),
(3, 'TUSKER-6PACK', 200, 1200.00, NULL, NULL, 3, 3),
(4, 'JUMIA-TSHIRT-M', 75, 500.00, 3, 2, 4, 4);
