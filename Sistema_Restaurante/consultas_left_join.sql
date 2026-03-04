USE restaurante_db;

-- obtener pedidos con nombre del cliente
SELECT 
	p.id_pedido,
    c.nombre AS cliente,
    p.total
FROM pedidos p
LEFT JOIN clientes c
ON p.id_cliente = c.id_cliente;

-- obtener todos los pedidos de los clientes con el respectivo empleado que los atendio,
-- los productos, la cantidad y el precio
SELECT
	p.id_pedido,
    c.nombre AS cliente,
    e.nombre AS empleado,
    pr.nombre AS producto,
    dp.cantidad,
    dp.precio_unitario
FROM pedidos AS p
LEFT JOIN clientes c
	ON p.id_cliente = c.id_cliente
LEFT JOIN empleados e 
	ON p.id_empleado = e.id_empleado
LEFT JOIN detalle_pedido dp 
	ON p.id_pedido = dp.id_pedido
LEFT JOIN productos as pr
	ON dp.id_producto = pr.id_producto;

SELECT * FROM detalle_pedido;