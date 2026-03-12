USE farmers_market;

-- Clasificar vendedores segun venta de productos frescos
SELECT
	vendor_id,
    vendor_name,
    vendor_type,
    CASE
		WHEN LOWER(vendor_type) LIKE '%fresh%'
			THEN 'Fresh Produce'
		ELSE 'Other'
	END AS vendor_type_condensed
FROM vendor;

-- ----------------- Banderas binarias ---------------------------
-- mostrar dias en los que abren el mercado
SELECT
	market_date,
    market_day
FROM market_date_info
LIMIT 5;

-- crear columna que clasifique los dias de apertura del mercado
SELECT
	market_date,
    CASE
		WHEN market_day = 'Saturday' OR market_day = 'Sunday'
			THEN 1
		ELSE 0
	END AS weekend_flag
FROM market_date_info
LIMIT 5;

-- ----------- Clasificacion de valores continuos -----------------------
-- crear columna binaria que clasifique a los clientes cuya compra sea mayor a $50
SELECT
	market_date,
    customer_id,
    vendor_id,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS price,
    CASE
		WHEN quantity * cost_to_customer_per_qty > 50
			THEN 1
		ELSE 0
	END AS price_over_50
FROM customer_purchases
LIMIT 20;

-- Clasificar el precio en varias categorias
SELECT
	market_date,
    customer_id,
    vendor_id,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS price,
    CASE
		WHEN quantity * cost_to_customer_per_qty < 5.00
			THEN 'Under $5'
		WHEN quantity * cost_to_customer_per_qty < 10.00
			THEN '$5 - $9.99'
		WHEN quantity * cost_to_customer_per_qty < 20.00
			THEN '$10 - $19.99'
		WHEN quantity * cost_to_customer_per_qty >= 20.00
			THEN '$20 and up'
	END AS price_bin
FROM customer_purchases
LIMIT 20;

