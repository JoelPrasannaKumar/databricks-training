-- 1
SELECT
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
    employee_name,
    salary
FROM employees;

-- 2
SELECT
    RANK() OVER (ORDER BY salary DESC) AS rank_num,
    employee_name,
    salary
FROM employees;

-- 3
SELECT
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_num,
    employee_name,
    salary
FROM employees;

-- 4
SELECT *
FROM (
    SELECT
        ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
        employee_name,
        department,
        salary
    FROM employees
) ranked_employees
WHERE row_num <= 3;

-- 5
SELECT
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank,
    department,
    employee_name,
    salary
FROM employees;

-- 6
SELECT
    MAX(salary) OVER (
        PARTITION BY department
    ) AS highest_salary,
    department,
    employee_name,
    salary
FROM employees;

-- 7
SELECT
    SUM(total_amount) OVER (
        ORDER BY order_date
    ) AS running_total,
    order_id,
    order_date,
    total_amount
FROM orders;

-- 8
SELECT
    SUM(total_amount) OVER (
        PARTITION BY employee_id
        ORDER BY order_date
    ) AS cumulative_sales,
    employee_id,
    order_id,
    order_date,
    total_amount
FROM orders;

-- 9
SELECT
    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_amount,
    customer_id,
    order_id,
    order_date,
    total_amount
FROM orders;

-- 10
SELECT
    LEAD(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_order_amount,
    customer_id,
    order_id,
    order_date,
    total_amount
FROM orders;
