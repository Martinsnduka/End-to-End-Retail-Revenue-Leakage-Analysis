USE Retail_db

SELECT * FROM Retail_db..Fact_sales;


-- What is the total sales 
SELECT
SUM(sales) AS Total_sales
FROM Retail_db..Fact_sales;

-- Find how many items sold
SELECT
SUM(quantity) AS Items_sold
FROM Retail_db..Fact_sales;

-- whatis the average selling price
SELECT
AVG(unit_price) AS average_selling_price
FROM Retail_db..Fact_sales;

-- find the total number of products
SELECT 
COUNT(product_name) AS total_products
FROM Retail_db..Product;

-- Find the total number of customers 
SELECT
COUNT(DISTINCT customer_id) AS Total_customers
FROM Retail_db..Customers;


--GENERATE A REPORT THAT SHOWS ALL KEY METRICS
SELECT 'Total sales' AS Measure_name,SUM(sales) AS Measure_value
FROM Retail_db..Fact_sales
UNION ALL
SELECT 'Total Quantity' , SUM(quantity) FROM  Retail_db..Fact_sales
UNION ALL
SELECT 'Average Price', AVG(unit_price) FROM Retail_db..Fact_sales
UNION ALL
SELECT 'Total No. of orders', COUNT(DISTINCT order_id) FROM Retail_db..Fact_sales
UNION ALL
SELECT 'Total No. of Products', COUNT(DISTINCT product_id) FROM  Retail_db..Product
UNION ALL
SELECT 'Total No. of Customers', COUNT(DISTINCT customer_id) FROM Retail_db..Customers




/*-------------------------------------------------------------------------------------------------------------------------------------------
Question1. Is profitability declining with increase in revenue? 
-------------------------------------------------------------------------------------------------------------------------------------------*/
-- check if profitability is truly declining
SELECT
    month,
    SUM(sales) AS Total_Revenue,
    SUM(operating_profit) AS Total_Operating_Profit,
    AVG(profit_margin_pct) AS Avg_Profit_Margin_Pct
FROM Retail_db..Fact_sales f
LEFT JOIN Retail_db..Date d
ON d.order_date_id = f.order_date_id
GROUP BY  month
ORDER BY  month;


/*------------------------------------------------------------------------------------------------------------------
Question2:  Which product categories underperformed? 
-------------------------------------------------------------------------------------------------------------------*/
SELECT
category,
SUM(sales) AS Total_Revenue,
SUM(operating_profit) AS Total_Operating_Profit,
AVG(profit_margin_pct) AS Avg_Profit_Margin_Pct
FROM Retail_db..Fact_sales f
LEFT JOIN Retail_db..Product p
ON p.product_id = f.product_id
GROUP BY category
ORDER BY Avg_Profit_Margin_Pct ASC


/*-----------------------------------------------------------------------------------------------------------------
Question3 : Are discounts reducing profitability? 
----------------------------------------------------------------------------------------------------------------*/
-- check the lowest and highest discount
SELECT
MIN(discount_pct)*100  AS min_discount,
MAX(discount_pct)*100  As Max_discount,
AVG(profit_margin_pct) AS Avg_Profit_Margin_Pct
FROM Retail_db..Fact_sales;

--	Are discounts reducing profitability? 
SELECT
    CASE
        WHEN discount_pct = 0 THEN 'No Discount'
        WHEN discount_pct <= 0.1 THEN '1% - 10%'
        WHEN discount_pct <= 0.2 THEN '11% - 20%'
        ELSE 'Above 20%'
    END AS Discount_Band,
SUM(sales) AS Total_Revenue,
SUM(operating_profit) AS Total_Operating_Profit,
AVG(profit_margin_pct) AS Avg_Profit_Margin_Pct
FROM Retail_db..Fact_sales
GROUP BY
 CASE
        WHEN discount_pct = 0 THEN 'No Discount'
        WHEN discount_pct <= 0.1 THEN '1% - 10%'
        WHEN discount_pct <= 0.2 THEN '11% - 20%'
        ELSE 'Above 20%'
    END
ORDER BY Avg_Profit_Margin_Pct DESC;

/*----------------------------------------------------------------------------------------------------------------
Question 4:  Which customer segments contribute the highest profit? 
-------------------------------------------------------------------------------------------------------------------*/
SELECT
segment,
SUM(operating_profit) AS Total_operating_profit
FROM Retail_db..Fact_sales f
LEFT JOIN Retail_db..Customers c
ON f.customer_id = c.customer_id
GROUP BY segment
ORDER BY Total_operating_profit DESC;


/*------------------------------------------------------------------------------------------------------------------------
Question 5 : Are shipping costs affecting profitability? 
------------------------------------------------------------------------------------------------------------------------*/
-- check the lowest and higest shipping cost
SELECT
    MIN(shipping_cost) AS Minimum_Shipping_Cost,
    MAX(shipping_cost) AS Maximum_Shipping_Cost,
    AVG(shipping_cost) AS Average_Shipping_Cost
