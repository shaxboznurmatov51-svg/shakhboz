--TASK 1
SELECT OrderID,
       CONCAT(FirstName,' ',LastName) CustomerName,
       YEAR(OrderDate) OrderDate
FROM Orders o 
JOIN Customers c
ON o.CustomerID = c.CustomerID
WHERE YEAR(OrderDate) >2022
ORDER BY OrderDate
--TASK 2
SELECT Name EmployeeName,
DepartmentName  
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.departmentName IN ('Sales', 'Marketing')

--TASK 3
SELECT d.DepartmentName,
       MAX(Salary) Max_salary
FROM Employees e
JOIN Departments d
ON e.departmentID = d.departmentID
GROUP BY D.DepartmentName 
--TASK 4
SELECT CONCAT(FirstName, ' ', LastName) customerName,
       o.OrderID,
	   OrderDate
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' 
 AND YEAR(OrderDate) = 2023
--TASK 5
SELECT CONCAT(FirstName, ' ', LastName) CustomerName,
       COUNT(OrderID) TotalOrders
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY CONCAT(FirstName, ' ', LastName)
--TASK 6
SELECT p.ProductName,
       s.SupplierName
FROM Products p
JOIN Suppliers s
ON p.SupplierID = s.SupplierID
Where SupplierName IN ('Gadget Supplies', 'Clothing Mart')

--TASK 7
SELECT CONCAT(FirstName, ' ', LastName) CustomerName,
MAX(orderdate) MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID 
group by CONCAT(FirstName, ' ', LastName) 
--TASK 8
SELECT CONCAT(FirstName, ' ', LastName) CustomerName,
       SUM(TotalAmount) OrderTotal
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY CONCAT(FirstName, ' ', LastName)
HAVING SUM(TotalAmount) > 500 

--TASK 9
SELECT p.ProductName,
       s.SaleDate,
	   s.SaleAmount
FROM Products p
JOIN Sales s
ON p.ProductID = s.ProductID
WHERE YEAR(Saledate) = 2022 
 OR Saleamount > 400
--TASK 10
SELECT ProductName,
       SUM(SaleAmount) TotalSalesAmount
FROM Products p 
JOIN Sales s
ON p.ProductID = s.ProductID
GROUP BY ProductName 
--TASK 11
SELECT Name EmployeeName,
       DepartmentName,
	   Salary
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE DepartmentName = 'Human Resources'
 AND Salary > 60000

--TASK 12
SELECT ProductName,
       SaleDate,
	   StockQuantity
FROM Products p
JOIN Sales s
ON p.ProductID = s.ProductID
WHERE YEAR (SaleDate) = 2023
 AND Stockquantity > 100

--TASK 13
SELECT NAME EmployeeName,
       DepartmentName,
	   HireDate
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE DepartmentName = 'Sales'
 OR Year(HireDate) > 2020
--TASK 14
SELECT CONCAT(FirstName, ' ', LastName) CustomerName,
       OrderID,
       Address,
	   OrderDate
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE Country = 'USA'
 AND Address LIKE '[1-9][1-9][1-9][1-9]%'
--TASK 15
SELECT ProductName,
       CategoryName Category,
	   Saleamount
FROM Products p 
JOIN Sales s ON p.ProductID = s.ProductID
JOIN Categories c ON p.Category = c.CategoryID
WHERE CategoryName  = 'Electronics'
OR Saleamount > 350

--TASK 16
SELECT CategoryName,
       COUNT(ProductID) ProductCount
FROM Products p
JOIN Categories c 
ON p.Category = c.CategoryID
GROUP BY C.CategoryName

--TASK 17
SELECT CONCAT(FirstName, ' ', LastName) CustomerName,
       City,
       OrderID,
       TotalAmount Amount
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE City = 'Los Angeles'
 AND TotalAmount > 300

--TASK 18
SELECT NAME EmployeeName,
       DepartmentName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE DepartmentName IN ('Human Resources', 'Finance')
 OR Name LIKE '%[aeiou]%'
--TASK 19
SELECT NAME EmployeeName,
       DepartmentName,
	   Salary
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE DepartmentName IN ('Sales', 'Marketing')
AND Salary > 60000

