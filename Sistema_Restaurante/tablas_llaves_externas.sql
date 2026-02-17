-- Crear tablas con llaves externas
USE restaurante_db;

-- agregar FK en productos
ALTER TABLE productos
ADD CONSTRAINT fk_categoria
FOREIGN KEY (id_categoria)
REFERENCES categorias(id_categoria);

CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_empleado INT,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(30) DEFAULT 'pendiente',
    total DECIMAL(10,2),
    activo TINYINT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);