FROM Retail_db..Fact_sales;


--	Are shipping costs affecting profitability? 

SELECT

  CASE
    WHEN shipping_cost < 5000 THEN 'Low Shipping Cost'
    WHEN shipping_cost BETWEEN 5000 AND 15000 THEN 'Medium Shipping Cost'
    ELSE 'High Shipping Cost'
  END AS Shipping_Cost_Band,
SUM(sales) AS Total_Revenue,
SUM(operating_profit) AS Total_Operating_Profit,
AVG(profit_margin_pct) AS Avg_Profit_Margin_Pct
FROM Retail_db..Fact_sales

GROUP BY 
 CASE
    WHEN shipping_cost < 5000 THEN 'Low Shipping Cost'
    WHEN shipping_cost BETWEEN 5000 AND 15000 THEN 'Medium Shipping Cost'
    ELSE 'High Shipping Cost'
  END
ORDER BY Avg_Profit_Margin_Pct DESC;


/*-------------------------------------------------------------------------------------------------------------------------------------------
Question 6 :  Which stores should receive immediate operational attention? 
-------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT TOP 6
branch_name,
region,
SUM(operating_profit) AS Total_operating_profit
FROM Retail_db..Fact_sales f
LEFT JOIN Retail_db..Branch b
ON b.branch_id = f.branch_id
GROUP BY branch_name,region
ORDER BY Total_operating_profit ASC;


/* ----------------------------------------------------------------------------------------------------------------------------------------------
Question 7 :  Analyze the sales performance over time
------------------------------------------------------------------------------------------------------------------------------------------------*/
--  sales performance over the years
SELECT
YEAR(date) as order_year,
SUM(sales) as total_sales,
COUNT(DISTINCT customer_id) as total_customers,
SUM(quantity) as total_quantity
FROM Retail_db..Fact_sales f
LEFT JOIN Retail_db..Date d
ON d.order_date_id = f.order_date_id
WHERE date IS NOT NULL
GROUP BY YEAR(date)
ORDER BY YEAR(date);

-- sales performance over the years and months
SELECT
DATETRUNC(month, date) as order_month,
SUM(sales) as total_sales,
COUNT(DISTINCT customer_id) as total_customers,
SUM(quantity) as total_quantity
FROM Retail_db..Fact_sales f
LEFT JOIN Retail_db..Date d
ON d.order_date_id = f.order_date_id
WHERE date IS NOT NULL
GROUP BY DATETRUNC(month, date)
ORDER BY DATETRUNC(month, date);



/*---------------------------------------------------------------------------------------------------------------------------------------------------------
Question 8 : Identify the top performing products categories as percentage of total sales? 
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/
WITH category_sales AS
(
SELECT
category,
SUM(sales) total_sales
FROM Retail_db..Fact_sales f
LEFT JOIN Retail_db..Product p
ON p.product_id = f.product_id
GROUP BY category
)
SELECT
category,
total_sales,
SUM(total_sales) OVER() overall_sales,
CONCAT(ROUND((CAST (total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100,2), '%') AS Percentage_of_total
FROM category_sales
ORDER BY total_sales DESC



/*---------------------------------------------------------------------------------------------------------------------------------------------------------
Question 9 : Which products generate high sales but low profits? 
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/
WITH category_sales AS
(
SELECT
category,
SUM(sales) total_sales,
SUM(operating_profit) AS total_profit
FROM Retail_db..Fact_sales f
LEFT JOIN Retail_db..Product p
ON p.product_id = f.product_id
GROUP BY category
)
SELECT
category,
total_sales,
SUM(total_sales) OVER() overall_sales,
total_profit,
SUM(total_profit) OVER() overall_profit,
CONCAT(ROUND((CAST (total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100,2), '%') AS Percentage_of_total_sales,
CONCAT(ROUND((CAST (total_profit AS FLOAT) / SUM(total_profit) OVER ()) * 100,2), '%') AS Percentage_of_total_profit
FROM category_sales
ORDER BY total_sales DESC;

/*-----------------------------------------------------------------------------------------------------------------
Question 10 :	Which regions contribute the most revenue but the least profit? 
-----------------------------------------------------------------------------------------------------------------*/

WITH region_sales AS
(
SELECT
region,
SUM(sales) total_revenue,
SUM(operating_profit) AS total_profit
FROM Retail_db..Fact_sales f
LEFT JOIN Retail_db..Branch b
ON b.branch_id = f.branch_id
GROUP BY region
)
SELECT
region,
total_revenue,
SUM(total_revenue) OVER() overall_revenue,
total_profit,
SUM(total_profit) OVER() overall_profit,
CONCAT(ROUND((CAST (total_revenue AS FLOAT) / SUM(total_revenue) OVER ()) * 100,2), '%') AS Percentage_of_total_revenue,
CONCAT(ROUND((CAST (total_profit AS FLOAT) / SUM(total_profit) OVER ()) * 100,2), '%') AS Percentage_of_total_profit
FROM region_sales
ORDER BY total_revenue DESC;