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
