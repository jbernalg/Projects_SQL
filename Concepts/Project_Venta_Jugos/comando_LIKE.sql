USE jugos_ventas;

SELECT * 
FROM tabla_de_productos
WHERE SABOR LIKE '%manzana'; 

SELECT * 
FROM tabla_de_productos
WHERE SABOR LIKE '%manzana'
	AND ENVASE = 'Botella PET';
    
SELECT *
FROM tabla_de_clientes
WHERE NOMBRE LIKE '%ez';