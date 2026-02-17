USE jugos_ventas;

SELECT CURDATE();

SELECT CURRENT_TIMESTAMP();
 
SELECT YEAR(current_timestamp());
 
SELECT MONTH(current_timestamp());
  
SELECT DAY(current_timestamp());

SELECT MONTHNAME(current_timestamp());

SELECT DAYNAME(current_timestamp());

SELECT DATEDIFF(current_timestamp(), '2025-01-01') AS DIFERENCIA_DIAS;

SELECT current_timestamp() AS DIA_HOY,
DATE_SUB(current_timestamp(), INTERVAL 1 MONTH) AS RESULTADO;

SELECT DISTINCT 
	FECHA_VENTA,
	DAYNAME(FECHA_VENTA) AS DIA,
    MONTHNAME(FECHA_VENTA) AS MES,
    YEAR(FECHA_VENTA) AS ANO
FROM facturas;

SELECT
	NOMBRE,
    timestampdiff(YEAR, FECHA_DE_NACIMIENTO, CURDATE()) AS EDAD
FROM tabla_de_clientes;



