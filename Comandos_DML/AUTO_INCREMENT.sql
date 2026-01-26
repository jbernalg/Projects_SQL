-- seleccionar BD 
USE ventas_jugos;

-- crear una tabla
CREATE TABLE tb_identificacion(
	ID INT AUTO_INCREMENT NOT NULL,
    DESCRIPCION VARCHAR(50) NULL,
    PRIMARY KEY(ID)
);

-- mostrar valores 
SELECT * FROM tb_identificacion;

-- insertar valores a la tabla
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES('Cliente B');
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES('Cliente C');
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES('Cliente D');
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES('Cliente E');

-- borrar registros con ID = 2
DELETE FROM tb_identificacion WHERE ID = 2;

-- insertar nuevo registro
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES('Cliente F');

-- borrar ultimo registro
DELETE FROM tb_identificacion WHERE ID = 7;

-- ingresar un nuevo registro
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES('Cliente G');

-- asignar valor de ID a un registro
INSERT INTO tb_identificacion(ID, DESCRIPCION)
VALUES(100, 'Cliente G');

-- insertar nuevo registro para ver continuidad del ID
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES('Cliente H');

-- asignar valor nulo al ID de un registro
INSERT INTO tb_identificacion(ID, DESCRIPCION)
VALUES(NULL, 'Cliente H');