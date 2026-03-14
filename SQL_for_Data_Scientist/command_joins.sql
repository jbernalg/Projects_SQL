USE farmers_market;

-- ------------- LEFT JOIN ------------------------
-- Obtener todos los productos con su respectiva categoria
SELECT *
FROM product
LEFT JOIN product_category
	ON product.product_category_id = product_category.product_category_id;