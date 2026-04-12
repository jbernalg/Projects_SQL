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

-- How many products are there per product category?
SELECT
	pc.product_category_id,
    pc.product_category_name,
    COUNT(product_id) AS count_of_products
FROM product_category AS pc
LEFT JOIN product AS p
	ON pc.product_category_id = p.product_category_id
GROUP BY pc.product_category_id;

-- What is in the product_qty_type field and how many different quantity types are there?
SELECT DISTINCT product_qty_type FROM product;

-- show values of the vendor_inventory table
SELECT * FROM vendor_inventory
LIMIT 10;

-- verify that market_date, vendor_id and product_id are primary keys
SELECT 
	market_date,
    vendor_id,
    product_id,
    COUNT(*)
FROM vendor_inventory
GROUP BY market_date, vendor_id, product_id
HAVING COUNT(*) > 1;