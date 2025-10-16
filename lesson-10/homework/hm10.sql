--Homework-10
--Task 1
SELECT Name as EmployeeName,
       Salary,
	   DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.departmentid 
WHERE e.Salary > 50000

--Task 2
  SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 2023;

--Task 3
SELECT e.Name AS EmployeeName,
       d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID

--Task 4
SELECT s.SupplierName,
       p.ProductName
FROM Suppliers s
LEFT JOIN Products p
ON s.SupplierID = p.SupplierID

--Task 5
SELECT o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
FROM Orders o
FULL JOIN Payments p
ON o.OrderID = p.OrderID

--Task 6
SELECT e.Name AS EmployeeName,
       m.Name AS ManagerName
	   FROM EMPLOYEES e
 left JOIN employees m
ON e.ManagerID = m.EmployeeID

--Task 7
SELECT s.Name AS StudentName,
       c.CourseName
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Students s ON e.StudentID = s.StudentID
WHERE c.CourseID = 1

--Task 8
SELECT c.FirstName,
       c.LastName,
	   o.Quantity
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID 
WHERE o.Quantity > 3

--Task 9
SELECT e.Name AS EmployeeName,
       d.DepartmentName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID 
WHERE d.DepartmentID = 2
  
--Task 10
  SELECT  d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 5
--Task 11
SELECT p.ProductID, p.ProductName
FROM Products p 
LEFT JOIN Sales s 
ON p.ProductID = s.ProductID
WHERE s.SaleID IS NULL
--Task 12
SELECT c.FirstName, c.LastName, COUNT (o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
HAVING COUNT (o.OrderID) >= 1
--Task 13
SELECT e.Name AS EmployeeName,
       d.DepartmentName
FROM Employees e
 JOIN Departments d
ON e.DepartmentID = d.DepartmentID
--Task 14
SELECT e.Name AS Employee1,
       m.Name AS Employee2,
	   m.ManagerID
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.ManagerID
AND e.EmployeeID < m.EmployeeID 
WHERE e.ManagerID IS NOT NULL
--Task 15
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o
 JOIN Customers c
ON o.customerID = c.customerID 
WHERE YEAR(o.OrderDate) = 2022
--Task 16
SELECT e.Name AS EmployeeName, e.Salary, d.DepartmentName
FROM employees e
JOIN Departments d 
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' 
AND e.Salary > 60000
--Task 17
SELECT o.OrderID,
       o.OrderDate,
	   p.PaymentDate,
	   p.Amount
FROM Orders o 
JOIN Payments p
ON o.OrderID = p.OrderID 
--Task 18
SELECT p.ProductID, 
       p.ProductName
FROM products p
left JOIN Orders o 
ON p.productID = o.ProductID
WHERE o.OrderID IS NULL
--Task 19
SELECT e.Name AS EmployeeName, e.Salary
FROM Employees e
JOIN (
    SELECT DepartmentID, AVG(Salary) AS DeptAvg
    FROM Employees
    GROUP BY DepartmentID
) avgd ON e.DepartmentID = avgd.DepartmentID
WHERE e.Salary > avgd.DeptAvg;
--Task 20
SELECT o.OrderID,
       o.OrderDate
FROM Orders o
LEFT JOIN Payments p
ON o.OrderID = p.OrderID
WHERE YEAR (o.OrderDate) < 2020
 AND PaymentID IS NULL

--Task 21
SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN Categories c
ON p.Category = c.CategoryID
WHERE c.CategoryID IS NULL 
--Task 22
SELECT e1.Name AS Employee1,
       e2.Name AS Employee2,
	   e1.ManagerID,
	   e1.Salary AS Salary1,
	   e2.Salary AS Salary2
FROM Employees e1
JOIN Employees e2 
ON e1.ManagerID = e2.ManagerID
AND e1.EmployeeID < e2.EmployeeID 
WHERE e1.ManagerID IS NOT NULL
 AND e1.Salary > 60000
 AND e2.Salary > 60000
--Task 23
SELECT e.Name AS EmployeeName,
       d.DepartmentName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID 
WHERE d.DepartmentName LIKE 'M%'
--Task 24
SELECT s.SaleID, p.ProductName, s.SaleAmount
FROM Products p
JOIN Sales s 
ON p.ProductID = s.ProductID 
WHERE s.SaleAmount >500

--Task 25
SELECT s.StudentID, s.Name AS StudentName
FROM Students s
WHERE s.StudentID NOT IN (
    SELECT e.StudentID
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE c.CourseName = 'Math 101'
);
--Task 26
SELECT o.OrderID, 
       o.OrderDate,
	   p.PaymentID
FROM Orders o
LEFT JOIN Payments p 
ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL
--Task 27
SELECT p.ProductID, 
       p.ProductName,
	   c.CategoryName 
FROM Products p
JOIN Categories c
ON p.Category = c.CategoryID 
WHERE c.CategoryName IN ('Electronics', 'Furniture')













