USE ventas_jugos;

/*obtener los registros de una tabla de un BD especifica*/
SELECT * FROM jugos_ventas.tabla_de_productos;

SELECT 
	CODIGO_DEL_PRODUCTO AS CODIGO, 
    NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
    SABOR,
    TAMANO,
    ENVASE,
    PRECIO_DE_LISTA AS PRECIO_LISTA
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

/*agregar registros de una BD a otra*/
INSERT INTO tb_producto
SELECT 
	CODIGO_DEL_PRODUCTO AS CODIGO, 
    NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
    SABOR,
    TAMANO,
    ENVASE,
    PRECIO_DE_LISTA AS PRECIO_LISTA
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

SELECT * FROM tb_producto;