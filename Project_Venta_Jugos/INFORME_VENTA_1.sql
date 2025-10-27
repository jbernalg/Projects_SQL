SELECT *
FROM facturas;

SELECT *
FROM items_facturas;

SELECT 
	F.DNI,
    F.FECHA_VENTA,
    IFa.CANTIDAD
FROM facturas F
INNER JOIN items_facturas IFa
	ON F.NUMERO = IFa.NUMERO;
    
SELECT 
	F.DNI,
    DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_ANO,
    IFa.CANTIDAD
FROM facturas F
INNER JOIN items_facturas IFa
	ON F.NUMERO = IFa.NUMERO;
    
/* cantidad de ventas por mes para cada cliente*/
SELECT 
	F.DNI,
    DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_ANO,
    SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA
FROM facturas F
INNER JOIN items_facturas IFa
	ON F.NUMERO = IFa.NUMERO
GROUP BY
	F.DNI, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y");
    
/* limite de ventas por cliente*/
SELECT * 
FROM tabla_de_clientes TC;   


