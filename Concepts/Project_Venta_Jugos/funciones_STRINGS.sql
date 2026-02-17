USE jugos_ventas;

SELECT LTRIM("   MySQL es facil");

SELECT LTRIM("MySQL es facil    ");

SELECT TRIM("    MySQL es facil    ");

SELECT CONCAT("MySQL es facil", " No lo crees?");

SELECT UPPER("mysql es una base de datos interesante"); 

SELECT LOWER("MYSQL ES UNA BASE DE DATOS INTERESANTE");

SELECT SUBSTRING("Mysql es una base de datos interesante", 14, 4);

SELECT CONCAT(NOMBRE, " ", DNI)
FROM tabla_de_clientes;

SELECT 
	NOMBRE,
    CONCAT(DIRECCION_1, " ", BARRIO, " ", CIUDAD, " ", ESTADO) AS COMPLETO
FROM tabla_de_clientes;