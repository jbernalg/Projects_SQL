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
    F.FECHA_VENTA,
    IFa.CANTIDAD
FROM facturas F
INNER JOIN items_facturas IFa
	ON F.NUMERO = IFa.NUMERO;