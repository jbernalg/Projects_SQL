USE farmers_market;

-- --------------------------- establecer valores de campo de fecha y hora --------------------------
SELECT * FROM market_date_info;

-- crear tabla con fechas y horas combinando los campos market_date y market_start_time
CREATE TABLE farmers_market.datetime_demo AS (

	SELECT 
		market_date,
        market_start_time,
        market_end_time,
        STR_TO_DATE(CONCAT(market_date, ' ', market_start_time), '%Y-%m-%d%h:%i %p') AS market_start_datetime,
        STR_TO_DATE(CONCAT(market_date, ' ', market_end_time), '%Y-%m-%d%h:%i %p') AS market_end_datetime
	FROM farmers_market.market_date_info
);

SELECT * FROM datetime_demo;

-- ------------------------------- EXTRACT --------------------------
-- obtener todas las partes de un datetime de una fecha especifica
SELECT
	market_start_datetime,
	EXTRACT(DAY FROM market_start_datetime) AS msd_day,
    EXTRACT(MONTH FROM market_start_datetime) AS msd_month,
    EXTRACT(YEAR FROM market_start_datetime) AS msd_year,
    EXTRACT(HOUR FROM market_start_datetime) AS msd_hour,
    EXTRACT(MINUTE FROM market_start_datetime) AS msd_minute
FROM datetime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00';

-- ---------------------------- DATE y TIME -------------------------------
-- obtener la fecha y la hora completa de un datetime especifico
SELECT
	market_start_datetime,
    DATE(market_start_datetime) AS msd_date,
    TIME(market_start_datetime) AS msd_time
FROM datetime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00';

-- -------------------------- DATE_ADD ------------------------------
-- Cuantas ventas ocurrieron dentro de los primeros 30 minutos despues de que abrio
-- el mercado?
SELECT
	market_start_datetime,
    DATE_ADD(market_start_datetime, INTERVAL 30 MINUTE) AS msd_date_plus_30min
FROM datetime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00';

SELECT
	market_start_datetime,
    DATE_ADD(market_start_datetime, INTERVAL 30 DAY) AS msd_date_plus_30days
FROM datetime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00';

-- ------------------------- DATE_SUB ------------------------------
-- Resta intevarlos de fechas y horas
SELECT
	market_start_datetime,
    DATE_ADD(market_start_datetime, INTERVAL -30 DAY) AS msd_date_plus_neg30days,
    DATE_SUB(market_start_datetime, INTERVAL 30 DAY) AS msd_date_minus_30days
FROM datetime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00';

-- ------------------------- DATEDIFF ---------------------------------------
-- acepta dos fechas y devuelve la diferencia entre ellas
SELECT
	x.first_market,
    x.last_market,
    DATEDIFF(x.last_market, x.first_market) days_first_to_last
FROM (
	SELECT
		MIN(market_start_datetime) first_market,
        MAX(market_start_datetime) last_market
    FROM farmers_market.datetime_demo
) x;

-- -------------------------- TIMESTAMPDIFF ----------------------------------
-- devuelve la diferencia entre dos fechas y horas en cualquier intervalo elegido

-- Calcular las horas y los minutos entre los horarios de inicio y fin del mercado en cada fecha
SELECT
	market_start_datetime,
    market_end_datetime,
    TIMESTAMPDIFF(HOUR, market_start_datetime, market_end_datetime) AS market_duration_hours,
    TIMESTAMPDIFF(MINUTE, market_start_datetime, market_end_datetime) AS market_duration_mins
FROM datetime_demo;

-- ----------- Funciones de fecha en resumenes agregados  ------------
-- obtener los registros de detalle de compra de cada cliente, en este caso, para el cliente 1
SELECT
	customer_id,
    market_date
FROM customer_purchases
WHERE customer_id = 1;

-- determinar en cuantas fechas diferentes el cliente 1 realizo compras
SELECT
	MIN(market_date) AS first_purchases,
    MAX(market_date) AS last_purchases,
    COUNT(DISTINCT market_date) AS count_of_purchases_dates
FROM customer_purchases
WHERE customer_id = 1
GROUP BY customer_id;

-- determinar por cuanto tiempo han las personas han sido clientes del mercado
SELECT
	customer_id,
	MIN(market_date) AS first_purchases,
    MAX(market_date) AS last_purchases,
    COUNT(DISTINCT market_date) AS count_of_purchases_dates,
    DATEDIFF(MAX(market_date), MIN(market_date)) AS days_between_first_last_purchases
FROM customer_purchases
GROUP BY customer_id;

-- ------------------------- CURDATE -----------------------------------
-- representa la fecha actual del sistema en cualquier calculo que requiera un parametro
-- de fecha o fecha y hora

-- Cuanto tiempo (en dias) ha pasado desde que el cliente realizo su ultima compra
SELECT
	customer_id,
	MIN(market_date) AS first_purchases,
    MAX(market_date) AS last_purchases,
    COUNT(DISTINCT market_date) AS count_of_purchases_dates,
    DATEDIFF(MAX(market_date), MIN(market_date)) AS days_between_first_last_purchases,
    DATEDIFF(CURDATE(), MAX(market_date)) AS days_since_last_purchases
FROM customer_purchases
GROUP BY customer_id;

-- ------------------------- funciones de ventana ------------------------------
-- Obtener los dias entre cada compra que realiza el cliente 1
SELECT
	customer_id,
    market_date,
    RANK() OVER (PARTITION BY customer_id ORDER BY market_date) AS purchases_number,
    LEAD(market_date, 1) OVER (PARTITION BY customer_id ORDER BY market_date) AS next_purchases
FROM customer_purchases
WHERE customer_id = 1;