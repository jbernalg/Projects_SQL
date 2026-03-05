USE restaurante_db;

select * from productos;
select * from detalle_pedido;
select * from pedidos;
select * from empleados;

-- Cual es el producto mas vendido?
SELECT
	pr.nombre AS producto,
    SUM(dp.cantidad) AS total_vendido
FROM detalle_pedido dp
LEFT JOIN productos pr 
	ON dp.id_producto = pr.id_producto
GROUP BY pr.nombre
ORDER BY total_vendido DESC
LIMIT 1;

-- Cuanto ha vendido cada empleado?
SELECT
	e.nombre AS empleado,
    SUM(p.total) AS total_vendido
FROM pedidos p 
LEFT JOIN empleados e 
	ON p.id_empleado = e.id_empleado
GROUP BY e.nombre
ORDER BY total_vendido DESC;

-- Cual es el cliente que mas dinero ha gastado?
SELECT
	c.nombre AS cliente,
    SUM(p.total) AS total_gastado
FROM pedidos p 
LEFT JOIN clientes c 
	ON p.id_cliente = c.id_cliente
GROUP BY c.nombre
ORDER BY total_gastado DESC
LIMIT 1;
