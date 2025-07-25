DROP DATABASE IF EXISTS ecommerce; 
CREATE DATABASE ecommerce; 
USE ecommerce; -- Users Table 
CREATE TABLE IF NOT EXISTS users ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
username VARCHAR (255) NOT NULL, 
password VARCHAR (255) NOT NULL, 
email VARCHAR (255) NOT NULL, 
UNIQUE (email)-- Ensure that the email is unique  
); 
select * from users; 
 
 

 -- Products Table 
CREATE TABLE products ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255), 
    category VARCHAR(100), 
    price DECIMAL(10,2), 
    image_url VARCHAR(500) 
); 
 -- Cart Table 
CREATE TABLE cart ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    user_id INT, 
    product_id INT, 
    quantity INT DEFAULT 1, 
    FOREIGN KEY (user_id) REFERENCES users(id), 
    FOREIGN KEY (product_id) REFERENCES products(id) 
); 
DESCRIBE products; 
ALTER TABLE products ADD COLUMN image VARCHAR(255); 
 
CREATE TABLE admins ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    username VARCHAR(50) UNIQUE NOT NULL, 
    password VARCHAR(255) NOT NULL 
); 
 
INSERT INTO admins (username, password) VALUES ('admin', 'admin'); -- Sample data 
SELECT * FROM products; 
CREATE TABLE wishlist ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    user_id INT, 
    product_id INT, 
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE, 
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE 
); 
 
CREATE TABLE categories ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255) UNIQUE NOT NULL 
); 
ALTER TABLE products ADD COLUMN category_id INT; 
ALTER TABLE products ADD CONSTRAINT fk_category FOREIGN KEY (category_id) 
REFERENCES categories(id); 
SELECT id, name, price, category, image FROM products; 
 
UPDATE products SET image = 'iphone13.jpg' WHERE name = 'iPhone 13'; 
UPDATE products SET image = 'samsung_s22.jpg' WHERE name = 'Samsung Galaxy S22'; 
UPDATE products SET image = 'sony_headphones.jpg' WHERE name = 'Sony Headphones'; 
UPDATE products SET image = 'nike_shoes.jpg' WHERE name = 'Nike Running Shoes'; 
SET SQL_SAFE_UPDATES = 0; 
 
 
UPDATE products SET image = 'iphone13.jpg' WHERE id = 1; 
UPDATE products SET image = 'samsung_s22.jpg' WHERE id = 2; 
UPDATE products SET image = 'sony_headphones.jpg' WHERE id = 3; 
UPDATE products SET image = 'nike_shoes.jpg' WHERE id = 4; 
 
UPDATE products SET image = 'iphone13.jpg' WHERE id = 11; 
UPDATE products SET image = 'samsung_s22.jpg' WHERE id = 7; 
UPDATE products SET image = 'sony_headphones.jpg' WHERE id = 8; 
UPDATE products SET image = 'nike_shoes.jpg' WHERE id = 9; 
 
SET SQL_SAFE_UPDATES = 1; 
 
SELECT id, name, image FROM products; 
select * from products; 
select * from categories; -- Sample Products 
INSERT INTO products (name, category, price, image_url) VALUES 
('iPhone 13', 'Electronics', 799.99, 'iphone13.jpg'), 
('Samsung Galaxy S22', 'Electronics', 749.99, 'samsung_s22.jpg'), 
('Sony Headphones', 'Audio', 199.99, 'sony_headphones.jpg'), 
('Nike Running Shoes', 'Fashion', 89.99, 'nike_shoes.jpg'); 