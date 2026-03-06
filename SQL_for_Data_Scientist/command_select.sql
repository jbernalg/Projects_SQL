USE farmers_market;

-- mostrar los 5 primeros registros de la tabla product
SELECT * FROM product
LIMIT 5;

-- listar market date, vendor ID y booth number de los primeros 5 registros
-- de la tabla vendor_booth_assignments
SELECT
	market_date,
    vendor_id,
    booth_number
FROM vendor_booth_assignments
ORDER BY market_date
LIMIT 5;

-- mostrar el product_id y el product_name de los 5 primeros registros de la tabla product
-- ordenando los registros alfabeticamente por product_name
SELECT
	product_id,
    product_name
FROM product
ORDER BY product_name
LIMIT 5;

-- listar market date, vendor ID y booth number de los primeros 5 registros
-- de la tabla vendor_booth_assignments ordenados por market_date y vendor_id
SELECT
	market_date,
    vendor_id,
    booth_number
FROM vendor_booth_assignments
ORDER BY market_date, vendor_id
LIMIT 5;

-- tabla customer_purchases
SELECT * FROM customer_purchases LIMIT 5;

-- obtener el price de la tabla customer_purchases
SELECT
	market_date,
    customer_id,
    quantity,
    cost_to_customer_per_qty,
    ROUND(quantity * cost_to_customer_per_qty,2) AS price
FROM customer_purchases
LIMIT 10;

-- tabla customer
SELECT * FROM customer LIMIT 5;

-- concatenar el customer_first_name con customer_last_name en una nueva columna
SELECT
	customer_id,
    CONCAT(customer_first_name, ' ', customer_last_name) AS customer_name
FROM customer
ORDER BY customer_last_name
LIMIT 5;

-- Mostrar el nombre completo de los customer en mayuscula
SELECT
	customer_id,
    UPPER(CONCAT(customer_last_name, ', ', customer_first_name)) AS customer_name
FROM customer
ORDER BY customer_last_name, customer_first_name
LIMIT 5;    
