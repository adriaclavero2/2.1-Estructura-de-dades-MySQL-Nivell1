USE pizzeria;

-- 1. Total de begudes venudes en una localitat
SELECT 
    l.name AS locality,
    SUM(op.quantity) AS total_drinks_sold
FROM orders o
JOIN client c ON o.client_id = c.id
JOIN locality l ON c.locality_id = l.id
JOIN order_product op ON o.id = op.order_id
JOIN product p ON op.product_id = p.id
JOIN category cat ON p.category_id = cat.id
WHERE cat.name = 'Drinks'
  AND l.id = 1
GROUP BY l.name;

-- 2. Total de comandes entregades per un repartidor
SELECT 
    e.name,
    e.surname,
    COUNT(o.id) AS total_orders_delivered
FROM orders o
JOIN employee e ON o.delivery_employee_id = e.id
WHERE e.id = 1
GROUP BY e.name, e.surname;

-- 3. Llistar totes les comandes
SELECT * FROM orders;