USE ventas_jugos;

-- crear tabla
CREATE TABLE tb_facturacion(
	FECHA DATE NULL,
    VENTA_TOTAL FLOAT
);

-- mostrar valores de tabla
SELECT * FROM tb_facturacion;


-- crear tabla factura a partir de la creada
CREATE TABLE `tb_factura1` (
  `NUMERO` varchar(5) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `DNI` varchar(11) NOT NULL,
  `MATRICULA` varchar(5) NOT NULL,
  `IMPUESTO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  KEY `FK_VENDEDOR1` (`MATRICULA`),
  KEY `FK_CLIENTE1` (`DNI`),
  CONSTRAINT `FK_CLIENTE1` FOREIGN KEY (`DNI`) REFERENCES `tb_cliente` (`DNI`),
  CONSTRAINT `FK_VENDEDOR1` FOREIGN KEY (`MATRICULA`) REFERENCES `tb_vendedor` (`MATRICULA`)
);

CREATE TABLE `tb_items_facturas1` (
  `NUMERO` varchar(5) NOT NULL,
  `CODIGO` varchar(10) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`,`CODIGO`),
  KEY `FK_PRODUCTO1` (`CODIGO`),
  CONSTRAINT `FK_FACTURA1` FOREIGN KEY (`NUMERO`) REFERENCES `tb_factura` (`NUMERO`),
  CONSTRAINT `FK_PRODUCTO1` FOREIGN KEY (`CODIGO`) REFERENCES `tb_producto` (`CODIGO`)
);

-- mostrar valores de la tabla items_facturas1 y factura1
SELECT * FROM tb_items_facturas1;
SELECT * FROM tb_factura1;
SELECT * FROM tb_items_facturas;
SELECT * FROM tb_factura;

-- insertar valores a las tablas
INSERT INTO tb_factura1
VALUES('0100', '2021-01-01', '1471156710', '235', 0.10);
    
INSERT INTO tb_items_facturas1
VALUES('0100', '1002767', 100, 25.0),
	  ('0100', '1004327', 200, 25.0),
      ('0100', '1013793', 300, 25.0);
