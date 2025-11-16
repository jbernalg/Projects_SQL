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

/*seleccionar todos los registros de la tabla cliente*/
SELECT * FROM tb_cliente;

/*actualizar los valores de un campo*/
UPDATE tb_cliente SET VOLUMEN_COMPRA = VOLUMEN_COMPRA/10;
