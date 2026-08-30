-- SUPERSTORE SALES ANALYSIS
-- SQL PORTFOLIO PROJECT
-- Tool: MySQL
-- Dataset: Superstore Sales

-- 2. Data Exploration

-- A. Dataset Overview
	SELECT
	COUNT(DISTINCT `Order ID`) AS total_orders,
	COUNT(DISTINCT `Customer ID`) AS total_customers,
	COUNT(DISTINCT `Product ID`) AS total_products,
	SUM(`Quantity`) AS total_quantity,
	ROUND(SUM(`Sales`), 2) AS total_sales,
	ROUND(SUM(`Profit`), 2) AS total_profit,
	ROUND(AVG(`Discount`)*100, 2) AS avg_discount,
	ROUND(SUM(`Profit`)/SUM(`Sales`)*100, 2) AS profit_margin
	FROM sales_superstore_clean;
    
-- B. Date Range
	SELECT
    MIN(`Order Date`) AS start_date,
    MAX(`Order Date`) AS end_date
    FROM sales_superstore_clean;
    
-- C. Categories Available
    SELECT `Category`, COUNT(*) AS total_records
    FROM sales_superstore_clean
    GROUP BY `Category`
    ORDER BY total_records DESC;
    
-- D. Regions Available
	SELECT `Region`, COUNT(*) AS total_records
    FROM sales_superstore_clean
    GROUP BY `Region`
    ORDER BY total_records DESC;

-- E. Segments Available
	SELECT `Segment`, COUNT(*) AS total_records
    FROM sales_superstore_clean
    GROUP BY `Segment`
    ORDER BY total_records DESC;
