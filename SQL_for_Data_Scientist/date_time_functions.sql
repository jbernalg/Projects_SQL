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

-- ----------- Funciones de fecha en resumenes agregados y funciones de ventana ------------
-- obtener los registros de detalle de compra de cada cliente, en este caso, para el cliente 1
SELECT
	customer_id,
    market_date
FROM customer_purchases
WHERE customer_id = 1;


