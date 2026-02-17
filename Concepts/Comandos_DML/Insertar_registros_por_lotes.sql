USE ventas_jugos;

SELECT * FROM tb_cliente;

/*registros de la tabla_de_clientes de la BD jugos_ventas*/
SELECT * FROM jugos_ventas.tabla_de_clientes;

/*insertar registros por lotes a la BD ventas_jugos*/
SELECT
	DNI,
    NOMBRE,
    DIRECCION_1 AS DIRECCION,
    BARRIO,
    CIUDAD,
    ESTADO,
    CP,
    FECHA_DE_NACIMIENTO AS FECHA_NACIMIENTO,
    EDAD,
    SEXO,
    LIMITE_DE_CREDITO AS LIMITE_CREDITO,
    VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
    PRIMERA_COMPRA
FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);

INSERT INTO tb_cliente
SELECT
	DNI,
    NOMBRE,
    DIRECCION_1 AS DIRECCION,
    BARRIO,
    CIUDAD,
    ESTADO,
    CP,
    FECHA_DE_NACIMIENTO AS FECHA_NACIMIENTO,
    EDAD,
    SEXO,
    LIMITE_DE_CREDITO AS LIMITE_CREDITO,
    VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
    PRIMERA_COMPRA
FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);