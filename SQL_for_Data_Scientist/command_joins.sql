USE farmers_market;

-- ------------- LEFT JOIN ------------------------
-- Obtener todos los productos con su respectiva categoria
SELECT *
FROM product
LEFT JOIN product_category
	ON product.product_category_id = product_category.product_category_id;
    
-- obtener algunos campo de todos los registros con su respectiva categoria
SELECT
	pr.product_id,
    pr.product_name,
    pr.product_category_id AS product_prod_cat_id,
    cat.product_category_id AS category_prod_cat_id,
    cat.product_category_name
FROM product pr
LEFT JOIN product_category cat
	ON pr.product_category_id = cat.product_category_id;
    
-- obtener una lista de los clientes y su compra asociada, si las hay
SELECT *
FROM customer AS c
LEFT JOIN customer_purchases AS cp
	ON c.customer_id = cp.customer_id;
    
-- obtener los clientes que no han registrado la primera compra
SELECT c.*
FROM customer AS c
LEFT JOIN customer_purchases AS cp
	ON c.customer_id = cp.customer_id
WHERE cp.customer_id IS NULL;
  
  
-- -------------- RIGHT JOIN ----------------------
-- Obtener todas las categorias con sus respectivos productos
SELECT
	pr.product_id,
    pr.product_name,
    pr.product_category_id AS product_prod_cat_id,
    cat.product_category_id AS category_prod_cat_id,
    cat.product_category_name
FROM product pr
RIGHT JOIN product_category cat
	ON pr.product_category_id = cat.product_category_id;
    
-- listar todas las compras y los clientes asociados con ella
SELECT *
FROM customer AS  c
RIGHT JOIN customer_purchases AS cp
	ON c.customer_id = cp.customer_id;
    

-- ------------------ INNER JOIN -----------------------
-- obtener todos los productos que esten dentro de una categoria
SELECT
	pr.product_id,
    pr.product_name,
    pr.product_category_id AS product_prod_cat_id,
    cat.product_category_id AS category_prod_cat_id,
    cat.product_category_name
FROM product pr
INNER JOIN product_category cat
	ON pr.product_category_id = cat.product_category_id;
    
-- ------------ Error comun al filtrar datos combinados ----------------
-- obtener los cliente junto a su respectiva fecha de compra
-- esta consulta pierda informacion acerca de los clientes que nunca han comprado
SELECT
	c.*,
    cp.market_date
FROM customer As c
LEFT JOIN customer_purchases AS cp
	ON c.customer_id = cp.customer_id
WHERE cp.market_date <> '2019-03-02';

-- contiene a todos los clientes incluso a aquellos que no han comprado
-- esta consulta tiene un registro por cada articulo comprado
SELECT 
	c.*,
    cp.market_date
FROM customer AS c
LEFT JOIN customer_purchases AS cp
	ON c.customer_id = cp.customer_id
WHERE (cp.market_date <> '2019-03-02' OR cp.market_date IS NULL); 

-- lista de clientes tanto los que han comprado como los que no
SELECT DISTINCT c.*
FROM customer AS c
LEFT JOIN customer_purchases AS cp
	ON c.customer_id = cp.customer_id
WHERE (cp.market_date <> '2019-03-02' OR cp.market_date IS NULL); 

-- ------------- JOINs con multiples tablas ------------------------------
-- obtener informacion acerca de los puestos y su asignacion a cada vendedor para cada fecha
-- ademas, agregar tanto los asignados como no asignados a proveedores
SELECT
	b.booth_number,
    b.booth_type,
    vba.market_date,
    v.vendor_id,
    v.vendor_name,
    v.vendor_type
FROM booth AS b
LEFT JOIN vendor_booth_assignments AS vba
	ON b.booth_number = vba.booth_number
LEFT JOIN vendor AS v
	ON v.vendor_id = vba.vendor_id
ORDER BY b.booth_number, vba.market_date;

-- -------------------- Exercices -----------------------------------

-- Escribe una consulta que haga un INNER JOIN de la tabla vendor con la tabla 
-- vendor_booth_assignments en el campo vendor_id que ambas tienen en común, 
-- y ordena el resultado por vendor_name, luego por market_date.
SELECT
	v.*,
    vba.*
FROM vendor_booth_assignments AS vba
INNER JOIN vendor AS v
	ON vba.vendor_id = v.vendor_id
ORDER BY vendor_name, market_date;


