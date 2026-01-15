SELECT 
    c.name AS client,
    COUNT(s.id) AS total_factures
FROM sale s
JOIN client c ON s.client_id = c.id
WHERE c.id = 1
  AND s.sale_date BETWEEN '2025-01-01' AND '2025-12-31';
SELECT DISTINCT 
    g.brand
FROM sale s
JOIN glasses g ON s.glasses_id = g.id
WHERE s.employee_id = 1
  AND YEAR(s.sale_date) = 2025;
  SELECT * FROM sale;