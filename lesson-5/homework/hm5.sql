-- Homework 5
--TASK 1
SELECT ProductName AS Name
FROM Products
--TASK 2
SELECT * 
FROM Customers AS Client
--TASK 3
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted
--TASK 4
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;

--TASK 5
SELECT DISTINCT FirstName, LastName, Country
FROM Customers
--TASK 6
SELECT * ,
CASE 
    WHEN Price > 1000 THEN 'High'
	WHEN Price <= 1000 THEN 'Low'
	END AS Price_level
FROM Products
--TASK 7
SELECT ProductName,
       StockQuantity,
IIF (StockQuantity > 100, 'Yes', 'No') Stocks
FROM Products_Discounted
--TASK 8
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

--TASK 9
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;
--TASK 10
SELECT ProductName,
       Price,
IIF (Price > 1000, 'Expensive', 'Affordable') AS Price_level
FROM Products
--TASK 11
SELECT * FROM Employees
WHERE Age < 25 OR Salary > 60000
--TASK 12
UPDATE Employees 
SET Salary = Salary * 1.1
WHERE DepartmentName = 'HR' OR EmployeeID = 5
--TASK 13
SELECT *,
CASE WHEN SaleAmount > 500 THEN 'Top Tier'
     WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
	 ELSE 'Low Tier'
	 END Level
FROM Sales
--TASK 14
SELECT CustomerID FROM Orders
EXCEPT
SELECT CustomerID FROM Sales 

--TASK 15
SELECT CustomerID,
       Quantity,
CASE WHEN Quantity = 1 THEN '3%'
     WHEN Quantity BETWEEN 1 AND 3 THEN '5%'
	 ELSE '7%'
	 END AS 'discount percentage'
FROM Orders;
