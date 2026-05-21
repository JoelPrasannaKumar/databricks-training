-- JOINS QUESTIONS 1 TO 10

-- QUESTION 1
SELECT
    e.emp_name AS employee_name,
    m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- QUESTION 2
SELECT
    e.emp_name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- QUESTION 3
SELECT
    e.emp_name AS employee_name,
    m.emp_name AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

-- QUESTION 4
SELECT
    d.dept_name,
    e.emp_name,
    SUM(s.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
LEFT JOIN salaries s
ON e.emp_id = s.emp_id
GROUP BY d.dept_name, e.emp_name;

-- QUESTION 5
SELECT
    e.emp_name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- QUESTION 6
SELECT
    e.emp_name,
    p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;

-- QUESTION 7
SELECT
    e.emp_name,
    p.project_name
FROM employees e
INNER JOIN projects p
ON e.emp_id = p.emp_id;

-- QUESTION 8
SELECT
    e.emp_name,
    p.project_name
FROM employees e
RIGHT JOIN projects p
ON e.emp_id = p.emp_id;

-- QUESTION 9
SELECT
    e.emp_name,
    s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id;

-- QUESTION 10
SELECT
    e.emp_name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
