USE ventas_jugos;

-- crear una tabla
CREATE TABLE tb_default(
	ID INT AUTO_INCREMENT,
    DESCRIPCION VARCHAR(50) NOT NULL,
    DIRECCION VARCHAR(100) NULL,
    CIUDAD VARCHAR(50) DEFAULT 'Monterrey',
    FECHA_CREACION TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY(ID)
);

-- insertar registro a la tabla
INSERT INTO tb_default
(DESCRIPCION, DIRECCION, CIUDAD, FECHA_CREACION)
VALUES ('Cliente X', 'Calle Sol 525', 'Cancun', '2026-01-05');

-- mostrar valores de la tabla
SELECT * FROM tb_default;

-- insertar registros con informacion en algunos campos
INSERT INTO tb_default
(DESCRIPCION)
VALUES ('Cliente Y');