--EASY TASKS
--TASK 1 
WITH NUMBERS AS(
SELECT 1 AS NUM
  UNION ALL
SELECT NUM + 1 
FROM NUMBERS 
WHERE NUM < 1000) 
SELECT * NUMBERS
OPTION (MAXRECURSION,0)
  
  --TASK 2
SELECT CONCAT(e.firstName, ' ', e.LastName) FullName,
       Total.TotalSales
FROM Employees e
JOIN (SELECT employeeID,
      SUM(SalesAmount) TotalSales 
      FROM Sales 
	  GROUP BY employeeID) AS Total
ON e.EmployeeID = Total.EmployeeID
--TASK 3
WITH AVG_SALARY AS (
SELECT AVG(SALARY) AS AVGS FROM EMPLOYEES 
)
SELECT * FROM AVG_SALARY 
--TASK 4 
SELECT p.ProductID, p.ProductName, m.highestSales
FROM products p
JOIN (
   SELECT productID, MAX(salesamount) AS highestSales FROM sales 
   GROUP BY productID 
   ) AS m
ON p.productID = m.productID 
--TASK 5 
WITH NUMBER AS (
 SELECT 1 AS NUM
 UNION ALL 
 SELECT NUM * 2 
 FROM NUMBER 
 WHERE NUM*2 < 1000000)
 SELECT * FROM  NUMBER 
 OPTION (MAXRECURSION 0)
--TASK 6 
WITH SALES_COUNT AS (
 SELECT employeeID, COUNT (salesID) NUM_SALES
 FROM sales 
 GROUP BY employeeID
 HAVING COUNT (salesID)>5 )
 
SELECT * FROM EMPLOYEES E 
JOIN SALES_COUNT S
ON E.EmployeeID = S.EMPLOYEEID
--TASK 7 
WITH CTE AS (
SELECT DISTINCT PRODUCTID FROM SALES 
WHERE SalesAmount > 500)

SELECT * FROM Products P
JOIN CTE C
ON P.PRODUCTID = C.PRODUCTID

--TASK 8 
WITH CTE AS (
SELECT  AVG(SALARY) AVGSALARY
FROM EMPLOYEES 
)

SELECT * FROM EMPLOYEES E
JOIN CTE C
ON E.SALARY > C.AVGSALARY
--MEDIUM TASKS
--TASK 1 
SELECT  TOP 5 * FROM EMPLOYEES E
JOIN (
SELECT EMPLOYEEID,
       COUNT(SALESID) COUNTSALES
	   FROM SALES 
GROUP BY EMPLOYEEID) AS NUM_SALES 
ON E.EmployeeID = NUM_SALES.EmployeeID
ORDER BY COUNTSALES DESC

--TASK 2
SELECT dt.CategoryID, dt.totalsales FROM 
(
     SELECT p.categoryid,
			SUM(salesamount) totalsales
	 FROM sales s
	 JOIN products p
	 ON s.productid = p.productid
	 GROUP BY p.categoryid
 ) dt
--TASK 3
WITH FactorialCTE AS (
    SELECT Number, 1 AS i, CAST(1 AS BIGINT) AS fact
    FROM Numbers1
    WHERE Number >= 1
UNION ALL
SELECT f.Number, f.i + 1, f.fact * (f.i + 1)
    FROM FactorialCTE f
    WHERE f.i < f.Number
)
SELECT Number, MAX(fact) AS Factorial
FROM FactorialCTE
GROUP BY Number
ORDER BY Number
OPTION (MAXRECURSION 0);
--TASK 4 
WITH CharSplit AS (
    SELECT Id, String, 1 AS pos, SUBSTRING(String,1,1) AS ch
    FROM Example
    WHERE LEN(String) >= 1
 UNION ALL
SELECT cs.Id, cs.String, cs.pos + 1,
           SUBSTRING(cs.String, cs.pos + 1, 1)
    FROM CharSplit cs
    WHERE cs.pos < LEN(cs.String)
)
SELECT Id, pos, ch
FROM CharSplit
ORDER BY Id, pos
OPTION (MAXRECURSION 0);
--TASK 5 
--TASK 6 
SELECT e.EmployeeID, e.FirstName, e.LastName, dt.SaleYear, dt.Qtr, dt.TotalSales
FROM (
    SELECT EmployeeID,
           DATEPART(YEAR, SaleDate) AS SaleYear,
           DATEPART(QUARTER, SaleDate) AS Qtr,
           SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(YEAR, SaleDate), DATEPART(QUARTER, SaleDate)
    HAVING SUM(SalesAmount) > 45000
) AS dt
JOIN Employees e ON e.EmployeeID = dt.EmployeeID
--DIFFUCLT TASKS 
--TASK 1 
--TASK 2
SELECT *
FROM FindSameCharacters
WHERE Vals IS NOT NULL
  AND LEN(Vals) > 1
  AND Vals = REPLICATE(LEFT(Vals, 1), LEN(Vals));

--TASK 3 
DECLARE @N INT = 5;

WITH Seq AS (
    SELECT 1 AS n, CAST('1' AS VARCHAR(100)) AS seqstr
    UNION ALL
    SELECT n + 1, seqstr + CAST(n + 1 AS VARCHAR(10))
    FROM Seq
    WHERE n < @N
)
SELECT n, seqstr
FROM Seq
ORDER BY n
OPTION (MAXRECURSION 0);

--TASK 4 
--TASK 5
