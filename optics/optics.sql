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
CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(150),
    tax_id VARCHAR(20) UNIQUE,
    phone VARCHAR(20)
);
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
CREATE TABLE sale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATETIME,
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
INSERT INTO supplier (name, street, number, city, postal_code, country, phone, tax_id)
VALUES
('Optic Supplier SA', 'Main Street', '10', 'Barcelona', '08001', 'Spain', '933000111', 'A12345678'),
('VisionGlobal SL', 'Diagonal Avenue', '250', 'Barcelona', '08018', 'Spain', '934000222', 'B87654321');
INSERT INTO client (name, street, number, city, postal_code, phone, email, registration_date)
VALUES
('Maria Puig', 'New Street', '5', 'Mollet del Valles', '08100', '600123123', 'maria@example.com', '2025-01-10'),
('Joan Serra', 'Sun Street', '12', 'Mollet del Valles', '08100', '600456456', 'joan@example.com', '2025-01-11');

UPDATE client
SET referred_by = 1
WHERE id = 2;
INSERT INTO employee (name, surname, tax_id, phone)
VALUES
('Laura', 'Gonzalez Perez', '12345678A', '611111111'),
('Carles', 'Roca Serra', '87654321B', '622222222');
INSERT INTO glasses (
    brand, left_lens_grade, right_lens_grade,
    frame_type, frame_color,
    left_lens_color, right_lens_color,
    price, supplier_id
)
VALUES
('Ray-Ban', -1.25, -1.50, 'metal', 'black', 'clear', 'clear', 150.00, 1),
('Oakley', -2.00, -2.00, 'plastic', 'brown', 'smoked', 'smoked', 180.00, 2);
INSERT INTO sale (sale_date, client_id, employee_id, glasses_id)
VALUES
(NOW(), 1, 1, 1),
(NOW(), 2, 2, 2);
SELECT
    s.id AS sale_id,
    s.sale_date,
    c.name AS client,
    e.name AS employee,
    g.brand AS glasses_brand,
    g.price,
    sup.name AS supplier
FROM sale s
JOIN client c ON s.client_id = c.id
JOIN employee e ON s.employee_id = e.id
JOIN glasses g ON s.glasses_id = g.id
JOIN supplier sup ON g.supplier_id = sup.id;
SELECT
    c.name AS client,
    r.name AS referred_by
FROM client c
LEFT JOIN client r ON c.referred_by = r.id;

