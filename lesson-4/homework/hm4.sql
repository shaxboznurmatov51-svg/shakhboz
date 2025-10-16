-- Lesson 4: Filtering and Ordering Data
--Task 1
SELECT TOP 5 *
FROM Employees

--Task 2
SELECT DISTINCT  CATEGORY 
FROM Products
--Task 3
SELECT *
FROM PRODUCTS
WHERE PRICE > 100
ORDER BY PRICE
--Task 4
SELECT * FROM CUSTOMERS
WHERE FIRSTNAME LIKE 'A%'
--Task 5
SELECT * FROM PRODUCTS
ORDER BY PRICE ASC
--Task 6
SELECT * FROM Employees
WHERE SALARY >= 60000
 AND DEPARTMENTNAME = 'HR'
--Task 7
 SELECT EmployeeID,
        FirstName,
        LastName,
 ISNULL (EMAIL, 'noemail@example.com') AS EMAIL
 FROM Employees
--Task 8
 SELECT * FROM Products
 WHERE Price BETWEEN 50 AND 100
--Task 9
SELECT DISTINCT Category, ProductName 
FROM Products 
--Task 10
SELECT DISTINCT Category, ProductName 
FROM Products 
ORDER BY ProductName DESC
--Task 11
SELECT TOP 10 *
FROM Products 
ORDER BY Price DESC
--Task 12
SELECT EmployeeID,
       COALESCE (FirstName, LastName) AS First_Available_Name
FROM Employees 

--Task 13
SELECT DISTINCT Category, Price
FROM Products
--Task 14
SELECT * FROM Employees
WHERE (Age BETWEEN 30 AND 40) OR DepartmentName = 'Marketing'
--Task 15
  SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY
--Task 16
SELECT * FROM Products
WHERE Price <= 1000 
AND StockQuantity > 50 
ORDER BY StockQuantity ASC
--Task 17
SELECT * FROM Products
WHERE ProductName LIKE '%e%'
--Task 18
SELECT * FROM Employees 
WHERE DepartmentName  IN ('HR', 'IT', 'FINANCE')
--Task 19
SELECT * FROM Customers 
ORDER BY City ASC, PostalCode DESC
--Task 20
SELECT TOP 5 *
FROM SALES
ORDER BY SaleAmount DESC
--Task 21
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees

--Task 22
SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50
--Task 23
SELECT * FROM Products
WHERE Price < 
(SELECT AVG(Price) * 0.1 FROM Products)
--Task 24
SELECT * FROM Employees 
WHERE Age < 30 
 AND DeparTmentName IN ('HR', 'IT')
--Task 25
 SELECT * FROM Customers
 WHERE Email LIKE '%@gmail.com%'
--Task 26
 SELECT * FROM Employees
 WHERE SALARY > ALL (
 SELECT Salary FROM Employees WHERE DepartmentName = 'Sales')
--Task 27
SELECT * 
FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, GETDATE()) AND GETDATE();


