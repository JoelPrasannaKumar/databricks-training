-- SQL Practice Queries Answers (1-35)

-- 1
SELECT * FROM Employee;

-- 2
SELECT name, salary FROM Employee;

-- 3
SELECT * FROM Employee
WHERE age > 30;

-- 4
SELECT name FROM Department;

-- 5
SELECT * FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Department
    WHERE name = 'IT'
);

-- 6
SELECT * FROM Employee
WHERE name LIKE 'J%';

-- 7
SELECT * FROM Employee
WHERE name LIKE '%e';

-- 8
SELECT * FROM Employee
WHERE name LIKE '%a%';

-- 9
SELECT * FROM Employee
WHERE LENGTH(name) = 9;

-- 10
SELECT * FROM Employee
WHERE name LIKE '_o%';

-- 11
SELECT * FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 12
SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;

-- 13
SELECT * FROM Employee
WHERE hire_date < '2019-01-01';

-- 14
SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';

-- 15
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 16
SELECT SUM(salary) AS total_salary
FROM Employee;

-- 17
SELECT AVG(salary) AS average_salary
FROM Employee;

-- 18
SELECT MIN(salary) AS minimum_salary
FROM Employee;

-- 19
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

-- 20
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;

-- 21
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- 22
SELECT department_id, AVG(age) AS average_age
FROM Employee
GROUP BY department_id;

-- 23
SELECT YEAR(hire_date), COUNT(*) AS no_of_hired
FROM Employee
GROUP BY YEAR(hire_date)
ORDER BY 1 DESC;

-- 24
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- 25
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
ORDER BY 2 DESC
LIMIT 1;

-- 26
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 27
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 28
SELECT YEAR(hire_date), COUNT(*) AS emp_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING emp_count > 1;

-- 29
SELECT department_id
FROM Employee
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- 30
SELECT department_id
FROM Employee
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING MAX(salary) > 75000;

-- 31
SELECT name, salary
FROM Employee
ORDER BY salary ASC;

-- 32
SELECT name, age
FROM Employee
ORDER BY age DESC;

-- 33
SELECT name, YEAR(hire_date)
FROM Employee
ORDER BY YEAR(hire_date) ASC;

-- 34
SELECT name, department_id, salary
FROM Employee
ORDER BY department_id, salary;

-- 35
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
WHERE department_id IS NOT NULL
GROUP BY department_id
ORDER BY total_salary ASC;
