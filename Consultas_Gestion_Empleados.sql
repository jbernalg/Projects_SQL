-- eliminar base de datos con nombre empleados si existe
DROP DATABASE IF EXISTS empleados;

-- crear base de datos
CREATE DATABASE empleados CHARACTER SET utf8mb4;

-- Seleccionar la bd empleados
USE empleados;

-- Crear tabla departamento
CREATE TABLE departamento (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

-- Crear tabla empleado
CREATE TABLE empleado (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  codigo_departamento INT UNSIGNED,
  FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

-- Insertar valores a la tabla departamento
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

-- insertar valores en la tabla empleado
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

-- obtener el primer apellido de los empleados
SELECT apellido1 FROM empleado;

-- obtener el primer apellido de los empleado desechando los repetidos
SELECT DISTINCT apellido1
FROM empleado; 

-- obtener todos los datos de los empleados que se apellidan Ruiz
SELECT * 
FROM empleado
WHERE apellido1 = 'Ruiz';

-- obtener todos los datos de los empleado que se apellidan Ruiz  y López
SELECT *
FROM empleado
WHERE apellido1 = 'Ruiz' OR apellido2 = 'López';

SELECT *
FROM empleado
WHERE apellido1 IN ('Ruiz', 'López') OR apellido2 IN ('Ruiz', 'López');

-- obtener todos los datos de los empleado que trabajan en el departamento 1
SELECT * 
FROM empleado
WHERE codigo_departamento = 1;

-- obtener todos los datos de los empleado que trabajan para el departemento 1 y 4
SELECT *
FROM empleado
WHERE codigo_departamento = 1 OR codigo_departamento = 4;

SELECT *
FROM empleado
WHERE codigo_departamento IN (1, 4);

-- obtener todos los datos de los empleados cuyo apellido comiencen por R
SELECT *
FROM empleado
WHERE apellido1 LIKE 'R%' OR apellido2 LIKE 'R%';

-- obtener el presupuesto total de todos los departamentos
SELECT * FROM departamento;

SELECT SUM(presupuesto) AS presupuesto_total
FROM departamento;

-- obtener el numero de empleados de cada departamento
SELECT * FROM empleado;

SELECT departamento.nombre, COUNT(*)
FROM empleado, departamento
WHERE empleado.codigo_departamento = departamento.codigo 
GROUP BY codigo_departamento;

-- obtener un listado completo de empleados incluyendo por cada empleado los datos del empleado y de su departamento
SELECT *
FROM empleado INNER JOIN departamento
ON empleado.codigo_departamento = departamento.codigo;

-- obtener un listado completo de empleados incluyendo el nombre y apellido del empleado junto al nombre y presupuesto
-- de su departamento
SELECT E.nombre, E.apellido1, E.apellido2, D.nombre, presupuesto
FROM empleado E INNER JOIN departamento D
ON E.codigo_departamento = D.codigo;

-- obtener los nombres y apellidos de los empleados que trabajn en departamentos cuyo presupuesto sea mayor de 6000
SELECT * FROM departamento;

SELECT E.nombre, E.apellido1, E.apellido2 
FROM empleado E INNER JOIN departamento D
ON E.codigo_departamento = D.codigo
AND D.presupuesto > 6000;

SELECT nombre apellido1, apellido2
FROM empleado
WHERE codigo_departamento IN (SELECT codigo
						FROM departamento
                        WHERE presupuesto > 6000);

-- obtener los datos de los departamentos cuyo presupuesto sea mayor al presupuesto medio de todos los departamentos
SELECT *
FROM departamento
WHERE presupuesto > (SELECT AVG(presupuesto)
					FROM departamento);
                    
-- obtener los nombres de los departamentos que tienen mas de dos empleados
SELECT nombre
FROM departamento
WHERE codigo IN (SELECT codigo_departamento
				 FROM empleado
                 GROUP BY codigo_departamento
                 HAVING COUNT(*) > 2);
                 
SELECT D.nombre
FROM empleado E INNER JOIN departamento D
ON E.codigo_departamento = D.codigo
GROUP BY D.nombre
HAVING COUNT(*) > 2;

-- añadir un nuevo departamento 'Calidad' con presupuesto de 40000 y codigo 11
-- añadir un empleado vinculado al departamento recien creado: Eshter Vasquez Diaz. DNI 89267109
SELECT * FROM departamento;
INSERT INTO departamento VALUES(11, 'Calidad', 40000, 20000);

SELECT * FROM empleado;
INSERT INTO empleado VALUES(14,'89267109','Esther', 'Vasquez', 'Diaz', 11);

-- aplicar un recorte presupuestario de 10% a todos los departamentos
-- DESABILITAR EL MODO SEGURO
SET SQL_SAFE_UPDATES = 0;

UPDATE departamento
SET presupuesto = presupuesto*0.9;

-- reasignar a los empleados del departamento de desarrollo al departamento de sistema
SELECT * FROM empleado;

UPDATE empleado
SET codigo_departamento = 2
WHERE codigo_departamento = 1;







