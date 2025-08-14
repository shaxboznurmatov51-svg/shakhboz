--task-1
/*Data: Raw facts and figures without context (e.g., "25", "John").
Database: An organized collection of data stored and managed electronically.
Relational Database: A database that stores data in tables with rows and columns, using relationships between tables.
Table: A structured set of data made up of rows (records) and columns (fields).*/
--task-2
/*High Performance – Optimized for large-scale data processing.
Security – Supports authentication, encryption, and role-based access control.
Scalability – Handles small to enterprise-level databases.
Data Recovery – Backup and restore capabilities to prevent data loss.
Integration Tools – Works with BI tools, reporting services, and data transformation.*/
--task-3
/*1.Windows Authentication Mode – Uses your Windows account credentials.
2.SQL Server Authentication Mode – Uses a SQL Server username and password.*/
--task-4
CREATE DATABASE SchoolDB;
--task-5
  CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
--task-6
--SQL Server: The database management system (DBMS) that stores and processes data.
--SSMS (SQL Server Management Studio): The graphical interface/tool used to manage SQL Server databases.
--SQL: The programming language used to query and manipulate databases.
--task-7
DQL (Data Query Language): SELECT * FROM Students;
DML (Data Manipulation Language): INSERT INTO Students VALUES (1, 'Ali', 20);
DDL (Data Definition Language): CREATE TABLE Teachers (TeacherID INT PRIMARY KEY, Name VARCHAR(50));
DCL (Data Control Language): GRANT SELECT ON Students TO User1;
TCL (Transaction Control Language):BEGIN TRANSACTION;
UPDATE Students SET Age = 21 WHERE StudentID = 1;
COMMIT;
--task-8
INSERT INTO Students (StudentID, Name, Age)
VALUES 
(1, 'Ali', 20),
(2, 'Madina', 22),
(3, 'Sardor', 19);

