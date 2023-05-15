DROP DATABASE webstore;
CREATE database webstore;

CREATE TABLE `customers` (
  `customer_id` int PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp DEFAULT current_timestamp,
  `fullname` varchar(64) NOT NULL,
  `country` varchar(64) NOT NULL
);

CREATE TABLE `products` (
  `product_id` int PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp DEFAULT current_timestamp,
  `price` numeric(8, 2) NOT NULL,
  `title` varchar(64) NOT NULL,
  `supplier_id` int,
  `category_id` int
);

CREATE TABLE `categories` (
  `category_id` int PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp DEFAULT current_timestamp,
  `name` varchar(64) NOT NULL
);

CREATE TABLE `shippers` (
  `shipper_id` int PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp DEFAULT current_timestamp,
  `company_name` varchar(64) NOT NULL,
  `country` varchar(64) NOT NULL
);

CREATE TABLE `suppliers` (
  `supplier_id` int PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp DEFAULT current_timestamp,
  `company_name` varchar(64) NOT NULL,
  `country` varchar(64) NOT NULL
);

CREATE TABLE `orders` (
  `order_id` int PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp DEFAULT current_timestamp,
  `customer_id` int,
  `shipper_id` int,
  `cost` numeric(9, 2) NOT NULL
);

CREATE TABLE `order_products` (
  `order_product_id` int PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp DEFAULT current_timestamp,
  `order_id` int,
  `product_id` int,
  `quantity` int NOT NULL,
  `price` numeric(9, 2) NOT NULL
);

ALTER TABLE `orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`shipper_id`);

ALTER TABLE `order_products` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `products` ADD FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

ALTER TABLE `products` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

ALTER TABLE `order_products` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);