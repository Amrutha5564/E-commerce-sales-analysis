-- E-COMMERCE SALES ANALYSIS PROJECT - FULL CODE
DROP DATABASE IF EXISTS e_commerce;
CREATE DATABASE e_commerce;
USE e_commerce;

-- 1. TABLE CREATE CHEYADAM
CREATE TABLE sales (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    Product VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Sales_Amount DECIMAL(10,2),
    Profit DECIMAL(10,2),
    Region VARCHAR(50),
    Payment_Mode VARCHAR(50)
);

-- 2. SAMPLE DATA INSERT (20 orders)
INSERT INTO sales VALUES
(1, '2024-01-05', 101, 'Arjun', 'Laptop', 'Electronics', 1, 65000, 65000, 8000, 'South', 'Credit Card'),
(2, '2024-01-10', 102, 'Priya', 'Mobile', 'Electronics', 2, 25000, 50000, 6000, 'North', 'UPI'),
(3, '2024-01-15', 103, 'Kiran', 'Shoes', 'Fashion', 3, 2000, 6000, 1500, 'East', 'COD'),
(4, '2024-02-02', 104, 'Sneha', 'T-Shirt', 'Fashion', 5, 800, 4000, 800, 'West', 'Debit Card'),
(5, '2024-02-10', 105, 'Ravi', 'Headphones', 'Electronics', 2, 3000, 6000, 1200, 'South', 'UPI'),
(6, '2024-02-20', 101, 'Arjun', 'Mouse', 'Electronics', 1, 1500, 1500, 300, 'South', 'Credit Card'),
(7, '2024-03-05', 106, 'Anjali', 'Saree', 'Fashion', 2, 3500, 7000, 2000, 'North', 'Credit Card'),
(8, '2024-03-12', 107, 'Vijay', 'Watch', 'Fashion', 1, 12000, 12000, 3000, 'East', 'UPI'),
(9, '2024-03-20', 108, 'Lakshmi', 'Mixer', 'Home Appliances', 1, 8000, 8000, 1000, 'South', 'COD'),
(10, '2024-04-01', 109, 'Suresh', 'Laptop', 'Electronics', 1, 68000, 68000, 9000, 'West', 'Credit Card'),
(11, '2024-04-10', 110, 'Divya', 'Mobile', 'Electronics', 1, 30000, 30000, 4000, 'North', 'Debit Card'),
(12, '2024-04-15', 102, 'Priya', 'Shoes', 'Fashion', 2, 2500, 5000, 1000, 'North', 'UPI'),
(13, '2024-05-02', 111, 'Mohan', 'AC', 'Home Appliances', 1, 40000, 40000, 5000, 'South', 'Credit Card'),
(14, '2024-05-10', 112, 'Kavya', 'T-Shirt', 'Fashion', 10, 800, 8000, 1600, 'East', 'COD'),
(15, '2024-06-01', 103, 'Kiran', 'Laptop', 'Electronics', 1, 70000, 70000, 10000, 'East', 'UPI');

-- 3. ANALYSIS QUERIES START

-- Q1: Total Sales
SELECT SUM(Sales_Amount) AS Total_Sales FROM sales;

-- Q2: Total Profit
SELECT SUM(Profit) AS Total_Profit FROM sales;

-- Q3: Sales by Category
SELECT Category, SUM(Sales_Amount) AS Total_Sales 
FROM sales GROUP BY Category;

-- Q4: Top 5 Products by Sales
SELECT Product, SUM(Sales_Amount) AS Total_Sales 
FROM sales GROUP BY Product ORDER BY Total_Sales DESC LIMIT 5;

-- Q5: Sales by Region
SELECT Region, SUM(Sales_Amount) AS Region_Sales 
FROM sales GROUP BY Region;

-- Q6: Monthly Sales Trend
SELECT MONTH(Order_Date) AS Month, SUM(Sales_Amount) AS Monthly_Sales 
FROM sales GROUP BY MONTH(Order_Date) ORDER BY Month;

-- Q7: Top Customers
SELECT Customer_Name, SUM(Sales_Amount) AS Total_Purchase 
FROM sales GROUP BY Customer_Name ORDER BY Total_Purchase DESC LIMIT 5;

-- Q8: Payment Mode Analysis
SELECT Payment_Mode, COUNT(*) AS Total_Orders, SUM(Sales_Amount) AS Total_Sales 
FROM sales GROUP BY Payment_Mode;

-- Q9: Average Order Value
SELECT AVG(Sales_Amount) AS Avg_Order_Value FROM sales;

-- Q10: Category with Highest Profit
SELECT Category, SUM(Profit) AS Total_Profit 
FROM sales GROUP BY Category ORDER BY Total_Profit DESC LIMIT 1;

-- Q11: Full Table View for Project Report
SELECT * FROM sales ORDER BY Order_Date;