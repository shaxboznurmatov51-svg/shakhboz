-- 1. All combinations of product names and supplier names
SELECT p.ProductName, s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;

-- 2. All combinations of departments and employees
SELECT d.DepartmentName, e.Name AS EmployeeName
FROM Departments d
CROSS JOIN Employees e;

-- 3. Only combinations where supplier supplies the product
SELECT s.SupplierName, p.ProductName
FROM Suppliers s
INNER JOIN Products p ON s.SupplierID = p.SupplierID;

 -- 4. Customer names and their order IDs
SELECT c.FirstName + ' ' + c.LastName AS CustomerName, o.OrderID
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

--5.All combinations of students and courses 
SELECT s.Name, c.CourseName
FROM Students s
CROSS JOIN Courses c;

-- 6. Product names and orders where ProductIDs match
SELECT p.ProductName, o.OrderID
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID;

-- 7. Employees whose DepartmentID matches the department
SELECT e.Name, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

--Task 8.
SELECT s.Name, e.CourseID
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID;

--Task 9.
SELECT o.OrderID, p.PaymentID, p.Amount
FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID;

--Task 10.
SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID
WHERE p.Price > 100

--Task 11.
SELECT e.Name, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID <> d.DepartmentID;

--Task 12.
SELECT o.OrderID, p.ProductName, o.Quantity, p.StockQuantity
FROM Orders o 
INNER JOIN Products p ON o.ProductID = p.ProductID
WHERE o.Quantity > p.StockQuantity

--Task 13
SELECT c.FirstName +' ' + c.LastName as CustomerName, s.productid,
FROM Customers c
INNER JOIN Sales s ON c.CustomerID = s.CustomerID
where s.SaleAmount >= 500 

--Task 14
SELECT s.Name, c.CourseName
FROM Students s 
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

--Task 15
SELECT p.ProductName, s.SupplierName
 FROM Products p
 INNER JOIN Suppliers s ON  p.SupplierID = s.SupplierID
 WHERE s.SupplierName LIKE '%TECH%';

--Task 16
SELECT o.OrderID, o.TotalAmount, p.Amount
FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount;

--Task 17
SELECT e.Name, d.DepartmentName
FROM Departments d
INNER JOIN Employees e ON d.DepartmentID = e.DepartmentID;
--Task 18
SELECT p.ProductName, c.CategoryName
 FROM Products p
 INNER JOIN Categories c ON p.Category = c.CategoryID 
 WHERE c.CategoryName IN ('Electronics','Furniture');

--Task 19
SELECT s.SaleID, s.ProductID, c.FirstName +' '+c.LastName AS CustomerName
 FROM Sales s
 INNER JOIN Customers c ON s.CustomerID = c.CustomerID
 WHERE c.Country = 'USA';

--Task 20
SELECT o.OrderID, c.Firstname +' '+ c.LastName AS CustomerName, o.ProductID, o.TotalAmount
 FROM Orders o 
 INNER JOIN  Customers c ON o.CustomerID = c.CustomerID 
 WHERE c.Country = 'Germany' AND o.TotalAmount > 100;

--Task 21
SELECT e1.Name AS Employee1, e2.Name AS Employee2
FROM Employees e1
INNER JOIN Employees e2 ON e1.EmployeeID <> e2.EmployeeID
WHERE e1.DepartmentID <> e2.DepartmentID;

--Task 22
SELECT o.OrderID,o.CustomerID, pr.ProductName, pa.Amount AS PaidAmount
FROM Payments pa
INNER JOIN Orders o ON pa.OrderID = o.OrderID
INNER JOIN Products pr ON o.ProductID = pr.ProductID
WHERE pa.Amount <> (o.Quantity * pr.Price);

--Task 23
SELECT s.Name
FROM Students s
LEFT JOIN  Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL

--Task 24
SELECT m.Name AS ManagerName, e.Name AS EmployeeName,  m.Salary AS ManagerSalary, e.Salary AS EmployeeSalary
FROM Employees e
INNER JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary

--Task 25
SELECT DISTINCT c.FirstName + ' ' + c.LastName AS CustomerName
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.OrderID IS NULL;

































