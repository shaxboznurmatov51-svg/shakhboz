--TASK 1
WITH region AS (
SELECT DISTINCT REGION FROM #RegionSales
),
 distributors AS (
 SELECT DISTINCT Distributor FROM #RegionSales
 )
 SELECT r.Region,
        d.Distributor,
		ISNULL(re.Sales,0) AS sales
 FROM region r
 CROSS JOIN distributors d
 LEFT JOIN #RegionSales re
 ON re.Region = r.Region
 AND d.Distributor = re.Distributor

--TASK 2
SELECT NAME FROM Employee
WHERE id IN(
SELECT managerId
FROM Employee
GROUP BY managerId
HAVING COUNT(*) >=5
)
--TASK 3
SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
--TASK 4
SELECT CustomerID, Vendor
FROM (
    SELECT 
        CustomerID,
        Vendor,
        COUNT(*) AS OrderCount,
        RANK() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rnk
    FROM Orders
    GROUP BY CustomerID, Vendor
) ranked
WHERE rnk = 1;

--TASK 5
DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2, @isPrime BIT = 1;

WHILE @i <= SQRT(@Check_Prime)
BEGIN
    IF @Check_Prime % @i = 0
    BEGIN
        SET @isPrime = 0;
        BREAK;
    END
    SET @i += 1;
END

IF @isPrime = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';
--TASK 6
WITH cte AS (
    SELECT 
        Device_id,
        Locations,
        COUNT(*) AS signal_count
    FROM Device
    GROUP BY Device_id, Locations
)
, total AS (
    SELECT 
        Device_id,
        COUNT(DISTINCT Locations) AS no_of_location,
        SUM(signal_count) AS no_of_signals
    FROM cte
    GROUP BY Device_id
)
SELECT 
    t.Device_id,
    t.no_of_location,
    c.Locations AS max_signal_location,
    t.no_of_signals
FROM total t
JOIN cte c 
    ON t.Device_id = c.Device_id
    AND c.signal_count = (
        SELECT MAX(signal_count) FROM cte x WHERE x.Device_id = c.Device_id
    );
--TASK 7
SELECT 
    e.EmpID,
    e.EmpName,
    e.Salary
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(Salary) FROM Employee WHERE DeptID = e.DeptID
);

--TASK 8
WITH TicketMatches AS (
    SELECT 
        t.TicketID,
        COUNT(*) AS Matched
    FROM Tickets t
    JOIN Numbers n ON t.Number = n.Number
    GROUP BY t.TicketID
)
SELECT 
    SUM(CASE 
        WHEN Matched = (SELECT COUNT(*) FROM Numbers) THEN 100
        WHEN Matched > 0 THEN 10
        ELSE 0 
    END) AS Total_Winnings
FROM TicketMatches;

--TASK 9
--TASK 10
WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
    UNION ALL SELECT 10
)
SELECT 
    g.Product,
    1 AS Quantity
FROM Grouped g
JOIN Numbers n ON n.n <= g.Quantity
ORDER BY g.Product;
