-- LEVEL 1

-- Q1
SELECT *
FROM Employees
WHERE salary IS NULL;

-- Q2
SELECT *
FROM Orders
WHERE discount IS NOT NULL;

-- Q3
SELECT *
FROM Products
WHERE category IS NULL;

-- Q4
SELECT COUNT(*) AS total_employees
FROM Employees
WHERE manager_id IS NULL;

-- LEVEL 2

-- Q1
SELECT
    emp_id,
    name,
    ISNULL(salary, 0) AS salary
FROM Employees;

-- Q2
SELECT
    emp_id,
    name,
    ISNULL(bonus, 1000) AS bonus
FROM Employees;

-- Q3
SELECT
    order_id,
    customer_name,
    ISNULL(amount, 500) AS amount
FROM Orders;

-- Q4
SELECT
    product_id,
    product_name,
    ISNULL(stock, 0) AS stock
FROM Products;

-- LEVEL 3

-- Q1
SELECT
    emp_id,
    name,
    COALESCE(salary, bonus) AS earnings
FROM Employees;

-- Q2
SELECT
    emp_id,
    name,
    COALESCE(salary, bonus, 0) AS earnings
FROM Employees;

-- Q3
SELECT
    product_id,
    product_name,
    COALESCE(price, 1000) AS final_price
FROM Products;

-- Q4
SELECT
    order_id,
    customer_name,
    COALESCE(amount, discount, 0) AS payment
FROM Orders;

-- LEVEL 4

-- Q1
SELECT
    emp_id,
    name,
    NULLIF(salary, 0) AS salary
FROM Employees;

-- Q2
SELECT
    order_id,
    customer_name,
    NULLIF(discount, 0) AS discount
FROM Orders;

-- Q3
SELECT
    amount / NULLIF(discount, 0) AS result
FROM Orders;

-- Q4
SELECT
    order_id,
    customer_name,
    NULLIF(coupon_code, 'DISC10') AS coupon_code
FROM Orders;


-- LEVEL 5

-- Q1
SELECT
    emp_id,
    name,
    COALESCE(salary, 0) + COALESCE(bonus, 0)
    AS total_earnings
FROM Employees;

-- Q2
SELECT *
FROM Employees
WHERE salary IS NULL
AND bonus IS NULL;

-- Q3
SELECT *
FROM Products
WHERE price IS NULL
AND category IS NOT NULL;

-- Q4
SELECT *
FROM Orders
WHERE amount IS NULL
AND discount IS NULL;

-- LEVEL 6

-- Q1
SELECT
    emp_id,
    name,
    COALESCE(salary, bonus, 1000) AS income
FROM Employees;

-- Q2
SELECT
    order_id,
    customer_name,
    NULLIF(discount, 0) AS discount
FROM Orders;

-- Q3
SELECT
    order_id,
    customer_name,
    COALESCE(amount, 0) - COALESCE(discount, 0)
    AS final_payable
FROM Orders;

-- Q4
SELECT *
FROM Employees
WHERE salary IS NULL
AND manager_id IS NOT NULL;
