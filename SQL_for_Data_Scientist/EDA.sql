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
