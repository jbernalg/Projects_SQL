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