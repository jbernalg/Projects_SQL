-- crear la tabla fabricante
CREATE TABLE  fabricante(
condigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

-- crear la tabla producto
CREATE TABLE  producto(
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
codigo_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(condigo)
);

-- insertar valores a las tablas
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT * FROM fabricante;
SELECT * FROM producto;

-- Lista el nombre de todos los productos que hay en la tabla producto
SELECT nombre FROM producto;

-- Lista los nombres y los precios de todos los productos  de la tabla producto
SELECT nombre, precio FROM producto;

-- Lista todas las columnas de la tabla producto
SELECT * FROM producto;

-- obtener el nombres de los productos cuyo precio sea menor o igual a 200
SELECT nombre FROM producto
WHERE precio <= 120;

-- obtener todos los datos de los productos cuyo precio este entre 60 y 120 
SELECT * FROM producto
WHERE precio >= 60 AND precio <= 120;

SELECT * FROM producto
WHERE precio BETWEEN 60 AND 120;

-- obtener el nombre y el precio multiplicado por 160. La columna debe presentarse como precio_total
SELECT nombre, precio*160 AS precio_total
FROM producto;

-- Seleccionar el precio medio de todos los productos
SELECT AVG(precio)
FROM producto;

-- obtener el precio medio de los articulos cuyo codigo de fabricante sea 2
SELECT AVG(precio)
FROM producto
WHERE codigo_fabricante = 2;

-- obtener el numero de productos cuyo precio sea mayor o igual a 180 
SELECT COUNT(*)
FROM producto
WHERE precio >= 180;

-- obtener el nombre y precio de los productos cuyo precio sea mayor o igual a 180 y 
-- ordenarlos descendentementes por precio
SELECT nombre, precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC; 

-- ordenarlos ascendentemente por nombre
SELECT nombre, precio
FROM producto
WHERE precio >= 180
ORDER BY nombre;

-- obtener un listado completo de productos, incluyendo por cada producto los datos del producto
-- y su fabricante
SELECT * FROM fabricante, producto;
-- inner join implicito
SELECT * 
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.condigo;

-- inner join explicito
SELECT *
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.condigo;

--  obtener un listado de productos, incluyendo el nombre del articulo, su precio y el nombre del fabricante
SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.condigo;

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.condigo;

-- obtener el precio medio de los productos de cada fabricante, mostrando solo los codigos del fabricante
SELECT AVG(precio), codigo_fabricante
FROM producto
GROUP BY codigo_fabricante;

-- obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante
SELECT AVG(precio), fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.condigo
GROUP BY fabricante.nombre;

SELECT AVG(precio), fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.condigo
GROUP BY fabricante.nombre;

-- obtener los nombres de los fabricantes que ofrezcan producto cuyo precio medio sea mayor o igual
-- a 150. Indicar el precio medio
SELECT AVG(precio), fabricante.nombre
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.condigo
GROUP BY fabricante.nombre
HAVING AVG(precio) >= 150;

SELECT AVG(precio), fabricante.nombre
FROM producto INNER JOIN fabricante
ON producto.codigo_fabricante = fabricante.condigo
GROUP BY fabricante.nombre
HAVING AVG(precio) >= 150;

-- obtener el nombre y precio del producto mas barato
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto); 

-- obtener una lista con el nombre y el precio de los articulos mas caros de cada proveedor. Incluye el nombre del proveedor
SELECT P.nombre, P.precio, F.nombre
FROM producto P, fabricante F
WHERE P.codigo_fabricante = F.condigo
AND P.precio = (SELECT MAX(P.precio)
				FROM producto P
                WHERE P.codigo_fabricante = F.condigo);
                
SELECT P.nombre, P.precio, F.nombre
FROM producto P INNER JOIN fabricante F
ON P.codigo_fabricante = F.condigo
AND P.precio = (SELECT MAX(P.precio)
				FROM producto P
                WHERE P.codigo_fabricante = F.condigo);

-- añadir un nuevo producto: Altaoves de 0 (fabricante 2)
INSERT INTO producto(nombre, precio, codigo_fabricante)
VALUES('Altavoces', 0, 2);

-- corregir precio del producto: Altavoces 70
UPDATE producto
SET precio = 70
WHERE codigo = 12;

-- cambiar el nombre del producto 8 a impresora laser
UPDATE producto
SET nombre = 'Impresoa Laser'
WHERE codigo = 8;

-- DESABILITAR EL MODO SEGURO DE MYSQL: 0 PARA DESABILITAR. 1 PARA HABILITAR
SET SQL_SAFE_UPDATES = 0;
-- -------------------------------------------------------------------------

-- aplicar un 10% de decuento a todos los productos
UPDATE producto
SET precio = precio * 0.9;

-- aplicar un descuento de 10 a todos los productos cuyo precio sea mayor o igual a 120
UPDATE producto
SET precio = precio - 10
WHERE precio >= 120;

-- borrar el producto de codigo 6
DELETE FROM producto
WHERE codigo = 6;

SELECT * FROM producto; 


