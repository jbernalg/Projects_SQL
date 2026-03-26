USE farmers_market;

-- obtener una lista de los IDs de clientes que realizaron compras en cada fecha
SELECT
	market_date,
    customer_id
FROM customer_purchases
ORDER BY market_date, customer_id;

-- obtener lista de los IDs de clientes agrupados por cada fecha en que realizaron compras
SELECT
	market_date,
    customer_id
FROM customer_purchases
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id;

-- ---------------------- Funciones agregadoras -------------------------------
-- obtener la cantidad de veces que los clientes comprar por cada fecha
SELECT
	market_date,
    customer_id,
    COUNT(*) AS items_purchases
FROM customer_purchases
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id
LIMIT 10;

-- sumar todas las cantidades compradas por los clientes para cada fecha
SELECT
	market_date,
    customer_id,
    SUM(quantity) AS items_purchased
FROM customer_purchases
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id
LIMIT 10;

-- Cuantos tipos diferentes de articulos fueron comprados por cada cliente
SELECT
	market_date,
    customer_id,
    COUNT(DISTINCT product_id) AS different_products_purchased
FROM customer_purchases cp
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id
LIMIT 10;

-- mostrar las ultimas dos consultas en una sola
SELECT
	market_date,
    customer_id,
    SUM(quantity) AS items_purchased,
    COUNT(DISTINCT product_id) AS different_products_purchased
FROM customer_purchases
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id
LIMIT 10;

-- --------------- Calculos dentro de funciones agregadoras ---------------------
-- Obtener la lista de compra del cliente 3 junto al precio de cada compra.
SELECT
	market_date,
    customer_id,
    vendor_id,
    quantity * cost_to_customer_per_qty AS price
FROM customer_purchases
WHERE customer_id = 3
ORDER BY market_date, vendor_id;

-- Cuanto dinero gasto el cliente 3 en total en cada fecha?
SELECT
    customer_id,
    market_date,
    SUM(quantity * cost_to_customer_per_qty) AS total_spent
FROM customer_purchases
WHERE customer_id = 3
GROUP BY market_date
ORDER BY market_date;

-- Cuanto ha gastado el cliente 3 en cada proveedor, sin importar la fecha?
SELECT
	customer_id,
    vendor_id,
    SUM(quantity * cost_to_customer_per_qty) AS total_spent
FROM customer_purchases
WHERE
	customer_id = 3
GROUP BY customer_id, vendor_id
ORDER BY customer_id, vendor_id;

-- Cuanto han gastado los clientes en cada proveedor, sin importar la fecha?
SELECT
	customer_id,
    SUM(quantity * cost_to_customer_per_qty) AS total_spent
FROM customer_purchases
GROUP BY customer_id
ORDER BY customer_id;

-- traer algunos detalles del cliente 3 y de los proveedores que lo atienden
SELECT
	c.customer_first_name,
    c.customer_last_name,
    cp.customer_id,
    v.vendor_name,
    cp.vendor_id,
    cp.quantity * cp.cost_to_customer_per_qty AS price
FROM customer c
LEFT JOIN customer_purchases cp
	ON c.customer_id = cp.customer_id
LEFT JOIN vendor v
	ON cp.vendor_id = v.vendor_id
WHERE cp.customer_id = 3
ORDER BY cp.customer_id, cp.vendor_id;

-- agrupar a nivel de una fila por proveedor
SELECT
	c.customer_first_name,
    c.customer_last_name,
    cp.customer_id,
    v.vendor_name,
    cp.vendor_id,
    ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty), 2) AS total_spent
FROM customer c
LEFT JOIN customer_purchases cp
	ON c.customer_id = cp.customer_id
LEFT JOIN vendor v
	ON cp.vendor_id = v.vendor_id
WHERE cp.customer_id = 3
GROUP BY
	c.customer_first_name,
    c.customer_last_name,
    cp.customer_id,
    v.vendor_name,
    cp.vendor_id
ORDER BY cp.customer_id, cp.vendor_id;

-- lista de clientes del proveedor 7 con la misma informacion que la consulta anterior
SELECT
	c.customer_first_name,
    c.customer_last_name,
    cp.customer_id,
    v.vendor_name,
    cp.vendor_id,
    ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty), 2) AS total_spent
FROM customer c
LEFT JOIN customer_purchases cp
	ON c.customer_id = cp.customer_id
LEFT JOIN vendor v
	ON cp.vendor_id = v.vendor_id
WHERE cp.vendor_id = 7
GROUP BY
	c.customer_first_name,
    c.customer_last_name,
    cp.customer_id,
    v.vendor_name,
    cp.vendor_id
ORDER BY cp.customer_id, cp.vendor_id;

-- --------------------- MIN y MAX ------------------------------------------
-- mostrar todos los campos disponibles de vendor_inventory
SELECT *
FROM vendor_inventory
ORDER BY original_price
LIMIT 10;

-- obtener el precio del articulo mas barato y mas caro en toda la tabla
SELECT
	MIN(original_price) AS minimum_price,
    MAX(original_price) AS maximum_price
FROM  vendor_inventory
ORDER BY original_price;

-- obtener los precios mas bajos y mas altos dentro de cada cateogria de 
-- producto
SELECT
	pc.product_category_name,
    p.product_category_id,
    MIN(vi.original_price) AS minimum_price,
    MAX(vi.original_price) AS maximum_price
FROM vendor_inventory AS vi
INNER JOIN product AS p
	ON vi.product_id = p.product_id
INNER JOIN product_category AS pc
	ON p.product_category_id = pc.product_category_id
GROUP BY pc.product_category_name, p.product_category_id;


-- ------------------- COUNT and COUNT DISTINCT ------------------------------
-- Cuantos productos se ofrecen a la venta en cada fecha de marcado
SELECT
	market_date,
    COUNT(product_id) AS product_count
FROM vendor_inventory
GROUP BY market_date
ORDER BY market_date;

-- Cuantos productos diferentes cada proveedor llevo al mercado durante un rango de fecha?
SELECT
	vendor_id,
    COUNT(DISTINCT product_id) AS different_products_offered
FROM vendor_inventory
WHERE market_date BETWEEN '2019-04-03' AND '2019-04-16'
GROUP BY vendor_id
ORDER BY vendor_id;