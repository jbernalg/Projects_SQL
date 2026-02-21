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