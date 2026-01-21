USE pizzeria;

-- PROVINCES
INSERT INTO province (name) VALUES
('Barcelona'),
('Girona');

-- LOCALITIES
INSERT INTO locality (name, province_id) VALUES
('Mollet del Vallès', 1),
('Granollers', 1),
('Girona', 2);

-- CLIENTS
INSERT INTO client (name, surname, address, postal_code, phone, locality_id) VALUES
('Maria', 'Puig', 'Carrer Nou 12', '08100', '600111222', 1),
('Joan', 'Serra', 'Carrer Sol 5', '08100', '600333444', 1),
('Anna', 'Vidal', 'Rambla 20', '08400', '600555666', 2);

-- CATEGORIES
INSERT INTO category (name) VALUES
('Pizza'),
('Hamburger'),
('Drinks');

-- PRODUCTS
INSERT INTO product (name, description, image, price, category_id) VALUES
('Margarita', 'Classic pizza with tomato and cheese', 'margarita.jpg', 8.50, 1),
('Pepperoni', 'Pepperoni pizza', 'pepperoni.jpg', 9.50, 1),
('Cheeseburger', 'Beef burger with cheese', 'cheeseburger.jpg', 7.00, 2),
('Coca-Cola', '33cl can', 'coke.jpg', 2.00, 3),
('Water', 'Bottle 50cl', 'water.jpg', 1.50, 3);

-- STORES
INSERT INTO store (address, postal_code, locality_id) VALUES
('Av. Catalunya 10', '08100', 1),
('Carrer Major 22', '08400', 2);

-- EMPLOYEES
INSERT INTO employee (name, surname, tax_id, phone, role, store_id) VALUES
('Laura', 'Gonzalez', '12345678A', '611111111', 'cook', 1),
('Carles', 'Roca', '87654321B', '622222222', 'delivery', 1),
('Marta', 'Lopez', '11223344C', '633333333', 'delivery', 2);

-- ORDERS
INSERT INTO orders (order_datetime, delivery_type, client_id, store_id, delivery_employee_id, delivery_datetime, total_price)
VALUES
('2025-01-10 20:15:00', 'delivery', 1, 1, 2, '2025-01-10 20:40:00', 12.50),
('2025-01-12 21:00:00', 'pickup', 2, 1, NULL, NULL, 9.50),
('2025-02-05 19:30:00', 'delivery', 3, 2, 3, '2025-02-05 19:55:00', 11.00);

-- ORDER_PRODUCT
INSERT INTO order_product (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 4, 1),
(2, 2, 1),
(3, 3, 1),
(3, 5, 1);