-- 36
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- 37
SELECT p.name AS project_name, d.name AS department_name
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

-- 38
SELECT e.name AS employee_name, p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- 39
SELECT e.name AS employee_name, d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- 40
SELECT d.name AS department_name, e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

-- 41
SELECT e.name
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
WHERE p.project_id IS NULL;

-- 42
SELECT e.name, COUNT(p.project_id) AS project_count
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
GROUP BY e.emp_id, e.name;

-- 43
SELECT d.name 
FROM Department d
LEFT JOIN Employee e
ON d.department_id=e.department_id
WHERE e.emp_id IS NULL;

-- 44
SELECT e2.name
FROM Employee e1
JOIN Employee e2
ON e1.department_id=e2.department_id
WHERE e1.name='John Doe'
AND e2.name <> 'John Doe';

-- 45
SELECT d.name
FROM Department d
JOIN Employee e
ON d.department_id=e.department_id
GROUP BY d.department_id,d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;

-- 46
SELECT name
FROM Employee
ORDER BY salary DESC
LIMIT 1;

-- 47
SELECT name,salary
FROM Employee 
WHERE salary> (SELECT AVG(salary)
               FROM Employee);

-- 48
SELECT name,salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- 49
SELECT department_id,COUNT(*) AS emp_count
FROM Employee
WHERE department_id IS NOT NULL 
GROUP BY department_id
ORDER BY emp_count DESC
LIMIT 1;

-- 50
SELECT e1.name,e1.salary
FROM Employee e1
WHERE e1.salary >(
  SELECT AVG(e2.salary)
  FROM Employee e2
  WHERE e2.department_id=e1.department_id
  );

-- 51
SELECT DISTINCT salary
FROM Employee 
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 52
SELECT name,age
FROM Employee 
WHERE age>ALL(
  SELECT age
  FROM Employee
  WHERE department_id=(
    SELECT department_id
    FROM Department
    WHERE name='HR'
    )
  );

-- 53
SELECT department_id,AVG(salary) AS average_salary
FROM Employee
WHERE department_id
GROUP BY department_id
HAVING AVG(salary)>55000;

-- 54
SELECT e.name
FROM Employee e
WHERE e.department_id IN (
  SELECT department_id 
  FROM Project 
  GROUP BY department_id
  HAVING COUNT(*)>=2);

-- 55
SELECT e.name
FROM Employee e
WHERE e.hire_date =(
  SELECT hire_date 
  FROM Employee e2
  WHERE e2.name='Jane Smith');
