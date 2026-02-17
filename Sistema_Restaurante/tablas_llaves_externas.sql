-- Crear tablas con llaves externas
USE restaurante_db;

-- agregar FK en productos
ALTER TABLE productos
ADD CONSTRAINT fk_categoria
FOREIGN KEY (id_categoria)
REFERENCES categorias(id_categoria);