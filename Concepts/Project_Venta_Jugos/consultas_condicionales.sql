SELECT *
FROM tabla_de_productos;

SELECT *
FROM tabla_de_productos
WHERE SABOR = 'mango' AND TAMANO='470 ml';

SELECT *
FROM tabla_de_productos
WHERE SABOR = 'mango' OR TAMANO='470 ml';

SELECT *
FROM tabla_de_productos
WHERE NOT (SABOR = 'mango') OR TAMANO='470 ml';

SELECT *
FROM tabla_de_productos
WHERE NOT (SABOR = 'mango' OR TAMANO='470 ml');

SELECT *
FROM tabla_de_productos
WHERE SABOR IN ('MANGO','UVA');

SELECT *
FROM tabla_de_productos
WHERE SABOR = 'MANGO' OR SABOR = 'UVA';

SELECT *
FROM tabla_de_clientes
WHERE CIUDAD IN ('ciudad de Mexico', 'Guadalajara')
	AND EDAD > 21;

SELECT *
FROM tabla_de_clientes
WHERE CIUDAD IN ('ciudad de Mexico', 'Guadalajara')
	AND EDAD BETWEEN 21 AND 25;    

