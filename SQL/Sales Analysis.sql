-- SUPERSTORE SALES ANALYSIS
-- SQL PORTFOLIO PROJECT
-- Tool: MySQL
-- Dataset: Superstore Sales

-- 3. Sales Analysis

-- 3.1 Sales Analysis

-- A. Sales by Category
	SELECT `Category`, ROUND(SUM(`Sales`), 2) AS total_sales
    FROM sales_superstore_clean
    GROUP BY `Category`
    ORDER BY total_sales DESC;
    
-- B. Sales & Profit by Region
	SELECT
    `Region`,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`),2) AS total_profit
    FROM sales_superstore_clean
    GROUP BY `Region`
    ORDER BY total_sales DESC;
    
   -- C. Top 10 Products by Sales
	SELECT `Product Name`, ROUND(SUM(`Sales`), 2) AS total_sales
    FROM sales_superstore_clean
    GROUP BY `Product Name`
    ORDER BY total_sales DESC
    LIMIT 10;
   
-- 3.2 Profit Analysis

-- A. Profit by Sub-Category
	SELECT `Sub-Category`, ROUND(SUM(`Profit`),2) AS total_profit
    FROM sales_superstore_clean
    GROUP BY `Sub-Category`
    ORDER BY total_profit DESC;
    
-- B. Loss Making Sub-Categories
	SELECT `Sub-Category`, ROUND(SUM(`Profit`),2) AS total_profit
    FROM sales_superstore_clean
    GROUP BY `Sub-Category`
    HAVING SUM(`Profit`) < 0
    ORDER BY total_profit;
    
-- 3.3 Customer Analysis

-- A. Top 10 Customers by Sales
	SELECT `Customer Name`, ROUND(SUM(`Sales`), 2) AS total_sales
    FROM sales_superstore_clean
    GROUP BY `Customer Name`
    ORDER BY total_sales DESC
    LIMIT 10;
    
-- B. Top 10 Customers by Profit
	SELECT `Customer Name`, ROUND(SUM(`Profit`), 2) AS total_profit
    FROM sales_superstore_clean
    GROUP BY `Customer Name`
    ORDER BY total_profit DESC
    LIMIT 10;
    
-- 3.4 Product Analysis

-- Top 10 Products by Profit
	SELECT `Product Name`, ROUND(SUM(`Profit`), 2) AS total_profit
    FROM sales_superstore_clean
    GROUP BY `Product Name`
    ORDER BY total_profit DESC
    LIMIT 10;
    
-- 3.5 Discount Analysis

-- A. Discount vs Sales & Profit
	SELECT `Discount`,
    ROUND(SUM(`Sales`),2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
    FROM sales_superstore_clean
    GROUP BY `Discount`
    ORDER BY `Discount`;
    
-- B. Profit by Discount Level
	SELECT
    CASE WHEN `Discount` = 0 THEN 'No Discount'
		 WHEN `Discount` <= 0.20 THEN 'Low Discount'
         WHEN `Discount` <= 0.40 THEN 'Medium Discount'
         ELSE 'High Discount'
	END AS discount_level,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
    FROM sales_superstore_clean
    GROUP BY discount_level
    ORDER BY total_profit DESC;
    
-- 3.6 Time Analysis

-- A. Sales by Year
	SELECT
    YEAR(`Order Date`) AS year,
    ROUND(SUM(`Sales`), 2) AS total_sales
    FROM sales_superstore_clean
    GROUP BY YEAR(`Order Date`)
    ORDER BY year;

-- B. Monthly Sales & Profit Trend
	SELECT
    YEAR(`Order Date`) AS year,
    MONTH(`Order Date`) AS month,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
    FROM sales_superstore_clean
    GROUP BY YEAR(`Order Date`), MONTH(`Order Date`)
    ORDER BY year, month;
