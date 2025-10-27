-- This is to explore the dataset in full and see the different rows and columns that make up the dataset
SELECT *
FROM BRIGHTLEARN.COFFEESHOP.SALES;

-- Here I want to see how many store locations there are
SELECT DISTINCT STORE_LOCATION
FROM BRIGHTLEARN.COFFEESHOP.SALES;

-- To Check the different products which are offered 
SELECT DISTINCT PRODUCT_CATEGORY
FROM BRIGHTLEARN.COFFEESHOP.SALES;

-- To Check the different product typs which are offered 
SELECT DISTINCT PRODUCT_TYPE
FROM BRIGHTLEARN.COFFEESHOP.SALES;

-- In this code I would like to explore the amount of Transactions there are 
SELECT Count(DISTINCT TRANSACTION_ID)
FROM BRIGHTLEARN.COFFEESHOP.SALES;

-- To Check when the shop start operating
SELECT MIN(TRANSACTION_DATE) AS Shop_Opening_Date
FROM BRIGHTLEARN.COFFEESHOP.SALES;

-- To Check whe the last time the shop performed a transction 
SELECT MAX(TRANSACTION_DATE) AS Shop_Last_Tranaction_Date
FROM BRIGHTLEARN.COFFEESHOP.SALES;

SELECT TRANSACTION_ID,
       TRANSACTION_DATE,
       DAYNAME(TRANSACTION_DATE) AS Day_of_Transaction,
FROM BRIGHTLEARN.COFFEESHOP.SALES;

-- To check the time the shop starts to operate
SELECT MIN(TRANSACTION_TIME) AS Opening_Time
FROM BRIGHTLEARN.COFFEESHOP.SALES;

-- To check the time the shop closes and ends operation
SELECT MAX(TRANSACTION_TIME) AS Closing_Time
FROM BRIGHTLEARN.COFFEESHOP.SALES;

-------------------------------------------------------------
SELECT COUNT (DISTINCT TRANSACTION_ID) AS Number_of_Sales,
       CASE 
       WHEN Number_of_Sales < 2 THEN 'New Customer'
       WHEN Number_of_Sales >= 2 THEN 'Regular Customer'
       END AS Customer_Status,
       TRANSACTION_DATE,
       DAYNAME(TRANSACTION_DATE) AS Day_of_Transaction,
       CASE 
       WHEN Day_of_Transaction IN ('Sun','Sat') THEN 'Weekend'
       ELSE 'Weekday'
       END AS Time_of_The_Week,
       MONTHNAME(TRANSACTION_DATE) AS Month_of_Transaction,
       CASE 
       WHEN Month_of_Transaction IN ('Dec','Jan','Feb') THEN 'Summer'
       WHEN Month_of_Transaction IN ('Mar','Apr','May') THEN 'Autumn'
       WHEN Month_of_Transaction IN ('Jun','Jul','Aug') THEN 'Winter'
       WHEN Month_of_Transaction IN ('Sep','Oct','Nov') THEN 'Spring'
       END AS Season_of_The_Year,
       TRANSACTION_TIME,
       TRANSACTION_QTY,
       CASE 
       WHEN TRANSACTION_TIME between '06:00:00' AND '10:59:59' THEN 'Morning'
       WHEN TRANSACTION_TIME between '11:00:00' AND '17:59:59' THEN 'Afternoon'
       WHEN TRANSACTION_TIME >= '18:00:00' THEN 'Evening'
       END AS Time_of_Day, 
       HOUR (TRANSACTION_TIME) AS Hour_of_Purchase,
       STORE_ID,
       STORE_LOCATION,
       PRODUCT_ID,
       PRODUCT_CATEGORY,
       PRODUCT_TYPE,
       PRODUCT_DETAIL,
       SUM (TRANSACTION_QTY*UNIT_PRICE) AS REVENUE
FROM BRIGHTLEARN.COFFEESHOP.SALES
GROUP BY ALL;
