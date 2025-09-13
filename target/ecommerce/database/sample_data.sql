
-- Sample Data for E-Commerce Database
USE ecommerce_db;

-- Insert sample products
INSERT INTO products (name, description, short_description, sku, category_id, price, compare_price, stock_quantity, is_featured, is_active, brand, tags) VALUES 
-- Electronics - Smartphones
('iPhone 15 Pro', 'The latest iPhone with A17 Pro chip, titanium design, and advanced camera system', 'Latest iPhone with titanium design and A17 Pro chip', 'IPH15PRO001', 6, 999.00, 1099.00, 50, TRUE, TRUE, 'Apple', 'smartphone,iphone,apple,mobile'),
('Samsung Galaxy S24', 'Premium Android smartphone with AI features and excellent camera', 'Premium Samsung Galaxy with AI features', 'SAMS24001', 6, 899.00, 999.00, 45, TRUE, TRUE, 'Samsung', 'smartphone,samsung,android,mobile'),
('Google Pixel 8', 'Pure Android experience with advanced AI photography', 'Google Pixel with AI photography', 'PIXEL8001', 6, 699.00, 799.00, 30, FALSE, TRUE, 'Google', 'smartphone,pixel,google,android'),

-- Electronics - Laptops  
('MacBook Air M2', 'Ultra-thin laptop with M2 chip, perfect for work and creativity', '13-inch MacBook Air with M2 chip', 'MBAM2001', 7, 1199.00, 1299.00, 25, TRUE, TRUE, 'Apple', 'laptop,macbook,apple,computer'),
('Dell XPS 13', 'Premium Windows laptop with stunning display and performance', 'Premium ultrabook with InfinityEdge display', 'DELLXPS13001', 7, 999.00, 1199.00, 20, FALSE, TRUE, 'Dell', 'laptop,dell,windows,ultrabook'),
('Lenovo ThinkPad X1', 'Business-grade laptop built for professionals', 'Professional laptop with enterprise security', 'TPXN1001', 7, 1399.00, 1599.00, 15, FALSE, TRUE, 'Lenovo', 'laptop,thinkpad,business,lenovo'),

-- Clothing - Men's
('Men\'s Cotton T-Shirt', 'Comfortable 100% cotton t-shirt available in multiple colors', 'Comfortable cotton t-shirt for everyday wear', 'MCTSHIRT001', 8, 19.99, 29.99, 100, FALSE, TRUE, 'BasicWear', 'tshirt,cotton,men,casual'),
('Men\'s Denim Jeans', 'Classic straight-fit jeans made from premium denim', 'Classic straight-fit denim jeans', 'MJEANS001', 8, 59.99, 79.99, 75, FALSE, TRUE, 'DenimCo', 'jeans,denim,men,pants'),
('Men\'s Polo Shirt', 'Smart casual polo shirt perfect for work and weekend', 'Smart casual polo shirt', 'MPOLO001', 8, 39.99, 49.99, 60, FALSE, TRUE, 'SmartWear', 'polo,shirt,men,casual'),

-- Clothing - Women's
('Women\'s Floral Dress', 'Beautiful floral print dress perfect for summer occasions', 'Elegant floral print summer dress', 'WDRESS001', 9, 79.99, 99.99, 40, TRUE, TRUE, 'FloralFashion', 'dress,floral,women,summer'),
('Women\'s Skinny Jeans', 'Comfortable stretch skinny jeans in classic blue', 'Comfortable stretch skinny jeans', 'WJEANS001', 9, 69.99, 89.99, 50, FALSE, TRUE, 'DenimCo', 'jeans,skinny,women,denim'),

-- Books - Fiction
('The Great Gatsby', 'Classic American novel by F. Scott Fitzgerald', 'Timeless tale of love, loss, and the American Dream', 'BOOK001', 10, 12.99, 15.99, 200, FALSE, TRUE, 'Scribner', 'fiction,classic,american,literature'),
('1984', 'George Orwell\'s dystopian masterpiece', 'Dystopian novel about totalitarian surveillance', 'BOOK002', 10, 13.99, 16.99, 150, TRUE, TRUE, 'Harcourt', 'fiction,dystopian,orwell,classic'),

-- Books - Non-Fiction
('Sapiens', 'A Brief History of Humankind by Yuval Noah Harari', 'Fascinating journey through human history', 'BOOK003', 11, 16.99, 19.99, 100, TRUE, TRUE, 'Harper', 'non-fiction,history,science,philosophy');

