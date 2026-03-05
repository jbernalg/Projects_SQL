USE restaurante_db;

select * from productos;
select * from detalle_pedido;

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