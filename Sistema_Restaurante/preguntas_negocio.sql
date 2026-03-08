USE restaurante_db;

select * from productos;
select * from detalle_pedido;
select * from pedidos;
select * from empleados;
select * from categorias;

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

-- Cuantos pedidos hay por estado?
SELECT
	estado,
    COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY estado;

-- Que categoria genera mas ingresos?
SELECT
	c.nombre AS categoria,
    SUM(dp.cantidad * dp.precio_unitario) AS ingresos
FROM detalle_pedido dp
LEFT JOIN productos pr 
	ON dp.id_producto = pr.id_producto
LEFT JOIN categorias c 
	ON pr.id_categoria = c.id_categoria
GROUP BY c.nombre
ORDER BY ingresos DESC
LIMIT 1;

-- Ticket promedio por pedido
SELECT
	ROUND(AVG(total),2) AS ticket_promedio
FROM pedidos;

-- Cuales productos nunca se han vendido?
SELECT
	pr.nombre
FROM productos pr
LEFT JOIN detalle_pedido dp
	ON pr.id_producto = dp.id_producto
WHERE dp.id_producto IS NULL;

-- Cuanto se vendio por dia?
SELECT
	DATE(fecha_pedido) AS fecha,
    SUM(total) AS ventas_del_dia
FROM pedidos
GROUP BY fecha
ORDER BY fecha;

-- Cuantos clientes activo hay?
SELECT
	COUNT(DISTINCT id_cliente) AS clientes_activos
FROM pedidos
WHERE activo = 1;

-- Que mes tuvo mas ventas?
SELECT
	MONTH(fecha_pedido) AS mes,
    SUM(total) AS ventas
FROM pedidos
GROUP BY mes
ORDER BY ventas DESC
LIMIT 1;

-- Cual es el valor promedio de pedido por cliente?
SELECT
	c.nombre AS cliente,
    ROUND(AVG(p.total),2) AS ticket_promedio_cliente
FROM pedidos p 
LEFT JOIN clientes c 
	ON p.id_cliente = c.id_cliente
GROUP BY c.nombre
ORDER BY ticket_promedio_cliente DESC;




