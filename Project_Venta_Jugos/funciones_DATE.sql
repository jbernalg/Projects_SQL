USE jugos_ventas;

SELECT CURDATE();

SELECT CURRENT_TIMESTAMP();
 
SELECT YEAR(current_timestamp());
 
SELECT MONTH(current_timestamp());
  
SELECT DAY(current_timestamp());

SELECT MONTHNAME(current_timestamp());

SELECT DAYNAME(current_timestamp());

SELECT DATEDIFF(current_timestamp(), '2025-01-01');