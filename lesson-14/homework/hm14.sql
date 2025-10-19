--EASY TASKS
--TASK 1 
SELECT ID,
       LEFT(NAME, CHARINDEX(',', NAME)-1) AS FIRSTNAME,
     RIGHT(NAME, LEN(NAME) - CHARINDEX(',', NAME)) AS LASTNAME
FROM TestMultipleColumns
--TASK 2
SELECT *
FROM TestPercent
WHERE Strs LIKE '%[%]%';

--TASK 3 
SELECT LEFT(Vals, CHARINDEX('.', Vals)-1),
       RIGHT(Vals, LEN(Vals) - CHARINDEX('.', Vals))
FROM Splitter

--TASK 4 
SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals,'.','')) > 2
--TASK 5 
SELECT *,
LEN(TEXTS) - LEN(REPLACE(Texts, ' ', '')) AS SpaceCount
FROM CountSpaces
--TASK 6 
SELECT e.Name AS EmployeeName, e.Salary AS EmployeeSalary, m.Name AS ManagerName, m.Salary AS ManagerSalary 
FROM Employee e
JOIN Employee m
ON e.MANAGERID = m.ID
WHERE e.SALARY > m.SALARY
--TASK 7 
SELECT EMPLOYEE_ID,
       FIRST_NAME,
     LAST_NAME,
     HIRE_DATE,
     DATEDIFF (YEAR, HIRE_DATE, GETDATE()) AS YEARS_OF_SERVICE
FROM Employees 
WHERE DATEDIFF (YEAR, HIRE_DATE, GETDATE()) BETWEEN 11 AND 14

--MEDIUM TASKS
--TASK 1 
SELECT Id, RecordDate, Temperature
FROM (
  SELECT *,
         LAG(Temperature) OVER (ORDER BY RecordDate) AS PrevTemp
  FROM weather
) w
WHERE PrevTemp IS NOT NULL
  AND Temperature > PrevTemp;
--TASK 2 
SELECT PLAYER_ID,
       MIN(EVENT_DATE) FIRST_LOGIN_DATE
FROM ACTIVITY
GROUP BY PLAYER_ID
--TASK 3 
SELECT PARSENAME(REPLACE(FRUIT_LIST,',','.'),2) AS THIRDITEM
FROM FRUITS
--TASK 4 
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE,
CASE WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'NEW HIRE'
     WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 4 THEN 'JUNIOR'
   WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 5 AND 9 THEN 'MID-LEVEL'
   WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 19 THEN 'SENIOR'
   ELSE 'VETERAN' END AS STAGE 
FROM EMPLOYEES 
--TASK 5 
SELECT ID, VALS,
CASE WHEN PATINDEX('[0-9]%', VALS) <> 1 THEN NULL
     ELSE CAST(LEFT(VALS, PATINDEX('%[^0-9]%', VALS +'x') - 1) AS INT)
     END AS FIRSTINT
FROM GetIntegers
--HARD TASKS
--TASK 1 
SELECT Id,
       CASE 
         WHEN CHARINDEX(',', Vals) = 0 THEN Vals
         ELSE SUBSTRING(Vals, CHARINDEX(',', Vals) + 1,
                     CASE WHEN CHARINDEX(',', Vals, CHARINDEX(',', Vals) + 1) = 0
                          THEN LEN(Vals) - CHARINDEX(',', Vals)
                          ELSE CHARINDEX(',', Vals, CHARINDEX(',', Vals) + 1) - CHARINDEX(',', Vals) - 1
                     END
           )
           + ',' +
           SUBSTRING(Vals, 1, CHARINDEX(',', Vals) - 1)
           + ISNULL(
               CASE WHEN CHARINDEX(',', Vals, CHARINDEX(',', Vals) + 1) = 0
                    THEN ''
                    ELSE SUBSTRING(Vals, CHARINDEX(',', Vals, CHARINDEX(',', Vals) + 1), LEN(Vals))
               END, '')
       END AS SwappedVals
FROM MultipleVals;

--TASK 2 
--TASK 3 
--TASK 4
DECLARE @s VARCHAR(200) = 'rtcfvty34redt';

;WITH N AS (
  SELECT TOP (LEN(@s)) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
  FROM sys.all_objects
)
SELECT
  (SELECT SUBSTRING(@s, n, 1)
   FROM N
   WHERE SUBSTRING(@s, n, 1) LIKE '[0-9]'
   ORDER BY n
   FOR XML PATH(''), TYPE).value('.', 'varchar(max)') AS Digits,
  (SELECT SUBSTRING(@s, n, 1)
   FROM N
   WHERE SUBSTRING(@s, n, 1) NOT LIKE '[0-9]'
   ORDER BY n
   FOR XML PATH(''), TYPE).value('.', 'varchar(max)') AS Letters;
