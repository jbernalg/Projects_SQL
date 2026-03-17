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

-- obtener la cantidad de veces que los clientes comprar por cada fecha
SELECT
	market_date,
    customer_id,
    COUNT(*) AS items_purchases
FROM customer_purchases
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id
LIMIT 10;