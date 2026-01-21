USE optics;

-- SUPPLIERS
INSERT INTO supplier (name, street, number, city, postal_code, country, phone, tax_id)
VALUES
('Optic Supplier SA', 'Main Street', '10', 'Barcelona', '08001', 'Spain', '933000111', 'A12345678'),
('VisionGlobal SL', 'Diagonal Avenue', '250', 'Barcelona', '08018', 'Spain', '934000222', 'B87654321');

-- CLIENTS
INSERT INTO client (name, street, number, city, postal_code, phone, email, registration_date)
VALUES
('Maria Puig', 'New Street', '5', 'Mollet del Valles', '08100', '600123123', 'maria@example.com', '2025-01-10'),
('Joan Serra', 'Sun Street', '12', 'Mollet del Valles', '08100', '600456456', 'joan@example.com', '2025-01-11'),
('Anna Vidal', 'Ocean Street', '3', 'Barcelona', '08002', '600789789', 'anna@example.com', '2025-02-01');

UPDATE client SET referred_by = 1 WHERE id = 2;

-- EMPLOYEES
INSERT INTO employee (name, surname, tax_id, phone)
VALUES
('Laura', 'Gonzalez Perez', '12345678A', '611111111'),
('Carles', 'Roca Serra', '87654321B', '622222222'),
('Marta', 'Lopez Ruiz', '11223344C', '633333333');

-- GLASSES
INSERT INTO glasses (
    brand, left_lens_grade, right_lens_grade,
    frame_type, frame_color,
    left_lens_color, right_lens_color,
    price, supplier_id
)
VALUES
('Ray-Ban', -1.25, -1.50, 'metal', 'black', 'clear', 'clear', 150.00, 1),
('Oakley', -2.00, -2.00, 'plastic', 'brown', 'smoked', 'smoked', 180.00, 2),
('Gucci', -0.75, -1.00, 'rimless', 'silver', 'clear', 'clear', 220.00, 1);

-- SALES (trying to prove thats sales are fine)
INSERT INTO sale (sale_date, client_id, employee_id, glasses_id)
VALUES
('2025-01-15', 1, 1, 1),
('2025-02-10', 2, 2, 2),
('2025-03-05', 1, 1, 3),
('2025-04-20', 3, 3, 1);