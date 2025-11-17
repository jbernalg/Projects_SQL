
/*crear tb_producto2 a partir de tb_producto*/
CREATE TABLE `tb_producto2` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANO` varchar(50) DEFAULT NULL,
  `ENVASE` varchar(50) DEFAULT NULL,
  `PRECIO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
);

/*mostrar registros de tb_producto2*/
SELECT * FROM tb_producto2;

/*insertar registros de tb_producto en tb_producto2*/
INSERT INTO tb_producto2
SELECT * FROM tb_producto;

/*aumentar el precio de lista un 15%*/
UPDATE tb_producto2 SET PRECIO_LISTA = PRECIO_LISTA * 1.15;

/*borrar toda la tabla*/
DELETE FROM tb_producto2;
