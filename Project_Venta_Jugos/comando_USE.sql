SELECT *
FROM tabla_de_productos;

SELECT 
	NOMBRE_DEL_PRODUCTO,
    PRECIO_DE_LISTA,
    CASE
		WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
        WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Asequible'
        ELSE 'Barato'
	END AS PRECIO
FROM tabla_de_productos;

SELECT 
	ENVASE,
    SABOR,
    CASE
		WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
        WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Asequible'
        ELSE 'Barato'
	END AS PRECIO,
    MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO
FROM tabla_de_productos
WHERE TAMANO = '700 ml'
GROUP BY 
CASE
	WHEN PRECIO_DE_LISTA >= 12 THEN 'Costoso'
	WHEN PRECIO_DE_LISTA >= 5 AND PRECIO_DE_LISTA < 12 THEN 'Asequible'
	ELSE 'Barato'
END
ORDER BY ENVASE;


SELECT 
	NOMBRE,
	CASE 
		WHEN YEAR(fecha_de_nacimiento) < 1990 THEN 'Viejos'
		WHEN YEAR(fecha_de_nacimiento) >= 1990 
		AND YEAR(fecha_de_nacimiento) <= 1995 THEN 'Jóvenes' 
		ELSE 'Niños' 
	END AS CLASIFICACION_EDAD
FROM tabla_de_clientes;