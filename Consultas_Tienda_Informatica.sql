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