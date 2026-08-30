-- SQL PORTFOLIO PROJECT
-- Tool: MySQL
-- Dataset: Superstore Sales

-- 1. Data Cleaning & Data Quality Check
 
-- A. Data Overview

-- Check Total Rows
	SELECT COUNT(*) AS total_rows
	FROM sales_superstore_clean;

-- Check Table Structure	
	DESCRIBE sales_superstore_clean ;

-- Remove Unnecessary Column
-- MyUnknownColumn was identified as empty and removed during the cleaning process.
	ALTER TABLE sales_superstore_clean
	DROP COLUMN `MyUnknownColumn`;
    
-- B. Date Transformation

-- Order Date
	ALTER TABLE sales_superstore_clean
	ADD COLUMN `Order Date Temp` DATE;
        
	UPDATE sales_superstore_clean
	SET `Order Date Temp` = str_to_date(`order date`, '%m/%d/%Y');
    
    ALTER TABLE sales_superstore_clean
	DROP COLUMN `Order Date`;
        
	ALTER TABLE sales_superstore_clean
	CHANGE COLUMN `Order Date Temp` `Order Date` DATE;
    
-- Ship Date
	ALTER TABLE sales_superstore_clean
    ADD COLUMN `Ship Date Temp` DATE;
    
    UPDATE sales_superstore_clean
	SET `Ship Date Temp` = str_to_date(`ship date`, '%m/%d/%Y');
    
    ALTER TABLE sales_superstore_clean
	DROP COLUMN `Ship Date`;
        
	ALTER TABLE sales_superstore_clean
	CHANGE COLUMN `Ship Date Temp` `Ship Date` DATE;
    
-- C. Discount Transformation
	ALTER TABLE sales_superstore_clean
    ADD COLUMN `Discount Temp` DECIMAL (5,2);
    
    UPDATE sales_superstore_clean
	SET `Discount Temp` = CAST(REPLACE(`Discount`, '%', '') AS DECIMAL (5,2)) / 100;
    
    ALTER TABLE sales_superstore_clean
	DROP COLUMN `Discount`;
        
	ALTER TABLE sales_superstore_clean
	CHANGE COLUMN `Discount Temp` `Discount` DECIMAL (5,2);
    
-- E. Postal Code Transformation
	ALTER TABLE sales_superstore_clean
    MODIFY COLUMN `Postal Code` VARCHAR (10);
    
-- E. Data Quality Checks
 
 -- Missing Values
	SELECT
    COUNT(*) AS total_rows,
    COUNT(`Order ID`) AS filled_order_id,
    COUNT(`Order Date`) AS filled_order_date,
    COUNT(`Ship Date`) AS filled_ship_date,
    COUNT(`Customer ID`) AS filled_customer_id,
    COUNT(`Product ID`) AS filled_product_id,
    COUNT(`Sales`) AS filled_sales,
    COUNT(`Quantity`) AS filled_quantity,
    COUNT(`Discount`) AS filled_discount,
    COUNT(`Profit`) AS filled_profit
    FROM sales_superstore_clean;


-- Duplicate Checks
	SELECT `Row ID`, COUNT(*) AS duplicate_count
    FROM sales_superstore_clean
    GROUP BY `Row ID`
    HAVING COUNT(*) > 1;

-- Invalid Values
	SELECT *
    FROM sales_superstore_clean
    WHERE Quantity <= 0
    OR Discount < 0
    OR Discount > 1;
