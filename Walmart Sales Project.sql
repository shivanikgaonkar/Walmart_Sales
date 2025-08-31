SHOW DATABASES;
USE walmart_db;
SHOW TABLES;
SELECT * FROM Walmart LIMIT 10;

-- BUSINESS PROBLEMS.

-- 1. Find different payment method and number of transactions, number of quantity sold.  
select
payment_method,
COUNT(*) as no_payments,
sum(quantity) as no_qty_sold
FROM Walmart
GROUP BY payment_method;

-- 2.Identify the highest rated category in each branch,displaying the branch,category and average category.
select
      branch,
      category,
      avg(rating) as avg_rating
FROM walmart
group by Branch,category
order by branch, avg_rating DESC;

-- 3.Identify the busiest day for each branch based on the number of transactions.
SELECT 
    date,
    DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name
FROM Walmart;
 
 -- Busiest day per branch
 
 SELECT 
    branch,
    DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
    COUNT(*) AS no_of_transactions
FROM Walmart
GROUP BY branch, day_name
ORDER BY branch, no_of_transactions DESC;

-- 4.Calculate the total quantity of items sold per payment method. List payment_method and total_quantity.
SELECT
      payment_method,
      COUNT(*) as no_payments,
      SUM(quantity) as no_qty_sold
FROM walmart
group by payment_method;

-- 5.Determine the average,minimum and maximum rating of category of each city. List the city, average_rating, min_rating and max_rating.
select
      city,
      category,
      MIN(rating) as min_rating,
      MAX(rating) as max_rating,
      AVG(rating) as avg_rating
FROM Walmart
GROUP BY 1,2;

-- 6.Calculate the total profit for each category for each category by considering total profit . List category and total_profit ordered from highest to lowest profit.
select
      category,
      SUM((total) * profit_margin) as profit
FROM Walmart
GROUP BY category;

-- 7.Determine the most common payment method for each branch. (Display branch and the preferred payment method). 
SELECT 
    branch,
    payment_method,
    total_trans
FROM (
    SELECT 
        branch,
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER (
            PARTITION BY branch 
            ORDER BY COUNT(*) DESC
        ) AS rnk
    FROM Walmart
    GROUP BY branch, payment_method
) t
WHERE rnk = 1;


-- 8.Categorise sales into 3 group: Morning,Afternoon,Evening
SELECT
    branch,
    time,
    CASE
        WHEN HOUR(time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN HOUR(time) BETWEEN 18 AND 23 THEN 'Evening'
        ELSE 'Night'
    END AS sales_shift,
    total
FROM Walmart;

-- 9.Identify 5 branch with highest decrease ratio in revenue compared to last year(current year 2023 and last year 2022)
WITH yearly_revenue AS (
    SELECT 
        branch,
        YEAR(date) AS year,
        SUM(total) AS revenue
    FROM Walmart
    WHERE YEAR(date) IN (2022, 2023)
    GROUP BY branch, YEAR(date)
),
pivoted AS (
    SELECT
        branch,
        MAX(CASE WHEN year = 2022 THEN revenue END) AS revenue_2022,
        MAX(CASE WHEN year = 2023 THEN revenue END) AS revenue_2023
    FROM yearly_revenue
    GROUP BY branch
)
SELECT
    branch,
    revenue_2022,
    revenue_2023,
    ( (revenue_2022 - revenue_2023) / revenue_2022 ) * 100 AS decrease_ratio
FROM pivoted
WHERE revenue_2022 IS NOT NULL AND revenue_2023 IS NOT NULL
ORDER BY decrease_ratio DESC
LIMIT 5;





