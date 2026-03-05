USE restaurante_db;

-- insertar relacion en pedidos
INSERT INTO pedidos (id_cliente, id_empleado, total)
VALUES (1, 1, 55000);

-- insertar datos en detalles_pedido
INSERT INTO  detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario)
VALUES 
	(1, 4, 1, 25000),
    (1, 1, 2, 5000),
    (1, 6, 1, 15000);
    
select * from pedidos;
select * from detalle_pedido;
select * from clientes;
select * from productos;
select * from empleados;

-- actualizar estado del pedido
update pedidos 
set estado = 'pagado'
where id_pedido = 1;

-- borrado logico de un cliente
update clientes
set activo = 0
where id_cliente = 3;

-- Mostrar productos con precio mayor a 20000
SELECT * FROM productos
WHERE precio > 20000;

-- mostrar total vendido
select 
	SUM(total) as ventas_totales
from pedidos
where estado = 'pagado';

-- mostrar promedio de precios
select 
	AVG(precio)
from productos;


-- ----- insertar mas pedidos   -------------------
INSERT INTO pedidos (id_cliente, id_empleado, total)
VALUES (1, 2, 0);

INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario)
VALUES 
	(2, 4, 1, 25000),
    (2, 1, 2, 5000);
    
UPDATE pedidos
SET total = (
	SELECT SUM(cantidad * precio_unitario)
    FROM detalle_pedido
    WHERE id_pedido = 3
    )
WHERE id_pedido = 3;

INSERT INTO pedidos (id_cliente, id_empleado, total)
VALUES (1, 2, 0);

INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario)
VALUES
(3, 5, 1, 30000), -- Pizza
(3, 6, 1, 15000); -- Cheesecake

UPDATE pedidos
SET total = (
	SELECT SUM(cantidad * precio_unitario)
    FROM detalle_pedido
    WHERE id_pedido = 3
    )
WHERE id_pedido = 3;


INSERT INTO pedidos (id_cliente, id_empleado, total)
VALUES (2, 1, 0);

INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario)
VALUES
(6, 4, 1, 25000), -- 4 Hamburguesas
(6, 6, 1, 15000); -- 1 Cheesecake

UPDATE pedidos
SET total = (
	SELECT SUM(cantidad * precio_unitario)
    FROM detalle_pedido
    WHERE id_pedido = 6
    )
WHERE id_pedido = 6;



INSERT INTO pedidos (id_cliente, id_empleado, total)
VALUES (3, 2, 0);

INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario)
VALUES
(10, 3, 3, 12000), -- 4 nachos
(10, 2, 3, 7000), -- 2 jugos naturales
(10, 5, 1, 30000); -- 1 pizza

UPDATE pedidos
SET total = (
	SELECT SUM(cantidad * precio_unitario)
    FROM detalle_pedido
    WHERE id_pedido = 10
    )
WHERE id_pedido = 10;

-- Eliminar registros en Pedidos
DELETE FROM Pedidos WHERE id_pedido = 5;
DELETE FROM Pedidos WHERE id_pedido = 4;
