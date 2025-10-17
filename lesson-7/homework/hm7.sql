--HOMEWORK
--Aggregate Functions (MIN, MAX, COUNT, AVG, SUM)
--Filtering Aggregated Data with HAVING

--TASK 1
SELECT MIN(Price) AS Min_Price
FROM Products 
--TASK 2
SELECT MAX(Salary) AS Max_Salary 
FROM Employees
--TASK 3
SELECT COUNT(*) AS Total_rows
FROM Customers
--TASK 4
SELECT COUNT (DISTINCT Category) AS Unique_Category
FROM Products
--TASK 5
SELECT ProductID, SUM(SaleAmount) AS Total_Amount
FROM Sales
GROUP BY ProductID
HAVING ProductID = 7
--TASK 6
SELECT AVG(Age) AS Avg_Age
FROM Employees 
--TASK 7
SELECT DepartmentName, 
       COUNT(EmployeeID) AS Num_Emp
FROM Employees
GROUP BY DepartmentName
--TASK 8
SELECT Category,
       MIN(Price) AS MIN_Price,
       MAX(Price) AS Max_Price
  FROM Products
GROUP BY Category

--TASK 9
SELECT CustomerID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;

--TASK 10
SELECT DepartmentName,
       COUNT(EmployeeID) AS Num_Emp
  FROM Employees
GROUP BY  DepartmentName
HAVING COUNT(EmployeeID) > 5
--TASK 11
SELECT  
       p.Category,
SUM(s.SaleAmount) AS TotalSales,
AVG(s.SaleAmount) AS AvgSales
FROM Sales s
JOIN Products p 
ON s.ProductID = p.ProductID
GROUP BY p.Category
--TASK 12
SELECT DepartmentName,
COUNT(EmployeeID) AS Num_emp
FROM Employees
GROUP BY DepartmentName
HAVING DepartmentName = 'HR'
--TASK 13
SELECT DepartmentName,
MIN(Salary) AS MinSalary,
MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY DepartmentName
--TASK 14
SELECT DepartmentName,
AVG(Salary) AS AvgSalary
FROM Employees 
GROUP BY DepartmentName
--TASK 15
SELECT DepartmentName,
AVG(Salary) AS AvgSalary,
COUNT(*) AS Num_Emp
FROM Employees 
GROUP BY DepartmentName
--TASK 16
SELECT Category,
AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400
--TASK 17
SELECT YEAR(SaleDate) AS SaleYear,
SUM(SaleAmount) TotalSales
FROM Sales
GROUP BY  YEAR(SaleDate)
ORDER BY SaleYear
--TASK 18
SELECT CustomerID,
COUNT(OrderID) AS Num_Orders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) >=3
--TASK 19
SELECT DepartmentName,
AVG(Salary) AS AvgSalary
FROM Employees 
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000
--TASK 20
SELECT Category,
AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150
--TASK 21
SELECT CustomerID,
SUM(SaleAmount) AS Total_sales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500
--TASK 22
SELECT DepartmentName,
SUM(Salary) AS TotalSalary,
AVG(Salary) AS AvgSalary
FROM Employees 
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000
--TASK 23
SELECT custid,
SUM (freight) AS TotalAmount,
MIN (freight) AS LeastAmount
FROM TSQL2012.SALES.ORDERS
GROUP BY custid
HAVING SUM (freight) > 50
ORDER BY custid
--TASK 24
SELECT YEAR(OrderDate) AS YearSale,
	   MONTH (OrderDate) AS MonthSale,
       SUM(TotalAmount) AS TotalSales,
	   COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Orders 
GROUP BY YEAR(OrderDate),MONTH (OrderDate)
HAVING COUNT(DISTINCT ProductID) >=2
ORDER BY YearSale, MonthSale
--TASK 25
SELECT YEAR(OrderDate) AS OrderYear,
       MIN(Quantity) AS MinQuantity,
       MAX(Quantity) AS MaxQuantity
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