-- Insert product images
INSERT INTO product_images (product_id, image_url, alt_text, is_primary, sort_order) VALUES 
(1, '/images/products/iphone15pro-1.jpg', 'iPhone 15 Pro Front View', TRUE, 1),
(1, '/images/products/iphone15pro-2.jpg', 'iPhone 15 Pro Back View', FALSE, 2),
(2, '/images/products/galaxy-s24-1.jpg', 'Samsung Galaxy S24 Front View', TRUE, 1),
(3, '/images/products/pixel8-1.jpg', 'Google Pixel 8 Front View', TRUE, 1),
(4, '/images/products/macbook-air-m2-1.jpg', 'MacBook Air M2 Front View', TRUE, 1),
(5, '/images/products/dell-xps13-1.jpg', 'Dell XPS 13 Front View', TRUE, 1),
(6, '/images/products/thinkpad-x1-1.jpg', 'ThinkPad X1 Front View', TRUE, 1),
(7, '/images/products/mens-tshirt-1.jpg', 'Men\'s Cotton T-Shirt', TRUE, 1),
(8, '/images/products/mens-jeans-1.jpg', 'Men\'s Denim Jeans', TRUE, 1),
(9, '/images/products/mens-polo-1.jpg', 'Men\'s Polo Shirt', TRUE, 1),
(10, '/images/products/womens-dress-1.jpg', 'Women\'s Floral Dress', TRUE, 1),
(11, '/images/products/womens-jeans-1.jpg', 'Women\'s Skinny Jeans', TRUE, 1),
(12, '/images/products/great-gatsby-1.jpg', 'The Great Gatsby Book Cover', TRUE, 1),
(13, '/images/products/1984-1.jpg', '1984 Book Cover', TRUE, 1),
(14, '/images/products/sapiens-1.jpg', 'Sapiens Book Cover', TRUE, 1);

-- Insert sample users
INSERT INTO users (name, username, email, password_hash, phone, is_active, email_verified) VALUES 
('John Doe', 'john.doe', 'john.doe@email.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewfBK7RjK/VeHa6u', '+1234567890', TRUE, TRUE),
('Jane Smith', 'jane.smith', 'jane.smith@email.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewfBK7RjK/VeHa6u', '+1234567891', TRUE, TRUE),
('Bob Johnson', 'bob.johnson', 'bob.johnson@email.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewfBK7RjK/VeHa6u', '+1234567892', TRUE, TRUE);
-- Password for all: password123

-- Insert sample addresses
INSERT INTO addresses (user_id, type, first_name, last_name, address_line1, city, state, postal_code, country, phone, is_default) VALUES 
(1, 'BOTH', 'John', 'Doe', '123 Main Street', 'New York', 'NY', '10001', 'USA', '+1234567890', TRUE),
(2, 'BOTH', 'Jane', 'Smith', '456 Oak Avenue', 'Los Angeles', 'CA', '90210', 'USA', '+1234567891', TRUE),
(3, 'BOTH', 'Bob', 'Johnson', '789 Pine Road', 'Chicago', 'IL', '60601', 'USA', '+1234567892', TRUE);

-- Insert sample coupons
INSERT INTO coupons (code, name, description, type, value, min_order_amount, max_discount_amount, usage_limit, is_active, starts_at, expires_at) VALUES 
('WELCOME10', 'Welcome Discount', 'Get 10% off on your first order', 'PERCENTAGE', 10.00, 50.00, 100.00, 1000, TRUE, '2024-01-01 00:00:00', '2024-12-31 23:59:59'),
('SAVE50', 'Save $50', 'Get $50 off on orders above $500', 'FIXED_AMOUNT', 50.00, 500.00, NULL, 500, TRUE, '2024-01-01 00:00:00', '2024-12-31 23:59:59'),
('ELECTRONICS15', 'Electronics Sale', 'Get 15% off on electronics', 'PERCENTAGE', 15.00, 100.00, 200.00, 200, TRUE, '2024-01-01 00:00:00', '2024-12-31 23:59:59');

-- Insert sample orders
INSERT INTO orders (order_number, user_id, status, subtotal, tax_amount, shipping_amount, total_amount, billing_address, shipping_address, notes) VALUES 
('ORD-2024-001', 1, 'DEL