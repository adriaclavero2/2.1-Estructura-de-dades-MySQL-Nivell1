CREATE DATABASE optics;
USE optics;

-- SUPPLIER
CREATE TABLE supplier (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    number VARCHAR(10),
    floor VARCHAR(10),
    door VARCHAR(10),
    city VARCHAR(50),
    postal_code VARCHAR(10),
    country VARCHAR(50),
    phone VARCHAR(20),
    fax VARCHAR(20),
    tax_id VARCHAR(20) UNIQUE
);

-- CLIENT
CREATE TABLE client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    number VARCHAR(10),
    floor VARCHAR(10),
    door VARCHAR(10),
    city VARCHAR(50),
    postal_code VARCHAR(10),
    phone VARCHAR(20),
    email VARCHAR(100),
    registration_date DATE,
    referred_by INT,
    CONSTRAINT fk_client_referred
        FOREIGN KEY (referred_by) REFERENCES client(id)
);

-- EMPLOYEE
CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(150),
    tax_id VARCHAR(20) UNIQUE,
    phone VARCHAR(20)
);

-- GLASSES
CREATE TABLE glasses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    left_lens_grade DECIMAL(4,2),
    right_lens_grade DECIMAL(4,2),
    frame_type ENUM('rimless','plastic','metal'),
    frame_color VARCHAR(30),
    left_lens_color VARCHAR(30),
    right_lens_color VARCHAR(30),
    price DECIMAL(8,2),
    supplier_id INT,
    CONSTRAINT fk_glasses_supplier
        FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

-- SALE
CREATE TABLE sale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATE,
    client_id INT,
    employee_id INT,
    glasses_id INT,
    CONSTRAINT fk_sale_client
        FOREIGN KEY (client_id) REFERENCES client(id),
    CONSTRAINT fk_sale_employee
        FOREIGN KEY (employee_id) REFERENCES employee(id),
    CONSTRAINT fk_sale_glasses
        FOREIGN KEY (glasses_id) REFERENCES glasses(id)
);