-- TASK 1 
SELECT * FROM employees
WHERE SALARY = (
      SELECT MIN(SALARY)
    FROM employees
    )
-- TASK 2
  SELECT * FROM Products 
WHERE price > (
      SELECT AVG(price) FROM Products)
-- TASK 3 
SELECT *
FROM employees
WHERE department_id IN (
    SELECT id
    FROM departments
    WHERE department_name = 'Sales'
)
-- TASK 4 
SELECT * FROM customers c
WHERE NOT EXISTS (
      SELECT 1 FROM orders o
    WHERE o.customer_id = c.customer_id)
-- TASK 5 
SELECT * FROM products p
WHERE price = (
SELECT MAX(price) FROM products 
WHERE p.category_id = category_id
)
-- TASK 6 
SELECT *
FROM employees
WHERE department_id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);
-- TASK 7 
SELECT * FROM Employees e1
WHERE salary >
(SELECT AVG(salary) FROM Employees 
WHERE e1.department_id = employees.department_id
 )
-- TASK 8 
SELECT s.*, g.course_id, g.grade
FROM students s
JOIN grades g
ON s.student_id = g.student_id
 WHERE g.grade =
(SELECT MAX(grade) FROM grades 
WHERE course_id = g.course_id)
-- TASK 9 
SELECT p1.*
FROM products p1
WHERE 2 = (
    SELECT COUNT(DISTINCT p2.price)
    FROM products p2
    WHERE p2.category_id = p1.category_id
      AND p2.price > p1.price
);

-- TASK 10
SELECT *
FROM employees e1
WHERE salary < (
   SELECT MAX(salary) FROM employees e2
   WHERE e1.department_id = e2.department_id)
   AND salary > ( SELECT AVG(salary) FROM employees)
