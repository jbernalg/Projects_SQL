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

-- Cuanto dinero gasto el cliente en total en cada fecha?
SELECT
    customer_id,
    market_date,
    SUM(quantity * cost_to_customer_per_qty) AS total_spent
FROM customer_purchases
WHERE customer_id = 3
GROUP BY market_date
ORDER BY market_date;