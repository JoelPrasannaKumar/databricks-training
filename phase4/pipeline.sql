-- Phase 4: Business Pipeline & Analytics

-- Data Cleaning is done in the queries implicitly or via views/CTEs
WITH CleanCustomers AS (
    SELECT DISTINCT customer_id, customer_name, city
    FROM customers
    WHERE customer_id IS NOT NULL
),
CleanOrders AS (
    SELECT DISTINCT order_id, customer_id, date, amount
    FROM orders
    WHERE customer_id IS NOT NULL 
      AND amount >= 0
)

-- Task 1: Daily Sales
SELECT date, SUM(amount) as total_sales
FROM CleanOrders
GROUP BY date
ORDER BY date;

-- Task 2: City-wise Revenue
SELECT c.city, SUM(o.amount) as total_revenue
FROM CleanCustomers c
JOIN CleanOrders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- Task 3: Top 5 Customers
SELECT c.customer_name, SUM(o.amount) as total_spend
FROM CleanCustomers c
JOIN CleanOrders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spend DESC
LIMIT 5;

-- Task 4: Repeat Customers (>1 order)
SELECT customer_id, COUNT(order_id) as order_count
FROM CleanOrders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Task 5: Customer Segmentation
WITH CustomerSpend AS (
    SELECT c.customer_id, c.customer_name, SUM(o.amount) as total_spend
    FROM CleanCustomers c
    JOIN CleanOrders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT 
    customer_name, 
    total_spend,
    CASE 
        WHEN total_spend > 10000 THEN 'Gold'
        WHEN total_spend >= 5000 AND total_spend <= 10000 THEN 'Silver'
        ELSE 'Bronze'
    END as segment
FROM CustomerSpend
ORDER BY total_spend DESC;

-- Task 6: Final Reporting Table
WITH CustomerStats AS (
    SELECT 
        c.customer_id, 
        c.customer_name, 
        c.city,
        SUM(o.amount) as total_spend,
        COUNT(o.order_id) as order_count
    FROM CleanCustomers c
    JOIN CleanOrders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name, c.city
)
SELECT 
    customer_name,
    city,
    total_spend,
    order_count,
    CASE 
        WHEN total_spend > 10000 THEN 'Gold'
        WHEN total_spend >= 5000 AND total_spend <= 10000 THEN 'Silver'
        ELSE 'Bronze'
    END as segment
FROM CustomerStats
ORDER BY total_spend DESC;
