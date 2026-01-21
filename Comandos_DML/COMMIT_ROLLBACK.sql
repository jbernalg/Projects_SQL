-- seleccionar BD 
USE ventas_jugos;
 
-- insertar datos en una BD
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('256',
'Fernando Ruiz',
'Oblatos',
0.1,
'2015-06-14',
0);

-- mostrar datos
SELECT * FROM tb_vendedor;

-- iniciar transaccion
START TRANSACTION;

-- insertamos nuevos registros en la BD
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('257',
'Fernando Rojas',
'Oblatos',
0.1,
'2015-06-14',
0);

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('258',
'David Rojas',
'Del Valle',
0.15,
'2015-06-14',
0);

-- actualizar datos de registros
UPDATE tb_vendedor SET COMISION = COMISION * 1.05;

-- rollback: nos lleva a la BD antes de agregar los datos
ROLLBACK;

-- commit: confirma la transaccion y sube los cambios a la BD
COMMIT;