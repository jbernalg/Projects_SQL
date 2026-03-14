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