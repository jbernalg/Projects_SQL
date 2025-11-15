USE ventas_jugos;

/*insertar un registro en una tabla*/
INSERT INTO tb_producto(
	CODIGO, DESCRIPCION, SABOR, 
    TAMANO, ENVASE, PRECIO_LISTA
)
VALUES (
	'1040107','Light','Sandia',
    '350 ml','Lata',4.56
);

/*mostrar registro*/
SELECT * FROM tb_producto;

/*Respetar correspondencia entre los campos y sus valores*/
INSERT INTO tb_producto(
	CODIGO, SABOR, DESCRIPCION,
    TAMANO, ENVASE, PRECIO_LISTA
)
VALUES (
	'1040108','Guanabana', 'Light',
    '350 ml','Lata',4.00
);

/*insertar varios registros (conservar correspondencia de valores)*/
INSERT INTO tb_producto VALUES
	('1040109','Light','Asai','350 ml','Lata',5.60),
    ('1040110','Light','Manzana','350 ml','Lata',6.00),
    ('1040111','Light','Mango','350 ml','Lata',3.50);