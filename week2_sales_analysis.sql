-- WEEK 2: SQL FOR DATA ANALYSIS
-- Data Analyst Course
-- Sales Analysis

-- Query 1: Display all sales
SELECT * FROM sales;


-- Query 2: Top 10 customers by total spending
SELECT customer_name,
       SUM(total_price) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;


-- Query 3: Average order value
SELECT AVG(total_price) AS average_order_value
FROM sales;


-- Query 4: Total revenue by category
SELECT category,
       SUM(total_price) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;


-- Query 5: Total revenue by region
SELECT region,
       SUM(total_price) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;


-- Query 6: Number of orders by category
SELECT category,
       COUNT(order_id) AS total_orders
FROM sales
GROUP BY category
ORDER BY total_orders DESC;


-- Query 7: Top 10 products by revenue
SELECT product_name,
       SUM(total_price) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;


-- Query 8: Orders above average value
SELECT order_id,
       customer_name,
       total_price
FROM sales
WHERE total_price > (
    SELECT AVG(total_price)
    FROM sales
)
ORDER BY total_price DESC;


-- Query 9: Classify orders using CASE
SELECT order_id,
       customer_name,
       total_price,
       CASE
           WHEN total_price >= 30000 THEN 'High Value'
           WHEN total_price >= 15000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS order_category
FROM sales
ORDER BY total_price DESC;


-- Query 10: Highest-value order
SELECT order_id,
       customer_name,
       product_name,
       total_price
FROM sales
ORDER BY total_price DESC
LIMIT 1;