/* SGL Retail Sales Analysis - Project 1*/

/* Create tables for SQL Retail Sales - P1 */
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
(
     transactions_id INT PRIMARY KEY,
	 sale_date DATE,
	 sale_time TIME,
	 customer_id INT,
	 gender VARCHAR(15),
	 age INT,
	 category VARCHAR(15),
	 quantity INT,
	 price_per_unit FLOAT,
	 cogs FLOAT,
	 total_sale FLOAT
);

/* Find how many records are in the retail_sales table */
SELECT COUNT(*) FROM retail_sales;

SELECT * FROM retail_sales;

/* DATA CLEANING STAGE*/

/* Fix the data types for the sale_date and sale_time columns */
ALTER TABLE retail_sales
ALTER COLUMN sale_time TIME(0);

/* Find the NULL values on the retail_sales table */
SELECT * FROM retail_sales
WHERE
     transactions_id IS NULL
	 OR
	 sale_date IS NULL
	 OR
	 sale_time IS NULL
	 OR
	 customer_id IS NULL
	 OR
	 gender IS NULL
	 OR
	 age IS NULL
	 OR
	 category IS NULL
	 OR
	 quantity IS NULL
	 OR
	 price_per_unit IS NULL
	 OR
	 cogs IS NULL
	 OR
	 total_sale IS NULL;

/* Replace the NULL values with 0 for the age, quantity, price_per_unit, cogs, and total_sale columns */
UPDATE retail_sales
SET age = ISNULL (age, 0),
    quantity = ISNULL (quantity, 0),
	price_per_unit = ISNULL (price_per_unit, 0),
	cogs = ISNULL (cogs, 0),
	total_sale = ISNULL (total_sale, 0)
WHERE age IS NULL
      OR
	  quantity IS NULL
	  OR
	  price_per_unit IS NULL
	  OR
	  cogs IS NULL
	  OR
	  total_sale IS NULL;

SELECT * FROM retail_sales;

/*DATA ANALYSIS STAGE*/

/* How many sales transactions were made in total? */
SELECT COUNT(*) AS Total_Transactions FROM retail_sales;

/* How many unique customers we have in total? */
SELECT COUNT (DISTINCT customer_id) 
FROM retail_sales;

/* How many unique categories we have in total? */
SELECT DISTINCT (category)
FROM retail_sales;

/* Bisness key issues and answers */

/* Q1 - Retrive all columns for sales transactions made on 2022-11-05*/
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

/* Q2-  Retrieve all transactions where category is 'Clothing' and the quantity sold is greater than 10
in the month of Nov-2022 */


SELECT Category, Quantity, Sale_Date
FROM retail_sales
WHERE category = 'Clothing'
AND Quantity >= 2
AND Sale_Date BETWEEN '2022-11-01' AND '2022-11-30';

/* Q3 - Calculate the total sales and how many transactions for each category*/

SELECT Category,
       SUM(Total_Sale) AS Total_Sales,
	   COUNT(*) AS Total_Transactions
FROM retail_sales
GROUP BY Category;

/* Q4 - Find the average age of customers who purchased items from the 'Beauty 'category*/

SELECT 
	   ROUND(avg(age), 2) AS Average_Age
FROM retail_sales
WHERE category = 'Beauty'

 /* Q5 -Find all transactions where the total sale is greater than 1000*/

SELECT *
FROM retail_sales
WHERE total_sale > 1000;

/* Q6 - Find the total number of transactions made by each gender in each category*/

SELECT category,gender,
    COUNT(*) AS Total_Transactions
FROM retail_sales
GROUP BY category,gender
ORDER BY 1;

/* Q7 - Calculate the average sales for each month. Found out the best selling month in each year*/

SELECT 
year,
month,
average_sale
FROM(
SELECT 
     YEAR(sale_date) AS Year,
	 MONTH(sale_date) AS Month,
     AVG(total_sale) AS Average_Sale,
	 RANK () OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS Best_Selling_Month_Rank
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)) as T1
WHERE Best_Selling_Month_Rank = 1;

/* Q8- Find the top 5 customers based on the highest total sales*/

SELECT TOP 5
    customer_id,
	sum(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC;

/* Q9 - Find the number of unique customers who purchesed items from each category*/

SELECT  category,
        COUNT (DISTINCT customer_id) AS count_of_unique_customers
FROM retail_sales
GROUP BY category
ORDER BY count_of_unique_customers desc;

/* Create each shift and number of order (example: Morning >12, Afternoon between 12 & 17 and Evening >17)*/

WITH hourly_sale
AS
(
SELECT *,
     CASE
	 WHEN DATEPART(HOUR,sale_time) <12  THEN 'Morning'
	 WHEN DATEPART(HOUR,sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
	 ELSE 'Evening'
END AS shift
FROM retail_sales
)
SELECT 
   shift,
   COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;

-- End of project--










     



