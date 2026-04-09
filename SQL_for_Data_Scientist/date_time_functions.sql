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

