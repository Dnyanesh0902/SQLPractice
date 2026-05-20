# Employee Management System SQL Practice

A complete SQL practice project covering:

- Database Creation
- CRUD Operations
- Joins
- Aggregate Functions
- Group By & Having
- Subqueries
- Stored Procedures
- Triggers
- Interview-Level SQL Queries

---

# 📌 Project Overview

This project demonstrates SQL concepts using an Employee Management System (EMS) database.

The project contains:

- Employees Table
- Department Table
- Projects Table

It also includes:

- Basic SQL Queries
- Intermediate Queries
- Advanced SQL Queries
- Stored Procedures
- Triggers
- Subqueries

---

# 🛠 Technologies Used

- SQL Server
- T-SQL
- SSMS
- VS Code SQL Extension

---

# 📂 Database Structure

## 1. Department Table

```sql
CREATE TABLE Department(
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(200)
);
```

---

## 2. Employees Table

```sql
CREATE TABLE Employees(
    Employeeid INT PRIMARY KEY,
    Employeename VARCHAR(200),
    DepartmentID INT,
    Salary DECIMAL(12,3),
    City VARCHAR(200),
    JoiningDate DATE
);
```

---

## 3. Projects Table

```sql
CREATE TABLE Projects(
    ProjectId INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    EmployeeId INT,
    ProjectCost DECIMAL(12,2)
);
```

---

# 📥 Sample Data

## Insert Department Data

```sql
INSERT INTO Department
VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Sales');
```

---

## Insert Employee Data

```sql
INSERT INTO Employees VALUES
(101, 'Amit', 1, 50000, 'Pune', '2023-01-10'),
(102, 'Rahul', 1, 75000, 'Mumbai', '2022-05-12'),
(103, 'Sneha', 2, 40000, 'Pune', '2021-08-15');
```

---

# 🚀 SQL Concepts Covered

# ✅ Basic Queries

- SELECT
- WHERE
- ORDER BY
- LIKE
- Aggregate Functions
- GROUP BY
- HAVING

Example:

```sql
SELECT * FROM Employees
WHERE Salary > 50000;
```

---

# ✅ Joins

## INNER JOIN

```sql
SELECT e.Employeename, d.DepartmentName
FROM Employees e
INNER JOIN Department d
ON d.DepartmentId = e.DepartmentID;
```

## LEFT JOIN

```sql
SELECT e.Employeename, d.DepartmentName
FROM Employees e
LEFT JOIN Department d
ON d.DepartmentId = e.DepartmentID;
```

---

# ✅ Advanced SQL Queries

## Find Second Highest Salary

```sql
SELECT MAX(Salary)
FROM Employees
WHERE Salary <
(
    SELECT MAX(Salary)
    FROM Employees
);
```

---

## Find Top 3 Highest Paid Employees

```sql
SELECT TOP 3 *
FROM Employees
ORDER BY Salary DESC;
```

---

## Find Employees Above Average Salary

```sql
SELECT Employeename, Salary
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);
```

---

# ✅ Stored Procedures

## Get All Employees

```sql
CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT * FROM Employees;
END;
```

Execute:

```sql
EXEC GetAllEmployees;
```

---

## Get Employee By ID

```sql
CREATE PROCEDURE GetEmployeeById
    @id INT
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE Employeeid = @id;
END;
```

---

# ✅ Triggers

## After Insert Trigger

```sql
CREATE TRIGGER trgAfterInsertEmployee
ON Employees
AFTER INSERT
AS
BEGIN
    PRINT 'New Employee Inserted Successfully';
END;
```

---

## After Delete Trigger

```sql
CREATE TRIGGER trgAfterDeleteEmployee
ON Employees
AFTER DELETE
AS
BEGIN
    PRINT 'Employee Deleted Successfully';
END;
```

---

# ✅ Subqueries

## Employees Working in IT Department

```sql
SELECT Employeename
FROM Employees
WHERE DepartmentID =
(
    SELECT DepartmentId
    FROM Department
    WHERE DepartmentName = 'IT'
);
```

---

# 📚 SQL Concepts Practiced

- Joins
- Subqueries
- Stored Procedures
- Triggers
- Aggregate Functions
- Group By
- Having
- Sorting
- Filtering
- CRUD Operations
- SQL Server Functions

---

# 🎯 Interview Topics Covered

- SQL Joins
- Subqueries
- GROUP BY vs HAVING
- Stored Procedures
- Triggers
- Aggregate Functions
- Primary Key
- Foreign Key
- SQL Optimization Basics

---

# ▶️ How to Run

1. Open SQL Server Management Studio (SSMS)
2. Create a new query window
3. Copy the complete SQL script
4. Execute queries step-by-step

---

# 📌 Author

## Dnyaneshwar Kokate

💻 Backend Developer  
🚀 ASP.NET Core | SQL Server | React | Go

- GitHub: https://github.com/Dnyanesh0902
- LinkedIn: https://www.linkedin.com/in/dnyaneshwar-kokate-04a12b258/