Retail Sales Analysis using SQL (Project 1)
Project Overview
This project is a retail sales data analysis using SQL Server. The goal is to clean the dataset, explore key business questions, and extract meaningful insights about customer behaviour, sales trends, and product performance.
________________________________________
Dataset Description
The dataset is stored in a single table: retail_sales
Columns:
•	transactions_id (INT, Primary Key)
•	sale_date (DATE)
•	sale_time (TIME)
•	customer_id (INT)
•	gender (VARCHAR)
•	age (INT)
•	category (VARCHAR)
•	quantity (INT)
•	price_per_unit (FLOAT)
•	cogs (FLOAT)
•	total_sale (FLOAT)
________________________________________
Data Cleaning Steps
The following cleaning operations were performed:
•	Checked for NULL values across all columns
•	Replaced NULL values in key numeric fields using ISNULL():
o	age
o	quantity
o	price_per_unit
o	cogs
o	total_sale
•	Adjusted data types where necessary (e.g. sale_time precision)
________________________________________
Data Analysis Objectives
The analysis focuses on answering key business questions such as:
•	Total number of transactions
•	Number of unique customers
•	Category performance
•	High-value transactions
•	Customer behaviour patterns
•	Monthly sales trends
•	Top customers by revenue
•	Sales distribution by time of day (shift analysis)
________________________________________
Key Business Questions Answered
1. Total transactions
•	Counted all records in the dataset
2. Unique customers
•	Identified distinct customer IDs
3. Product categories
•	Retrieved all unique product categories
4. Sales on specific date
•	Filtered transactions by date
5. Clothing sales analysis
•	Filtered category = Clothing
•	Analysed quantity and time period
6. Sales by category
•	Total sales and transaction count per category
7. Customer age analysis
•	Average age of customers in Beauty category
8. High-value transactions
•	Transactions greater than 1000 total sales
9. Gender analysis
•	Transactions grouped by gender and category
10. Monthly performance
•	Average sales per month
•	Identified best-performing month per year using RANK()
11. Top customers
•	Top 5 customers by total sales
12. Customer distribution
•	Unique customers per category
13. Shift analysis
•	Classified sales into:
o	Morning (< 12)
o	Afternoon (12–17)
o	Evening (> 17)
________________________________________
Key Insights
•	Sales vary significantly across time of day, with clear peak periods
•	A small group of customers contributes to a large portion of revenue
•	Certain categories perform better in specific months
•	Customer demographics (age and gender) vary by product category
•	Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
•	High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
•	Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.
•	Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.

Reports
•	Sales Summary: A detailed report summarising total sales, customer demographics, and category performance.
•	Trend Analysis: Insights into sales trends across different months and shifts.
•	Customer Insights: Reports on top customers and unique customer counts per category.

Conclusion
This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

________________________________________
Tools Used
•	SQL Server
•	SQL Queries (T-SQL)
•	Aggregations (SUM, COUNT, AVG)
•	Window Functions (RANK)
•	CTE (Common Table Expressions)
________________________________________
How to Run This Project
1.	Create the table using the provided SQL script
2.	Insert or import dataset into retail_sales
3.	Run queries step by step from:
o	Data cleaning section
o	Data analysis section
4.	Review outputs for insights
________________________________________
Project Structure
Retail Sales Analysis Project

- sales_table.sql
- data_cleaning_queries.sql
- analysis_queries.sql
- README.md
________________________________________
Author
Created by: Alyona Baboglo
GitHub: https://github.com/zvetok6/sql_retail_sales_p1
________________________________________
Notes
This project is designed for portfolio development and beginner-to-intermediate SQL practice focusing on real-world business analysis scenarios.
