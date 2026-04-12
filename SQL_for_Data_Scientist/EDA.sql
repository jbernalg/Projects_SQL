USE farmers_market;

-- show everything of the product table
SELECT * FROM product
LIMIT 10;

-- verify that product_id is the primary key (granularity)
SELECT 
	product_id,
    COUNT(*)
FROM product
GROUP BY product_id
HAVING COUNT(*) > 1;

-- show everything of the product_category table
SELECT * FROM product_category;

-- How many different products are there in the catalog?
SELECT COUNT(*) FROM product;