USE ventas_jugos;

/*seleccionar todos los registros de la tabla producto*/
SELECT * FROM tb_producto;

/*actualizar precio de un registro*/
UPDATE tb_producto SET PRECIO_LISTA = 5
WHERE CODIGO = '1000889';

/*actualizar descripcion, tamano, envase de un registro*/
UPDATE tb_producto SET 
	DESCRIPCION = 'Sabor de la montana',
    TAMANO = '1 Litro',
    ENVASE = 'Botella PET'
WHERE CODIGO = '1000889';

SELECT * FROM