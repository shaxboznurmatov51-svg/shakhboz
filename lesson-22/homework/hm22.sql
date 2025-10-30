--TASK 1
SELECT sale_id, customer_name, order_date, total_amount,
SUM(total_amount) OVER(PARTITION BY customer_id ORDER BY order_date) running_total
FROM sales_data
--TASK 2
SELECT *,
COUNT(*) OVER(PARTITION BY PRODUCT_CATEGORY) total_orders
FROM sales_data
--TASK 3
SELECT 
    product_category,
    product_name,
    total_amount,
	MAX(TOTAL_AMOUNT) OVER(PARTITION BY product_category) AS MAX
FROM sales_data;
--TASK 4
SELECT 
    product_category,
    product_name,
    unit_price,
	MIN(unit_price) OVER(PARTITION BY product_category) AS MIN
FROM sales_data;
--TASK 5
SELECT order_date,
    total_amount,
AVG(TOTAL_AMOUNT) OVER(ORDER BY ORDER_DATE ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AVG
FROM sales_data
--TASK 6
SELECT customer_name,
    total_amount,
	region, 
SUM(TOTAL_AMOUNT) OVER(PARTITION BY REGION) TR
FROM sales_data
--TASK 7
SELECT customer_id,
       customer_name,
	SUM(TOTAL_AMOUNT) total,
	DENSE_RANK() OVER(ORDER BY SUM(TOTAL_AMOUNT) desc) DR
FROM sales_data
GROUP BY customer_id,customer_name

--TASK 8
SELECT SALE_ID, CUSTOMER_NAME, TOTAL_AMOUNT,
TOTAL_AMOUNT-LAG(TOTAL_AMOUNT) OVER(PARTITION BY CUSTOMER_ID ORDER BY ORDER_DATE) DIFF
FROM sales_data
--TASK 9
SELECT * FROM (
SELECT PRODUCT_CATEGORY, PRODUCT_NAME, unit_price,
DENSE_RANK() OVER(PARTITION BY PRODUCT_CATEGORY ORDER BY unit_price DESC) DR
FROM sales_data
) AS X
WHERE DR <=3

--TASK 10
SELECT 
    region,
    order_date,
    total_amount,
    SUM(total_amount) OVER(PARTITION BY region ORDER BY order_date) AS cumulative_sales
FROM sales_data

--TASK 11
SELECT 
    product_category,
    order_date,
    total_amount,
    SUM(total_amount) OVER(PARTITION BY product_category ORDER BY order_date) AS cumulative_revenue
FROM sales_data
--TASK 12
SELECT 
    ID,
    SUM(ID) OVER(ORDER BY ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS SumPreValues
FROM Numbers;
--TASK 13
SELECT VALUE,
SUM(VALUE) OVER(ORDER BY VALUE ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) PV
FROM OneColumn
--TASK 14
SELECT 
    customer_id,
    customer_name
	FROM sales_data
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_category) > 1;

--TASK 15
WITH CTE AS(
SELECT CUSTOMER_NAME,
REGION,
SUM(TOTAL_AMOUNT) AS TOTAL
FROM sales_data
GROUP BY CUSTOMER_NAME, REGION
),
CTE2 AS(
SELECT *,
AVG(TOTAL) OVER(PARTITION BY REGION) AVGS
FROM CTE
)
SELECT * FROM CTE2
WHERE TOTAL> AVGS 
--TASK 16
SELECT REGION,CUSTOMER_NAME,
SUM(TOTAL_AMOUNT) total_spending,
RANK() OVER(PARTITION BY REGION ORDER BY SUM(TOTAL_AMOUNT) DESC ) RANKING
FROM sales_data
GROUP BY REGION,CUSTOMER_NAME

--TASK 17
SELECT customer_id, CUSTOMER_NAME, TOTAL_AMOUNT, ORDER_DATE,
SUM(TOTAL_AMOUNT) OVER(PARTITION BY CUSTOMER_ID ORDER BY ORDER_DATE) RUNNING_TOTAL
FROM sales_data
--TASK 18
--TASK 19
WITH CTE AS(
SELECT customer_id, CUSTOMER_NAME, ORDER_DATE, TOTAL_AMOUNT,
LAG(TOTAL_AMOUNT) OVER(PARTITION BY CUSTOMER_ID ORDER BY ORDER_DATE) PRV
FROM sales_data
)
SELECT * FROM CTE
WHERE total_amount> PRV
--TASK 20
SELECT * FROM (
SELECT product_name, unit_price,
AVG(UNIT_PRICE) OVER() AVGP
FROM sales_data
) X
WHERE unit_price > AVGP 
--TASK 21
WITH CTE AS (
    SELECT 
        Id,
        Grp,
        Val1,
        Val2,
        SUM(Val1 + Val2) OVER(PARTITION BY Grp) AS Tot,
        ROW_NUMBER() OVER(PARTITION BY Grp ORDER BY Id) AS rn
    FROM MyData
)
SELECT 
    Id, 
    Grp, 
    Val1, 
    Val2,
    CASE WHEN rn = 1 THEN Tot END AS Tot
FROM CTE
ORDER BY Grp, Id;
--TASK 22
SELECT 
    ID,
    SUM(Cost) AS Cost,
    SUM( DISTINCT Quantity) AS Quantity
FROM TheSumPuzzle
GROUP BY ID;
--TASK 23
WITH Gaps AS (
    SELECT 
        SeatNumber,
        LAG(SeatNumber) OVER(ORDER BY SeatNumber) AS PrevSeat
    FROM Seats
)
SELECT 
    ISNULL(PrevSeat + 1, 1) AS [Gap Start],
    SeatNumber - 1 AS [Gap End]
FROM Gaps
WHERE PrevSeat IS NULL OR SeatNumber - PrevSeat > 1;
