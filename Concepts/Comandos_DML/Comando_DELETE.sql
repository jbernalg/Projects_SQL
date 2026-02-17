USE ventas_jugos;

/*insertar productos que estan es 'inclusion_productos.sql' a la BD*/
INSERT INTO tb_producto (CODIGO,DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA)
     VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
         ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
         ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
         ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
         ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
         ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
         ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
         ('1001007','Sabor Alpino','Melón','1 Litro','Botella',7.50),
         ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
         ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
         ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
         ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);
         
SELECT * FROM tb_producto WHERE DESCRIPCION = 'Sabor Alpino';

/*Eliminar un registro*/
DELETE FROM tb_producto
WHERE CODIGO = '1001000';

/*eliminar registros con envase de 1 litro*/
DELETE FROM tb_producto
WHERE TAMANO = '1 Litro';

/*seleccionar los codigos de los productos de la BD 'ventas_jugos'*/
SELECT CODIGO_DEL_PRODUCTO 
FROM jugos_ventas.tabla_de_productos;

/*seleccionar registros con los codigos de tb_producto de la BD ventas_jugos
que no esten en la BD jugos_ventas
*/
SELECT CODIGO
FROM tb_producto
WHERE CODIGO NOT IN (
	SELECT CODIGO_DEL_PRODUCTO 
	FROM jugos_ventas.tabla_de_productos
	);

/*eliminar registros previamente encontrado para sincronizar las tablas*/
DELETE FROM tb_producto
WHERE CODIGO NOT IN (
	SELECT CODIGO_DEL_PRODUCTO 
	FROM jugos_ventas.tabla_de_productos
	);
    
