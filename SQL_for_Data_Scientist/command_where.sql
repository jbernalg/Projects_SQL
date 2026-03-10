USE farmers_market;

-- obtener una lista de product_id y product_names ue sean de category 1
SELECT
	product_id,
    product_name,
    product_category_id
FROM product
WHERE product_category_id = 1
LIMIT 5;

-- informe de todo lo que un cliente en particular ha comprado alguna vez en el
-- mercado, ordenado por fecha del mercado, Id del vendedor e ID del producto
SELECT
	market_date,
    customer_id,
    vendor_id,
    product_id,
    quantity,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS price
FROM customer_purchases
WHERE customer_id = 4
ORDER BY market_date, vendor_id, product_id
LIMIT 5;

-- ------------------- OR - AND ------------------------------------
-- mostrar los productos con IDs del 4 al 10, sin incluir el 8 y 9
SELECT
	product_id,
    product_name
FROM  product
WHERE
	product_id = 10 OR (product_id > 3 AND product_id < 8);
    
-- mostrar los productos con IDs del 4 al 7
SELECT
	product_id,
    product_name
FROM  product
WHERE
	(product_id = 10 OR product_id > 3) AND product_id < 8;
    
-- Mostrar las compras realizadas por el cliente al proveedor 7
SELECT
	market_date,
    customer_id,
    vendor_id,
    ROUND(quantity * cost_to_customer_per_qty,2) AS price
FROM customer_purchases
WHERE
	customer_id = 4 AND vendor_id = 7;
    
-- Mostrar los clientes que tengan como nombre 'Carlos' o ue tengan como apellido 'Diaz'
SELECT
	customer_id,
    customer_first_name,
    customer_last_name
FROM customer
WHERE
	customer_first_name = 'Carlos' OR customer_last_name = 'Diaz';
    
-- A que stand fue asignado el proveedor 9 en o antes del 9 de abril de 2019
SELECT *
FROM vendor_booth_assignments
WHERE
	vendor_id = 9 AND market_date <= '2019-04-09'
ORDER BY market_date;


-- --------------------- BETWEEN -----------------------------------------    
-- Encontrar las asignaciones de puestos para el vendedor 7 para cualquier fecha
-- de mercado que ocurriera entre el 2 y el 16 de abril de 2019
SELECT *
FROM vendor_booth_assignments
WHERE
	vendor_id = 7 AND market_date BETWEEN '2019-04-02' AND '2019-04-16'
ORDER BY market_date;

-- ------------------- IN -------------------------------------------------
-- obtener los clientes con apellido Diaz, Edwards o Wilson
SELECT
	customer_id,
    customer_first_name,
    customer_last_name
FROM customer
WHERE
	customer_last_name IN ('Diaz', 'Edwards', 'Wilson')
ORDER BY customer_last_name, customer_first_name; 

-- Encuentra el apellido de clientes segun diferentes variaciones
SELECT
	customer_id,
    customer_first_name,
    customer_last_name
FROM customer
WHERE
	customer_last_name IN ('Renee', 'Rene', 'Renée', 'René', 'Renne');
    
-- ------------------ LIKE -----------------------------------------
-- obtener clientes cuyo nombre comience por Jer
SELECT
	customer_id,
    customer_first_name,
    customer_last_name
FROM customer
WHERE customer_first_name LIKE 'Jer%'; 

    
    