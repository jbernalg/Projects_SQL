-- insertamos datos basicos de clientes, productos y empleados

USE restaurante_db;

-- datos de categoria
INSERT INTO categorias (nombre) VALUES
('Bebidas'),
('Entradas'),
('Platos fuertes'),
('Postres');

-- datos de productos
INSERT INTO productos (nombre, precio, id_categoria) VALUES
('Coca cola', 5000, 1),
('Jugo Natural', 7000, 1),
('Nachos', 12000, 2),
('Hamburguesa', 25000, 3),
('Pizza', 30000, 3),
('Cheesecake', 15000, 4);

-- datos de clientes
INSERT INTO clientes (nombre, email, telefono) VALUES
('Carlos Ramirez', 'carlos@gmail.com', '3001112233'),
('Ana Torres', 'ana@gmail.com', '3002223344'),
('Luis Gomez', 'luis@gmail.com', '3003334455');

-- datos de empleados
INSERT INTO empleados (nombre, cargo, salario, fecha_contratacion) VALUES
('Laura Martinez', 'Mesero', 1500000, '2023-01-10'),
('Pedro Lopez', 'Mesero', 1500000, '2023-02-15');