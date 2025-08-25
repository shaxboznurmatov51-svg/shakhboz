# Lesson 3: Importing and Exporting Data  

---

## 🟢 Easy-Level Tasks (10)  

--Task 1 
- `BULK INSERT` is used in SQL Server to quickly load a large amount of data from an external file (like `.txt` or `.csv`) directly into a database table.  
- It is faster than inserting rows one by one.  

---

--Task 2
- CSV (Comma-Separated Values)  
- TXT (Text files)  
- XLSX (Excel files)  
- XML (Extensible Markup Language)  

---

--Task 3

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
-- Task 4 
INSERT INTO Products (ProductID, ProductName, Price)
  VALUES 
(1,'Laptop',500),
(2,'TV', 600),
(3,'Phone', 400);

--Task 5
--The difference between Null and Not Null
--NULL: Means no value (unknown, missing, or not applicable).
--NOT NULL: Column must always contain a value (cannot be empty).

-- Task 6 
ALTER TABLE Products
ADD CONSTRAINT uq_productname UNIQUE (ProductName);

-- Task 7 
-- This query selects all products from the Products table
SELECT * FROM Products;

--Task 8 
ALTER TABLE Products
ADD CategoryID INT;

--Task 9
CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(50) UNIQUE);

--Task 10
--An IDENTITY column automatically generates unique sequential values for each row (like auto-increment).
-- Example: IDENTITY(1,1) starts at 1 and increments by 1.

--Task 11
BULK INSERT Products
FROM 'C:\data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

--Task 12 
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


--Task 13
--PRIMARY KEY:
--Ensures values are unique and not NULL.
--Only one per table.
--UNIQUE KEY:
--Ensures values are unique, but can allow NULL values (one per column).
--A table can have multiple unique keys.

--Task 14
ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

--Task 15 
ALTER TABLE Products 
ADD Stock INT NOT NULL DEFAULT 0;

--Task 16
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

--Task 17
--Ensures referential integrity by linking rows in one table to rows in another.
--Example: Products’ CategoryID must exist in Categories.CategoryID.
--Prevents orphan records and maintains consistenc

--Task 18
  CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY, 
    Name VARCHAR(50),
    Age INT CHECK (Age >=18)
    );

--Task 19
CREATE TABLE Orders (
  OrderID INT IDENTITY(100,10) PRIMARY KEY,
  OrderDate DATE
  );

--Task 20
CREATE TABLE OrderDetails (
  OrderID INT,
  ProductID INT,
  Quantity INT,
  PRIMARY KEY (OrderID, ProductID)
  );

--Task 21
--ISNULL(expr, replacement) → Replaces NULL with the given replacement value.
--COALESCE(expr1, expr2, …) → Returns the first non-NULL expression from a list.
--Example:
SELECT ISNULL(NULL, 'Default'); -- returns 'Default'
SELECT COALESCE(NULL, NULL, 'Value'); --returns 'Value'

--Task 22
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

--Task 23
CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);





























