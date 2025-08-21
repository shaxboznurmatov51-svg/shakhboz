-- Task 1 
CREATE TABLE Employees (EmpID int PRIMARY KEY, Name VARCHAR(50), Salary Decimal(10,2));
--Task 2 
--single row insert
Insert into Employees (EmpID, Name, Salary)
Values (1, 'Ali', 6000.00);
--Multiple row insert
Insert into Employees (EmpID, Name, Salary)
Values 
(2, 'Bexruz', 5500.00), 
(3, 'Doston', 5000.00);

--Task 3
update Employees
Set Salary = 7000
where EmpID = 1 

-- Task 4 
DELETE FROM Employees
WHERE EmpID = 2;

--Task 5
--Delete - Removes selected rows, can use Where and Transaction can Rollback;
-- Truncate- removes all rows and faster, cannot use WHERE, structure remains;
-- Drop- removes entire table (structure+data);

--Task 6
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

--Task 7
ALTER TABLE Employees
ADD Department VARCHAR(50);

--Task 8 
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

--Task 9 
CREATE TABLE Departments (
     DepartmentID INT PRIMARY KEY,
     DepartmentName VARCHAR (50)
);

--TASK 10
TRUNCATE TABLE Employees;

--TASK 11
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'HR' UNION ALL
SELECT 2, 'Finance' UNION ALL
SELECT 3, 'IT' UNION ALL
SELECT 4, 'Marketing' UNION ALL
SELECT 5, 'Sales';

--TASK 12
UPDATE TABLE Employees
SET Department = 'Management'
WHERE Salary > 5000;

--TASK 13
TRUNCATE TABLE Employees;

--TASK 14
ALTER TABLE Employees
DROP COLUMN Department;

--TASK 15
EXEC sp_rename 'Employees', 'StaffMembers';

--TASK 16
DROP TABLE Departments;

--TASK 17
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Manufacturer VARCHAR(100)
);
--TASK 18
ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

--TASK 19
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

--TASK 20
EXEC sp_rename 'Products.Category', 'ProductCategory';

--TASK 21
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Manufacturer)
VALUES
(1, 'Laptop', 'Electronics', 1200.00, 'Dell'),
(2, 'Phone', 'Electronics', 800.00, 'Samsung'),
(3, 'Table', 'Furniture', 200.00, 'IKEA'),
(4, 'Chair', 'Furniture', 100.00, 'IKEA'),
(5, 'Headphones', 'Electronics', 150.00, 'Sony');

--TASK 22
SELECT * INTO Products_Backup
FROM Products;

--TASK 23
EXEC sp_rename 'Products', 'Inventory';

--TASK 24
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

--TASK 25
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5);




























