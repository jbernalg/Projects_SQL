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

select * from productos;
select * from empleados;

-- verificar la insersion de duplicados
INSERT INTO productos (nombre, precio, id_categoria) VALUES
('Coca cola', 5000, 1);

INSERT INTO categorias (nombre) VALUES ('Bebidas');

INSERT INTO clientes (nombre, email, telefono) VALUES
('Carlos Ramirez', 'carlos@gmail.com', '3001112233');

INSERT INTO empleados (nombre, cargo, salario, fecha_contratacion) VALUES
('Laura Martinez', 'Mesero', 1500000, '2023-01-10');

-- identificar productos duplicados
select
	nombre,
    COUNT(*)
from productos
group by nombre
having count(*) > 1;

select
	nombre,
    COUNT(*)
from empleados
group by nombre
having count(*) > 1;

-- eliminar registros duplicados y conservar el mas antiguo
delete p1
from productos p1
join productos p2
ON p1.nombre = p2.nombre
AND p1.id_producto > p2.id_producto;

delete e1
from empleados e1
join empleados e2
ON e1.nombre = e2.nombre
AND e1.id_empleado > e2.id_empleado;

-- agregar restriccion unioque a la tabla productos
ALTER TABLE productos
ADD CONSTRAINT unique_nombre_producto
UNIQUE (nombre);

-- arreglar unicidad en la tabla empleados
ALTER TABLE empleados
ADD cedula VARCHAR(20);

update empleados
SET cedula = '12334455'
where id_empleado = 1;

update empleados
SET cedula = '22443366'
where id_empleado = 2;

alter table empleados modify cedula varchar(20) not null;

alter table empleados
add constraint unique_cedula_empleado
unique (cedula);
