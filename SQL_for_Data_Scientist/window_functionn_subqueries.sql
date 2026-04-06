USE farmers_market;

-- las funciones de ventana devuelven cálculos agregados de grupo junto con información de nivel de fila 
-- individual para los elementos de ese grupo o partición.
-- También se pueden usar para clasificar u ordenar valores dentro de cada partición.
-- Un uso de las funciones de ventana en ciencia de datos es incluir alguna información de un registro 
-- anterior junto con el registro más reciente de detalle relacionado con una entidad. 

-- Cuanto cuesta el producto mas caro vendido por cada proveedor?
SELECT
	vendor_id,
    MAX(original_price) AS highest_price
FROM vendor_inventory
GROUP BY vendor_id
ORDER BY vendor_id;

-- ---------------------------- ROW NUMBER --------------------------------------
-- ordenar y clasificar los productos para cada proveedor segun el precio
SELECT
	vendor_id,
    market_date,
    product_id,
    original_price,
    ROW_NUMBER() OVER (PARTITION BY vendor_id ORDER BY original_price DESC) AS price_rank
FROM vendor_inventory
ORDER BY vendor_id, original_price DESC;

-- Cual es ese articulo mas caro de cada proveedor?
SELECT * FROM 
(
	SELECT
		vendor_id,
        market_date,
        product_id,
        original_price,
        ROW_NUMBER() OVER (PARTITION BY vendor_id ORDER BY original_price DESC) AS price_rank
    FROM vendor_inventory
    ORDER BY vendor_id
) AS x
WHERE x.price_rank = 1;

-- ------------------------- RANK -------------------------------------
-- numera los resultados de la misma manera que row_number, pero asigna con el mismo valor
-- el mismo ranking
SELECT
	vendor_id,
    market_date,
    product_id,
    original_price,
    RANK() OVER (PARTITION BY vendor_id ORDER BY original_price DESC) AS price_rank
FROM vendor_inventory
ORDER BY vendor_id, original_price DESC;

-- ------------------------- DENSE_RANK -----------------------------------
-- util cuando hay empates en la clasificacion y no desea saltarse la secuencia
SELECT
	vendor_id,
    market_date,
    product_id,
    original_price,
    DENSE_RANK() OVER (PARTITION BY vendor_id ORDER BY original_price DESC) AS price_rank
FROM vendor_inventory
ORDER BY vendor_id, original_price DESC;

-- ------------------------------ NTILE ------------------------------------
-- divide los registros en n bloques
-- obtener el productos que ocupa el decimo superior del inventario, cuando se ordena por precio
SELECT
	vendor_id,
    market_date,
    product_id,
    original_price,
    NTILE(10) OVER (ORDER BY original_price DESC) AS price_ntile
FROM vendor_inventory  
ORDER BY original_price DESC;

-- --------------------- Funciones de ventana agregada ---------------------------------
-- si ud es un agricultor que vende productos en el mercado y quiere saber cuales de sus
-- productos tenian un precio por encima del promedio por producto en cada fecha de mercado?
SELECT
	vendor_id,
    market_date,
    product_id,
    original_price,
    AVG(original_price) OVER (PARTITION BY market_date ORDER BY market_date) AS avg_cost_product_by_market
FROM vendor_inventory;

-- filtramos solo por el vendor_id = 8
SELECT * FROM
(
	SELECT
		vendor_id,
		market_date,
		product_id,
		original_price,
		ROUND(AVG(original_price) OVER (PARTITION BY market_date ORDER BY market_date),2) AS avg_cost_product_by_market
	FROM vendor_inventory
) x
WHERE x.vendor_id = 8 
	AND x.original_price > x.avg_cost_product_by_market
ORDER BY x.market_date, x.original_price DESC;
-- El vendedor 8 tenia 2 productos, 7 y 8, que estaban por encima del costo promedio
-- de los productos en cada una de las fechas del mercado listadas

-- Cuantos productos diferentes trajo al mercado cada proveedor en cada fecha?
SELECT
	vendor_id,
    market_date,
    product_id,
    original_price,
    COUNT(product_id) OVER (PARTITION BY market_date, vendor_id) AS vendor_product_count_per_market_date
FROM vendor_inventory
ORDER BY vendor_id, market_date, original_price DESC;



