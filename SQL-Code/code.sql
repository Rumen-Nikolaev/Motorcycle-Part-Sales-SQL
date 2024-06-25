-- Show table structure
DESC sales;

-- Preview sample data
SELECT * FROM sales LIMIT 10;


SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    warehouse_id,
    SUM(quantity * unit_price) AS net_revenue
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m'), warehouse_id
ORDER BY month, warehouse_id;

SELECT
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
    w.warehouse_name,
    p.product_name,
    SUM(s.quantity * s.unit_price) AS net_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN warehouses w ON s.warehouse_id = w.warehouse_id
GROUP BY DATE_FORMAT(s.sale_date, '%Y-%m'), w.warehouse_name, p.product_name
ORDER BY month, w.warehouse_name, p.product_name;

