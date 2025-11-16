USE ventas_jugos;

/*obtener los registros de la tabla vendedor*/
SELECT * FROM tb_vendedor;

/*seleccionar los registros de la tabla de vendedores de la BD jugos_ventas*/
SELECT * FROM jugos_ventas.tabla_de_vendedores;

/*obtener los valores de vacaciones de 'tabla_de_vendedores'*/
SELECT * FROM tb_vendedor A
INNER JOIN jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA, 3,3);

UPDATE tb_vendedor A
INNER JOIN jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA, 3,3)
SET A.DE_VACACIONES = B.VACACIONES;
