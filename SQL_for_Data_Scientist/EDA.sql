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

-- When was the first market that was tracked in this database, and how recent is the latest data?
SELECT 
	min(market_date),
    max(market_date)
FROM vendor_inventory;

-- How many different vendors are there, and when did they each start selling at the market?
-- Which are still selling at the most recent market date?
SELECT
	vendor_id,
    min(market_date),
    max(market_date)
FROM vendor_inventory
GROUP BY vendor_id
ORDER BY min(market_date), max(market_date);

-- ------------------------------- Exploring changes over time --------------------------
-- Do most vendors sell at the market year-round, or is there a certain time of year when there are different numbers of 
-- vendors at the farmer's market?
SELECT
	EXTRACT(YEAR FROM market_date) AS market_year,
    EXTRACT(MONTH FROM market_date) AS market_month,
    COUNT(DISTINCT vendor_id) AS vendors_with_inventory
FROM vendor_inventory
GROUP BY EXTRACT(YEAR FROM market_date), EXTRACT(MONTH FROM market_date)
ORDER BY EXTRACT(YEAR FROM market_date), EXTRACT(MONTH FROM market_date); 

-- Show what a particular  vendor's inventory looks like id = 7
SELECT
	*
FROM vendor_inventory
WHERE vendor_id = 7
ORDER BY market_date, product_id;







