CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(6,2) NOT NULL,
    category_id INT,
    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id) REFERENCES category(id)
);
CREATE TABLE store (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(150) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    locality_id INT NOT NULL,
    CONSTRAINT fk_store_locality
        FOREIGN KEY (locality_id) REFERENCES locality(id)
);
CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    tax_id VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    role ENUM('cook','delivery') NOT NULL,
    store_id INT NOT NULL,
    CONSTRAINT fk_employee_store
        FOREIGN KEY (store_id) REFERENCES store(id)
);
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_datetime DATETIME NOT NULL,
    delivery_type ENUM('delivery','pickup') NOT NULL,
    client_id INT NOT NULL,
    store_id INT NOT NULL,
    delivery_employee_id INT,
    delivery_datetime DATETIME,
    total_price DECIMAL(7,2) NOT NULL,
    CONSTRAINT fk_order_client
        FOREIGN KEY (client_id) REFERENCES client(id),
    CONSTRAINT fk_order_store
        FOREIGN KEY (store_id) REFERENCES store(id),
    CONSTRAINT fk_order_delivery_employee
        FOREIGN KEY (delivery_employee_id) REFERENCES employee(id)
);
CREATE TABLE order_product (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_orderproduct_order
        FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_orderproduct_product
        FOREIGN KEY (product_id) REFERENCES product(id)
);