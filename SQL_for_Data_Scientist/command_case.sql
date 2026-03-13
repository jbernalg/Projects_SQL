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

-- clasificacion numerica del precio con el extremo inferior del rango
SELECT
	market_date,
    customer_id,
    vendor_id,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS price,
    CASE
		WHEN quantity * cost_to_customer_per_qty < 5.00
			THEN 0
		WHEN quantity * cost_to_customer_per_qty < 10.00
			THEN 5
		WHEN quantity * cost_to_customer_per_qty < 20.00
			THEN 10
		WHEN quantity * cost_to_customer_per_qty >= 20.00
			THEN 20
	END AS price_bin_lower_end
FROM customer_purchases
LIMIT 20;

-- -------------------- Codificacion categorica ---------------------------
-- convertir los niveles de precio de los puestos en valores numericos
SELECT
	booth_number,
    booth_price_level,
    CASE
		WHEN booth_price_level = 'A' THEN 1
        WHEN booth_price_level = 'B' THEN 2
        WHEN booth_price_level = 'C' THEN 3
	END as boot_price_leve_numeric
FROM booth;

-- ------------------- Variables ficticias con One Hot ----------------------------
-- codificar en one hot las categorias de tipo de proveedor
SELECT
	vendor_id,
    vendor_name,
    vendor_type,
    CASE WHEN vendor_type = 'Arts & Jewelry' THEN 1
		ELSE 0
	END AS vendor_type_arts_jewelry,
    CASE WHEN vendor_type = 'Eggs & Meats' THEN 1
		ELSE 0
	END AS vendor_type_eggs_meats,
    CASE WHEN vendor_type = 'Fresh Focused' THEN 1
		ELSE 0
	END AS vendor_type_fresh_focused,
    CASE WHEN vendor_type = 'Fresh Variety: Veggies & More' THEN 1
		ELSE 0
	END AS vendor_type_fresh_variety,
    CASE WHEN vendor_type = 'Prepared Foods' THEN 1
		ELSE 0
	END AS vendor_type_prepared
FROM vendor;
