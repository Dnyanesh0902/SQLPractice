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
- SQL Interview Questions & Answers

---

# 🛠 Technologies Used

- SQL Server
- T-SQL
- SSMS
- VS Code SQL Extension

---

# 📂 Database Structure

## 1. Department Table

### Definition

Stores department details.

```sql
CREATE TABLE Department(
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(200)
);
```

---

## 2. Employees Table

### Definition

Stores employee information such as salary, city, and joining date.

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

### Definition

Stores project details assigned to employees.

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

# 🚀 SQL Concepts with Interview Questions & Answers

# ✅ SELECT Statement

## Definition

SELECT is used to retrieve data from a database table.

## Example

```sql
SELECT * FROM Employees;
```

## Interview Question

### Q: What is SELECT in SQL?

### Answer

SELECT is used to fetch data from one or more tables.

---

# ✅ WHERE Clause

## Definition

WHERE filters records based on conditions.

## Example

```sql
SELECT * FROM Employees
WHERE Salary > 50000;
```

## Interview Question

### Q: What is WHERE clause used for?

### Answer

WHERE clause filters rows based on specified conditions.

---

# ✅ ORDER BY

## Definition

ORDER BY sorts records in ascending or descending order.

## Example

```sql
SELECT * FROM Employees
ORDER BY Salary DESC;
```

## Interview Question

### Q: What is ORDER BY?

### Answer

ORDER BY is used to sort query results.

---

# ✅ LIKE Operator

## Definition

LIKE is used for pattern matching.

## Example

```sql
SELECT * FROM Employees
WHERE Employeename LIKE 'A%';
```

## Interview Question

### Q: What is LIKE operator?

### Answer

LIKE is used to search records using patterns.

Example:
- A% → starts with A
- %A → ends with A
- %A% → contains A

---

# ✅ Aggregate Functions

## Definition

Aggregate functions perform calculations on data.

## Types

- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

## Example

```sql
SELECT AVG(Salary) FROM Employees;
```

## Interview Question

### Q: What are aggregate functions?

### Answer

Aggregate functions perform calculations on multiple rows and return a single value.

---

# ✅ GROUP BY

## Definition

GROUP BY groups rows with the same values.

## Example

```sql
SELECT City, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY City;
```

## Interview Question

### Q: Why GROUP BY is used?

### Answer

GROUP BY groups similar records together for aggregate operations.

---

# ✅ HAVING Clause

## Definition

HAVING filters grouped data.

## Example

```sql
SELECT City, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY City
HAVING COUNT(*) > 1;
```

## Interview Question

### Q: Difference between WHERE and HAVING?

| WHERE | HAVING |
|---|---|
| Filters rows | Filters grouped records |
| Used before GROUP BY | Used after GROUP BY |

---

# ✅ INNER JOIN

## Definition

Returns matching records from both tables.

## Example

```sql
SELECT e.Employeename, d.DepartmentName
FROM Employees e
INNER JOIN Department d
ON d.DepartmentId = e.DepartmentID;
```

## Interview Question

### Q: What is INNER JOIN?

### Answer

INNER JOIN returns only matching records from both tables.

---

# ✅ LEFT JOIN

## Definition

Returns all records from the left table and matching records from the right table.

## Example

```sql
SELECT e.Employeename, d.DepartmentName
FROM Employees e
LEFT JOIN Department d
ON d.DepartmentId = e.DepartmentID;
```

## Interview Question

### Q: What is LEFT JOIN?

### Answer

LEFT JOIN returns all records from the left table even if there are no matches in the right table.

---

# ✅ Subqueries

## Definition

A query inside another query is called a subquery.

## Example

```sql
SELECT Employeename, Salary
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);
```

## Interview Question

### Q: What is Subquery?

### Answer

A query written inside another query is called a subquery.

---

# ✅ Stored Procedures

## Definition

Stored Procedure is a reusable SQL block stored in the database.

## Example

```sql
CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT * FROM Employees;
END;
```

## Execute Procedure

```sql
EXEC GetAllEmployees;
```

## Interview Question

### Q: What is Stored Procedure?

### Answer

A Stored Procedure is a precompiled SQL statement that can be executed multiple times.

---

# ✅ Triggers

## Definition

Triggers automatically execute when INSERT, UPDATE, or DELETE operations occur.

## Example

```sql
CREATE TRIGGER trgAfterInsertEmployee
ON Employees
AFTER INSERT
AS
BEGIN
    PRINT 'New Employee Inserted Successfully';
END;
```

## Interview Question

### Q: What is Trigger?

### Answer

A Trigger is a special type of stored procedure that executes automatically when database events occur.

---

# ✅ Advanced SQL Queries

# Find Second Highest Salary

```sql
SELECT MAX(Salary)
FROM Employees
WHERE Salary <
(
    SELECT MAX(Salary)
    FROM Employees
);
```

## Interview Question

### Q: How to find second highest salary?

### Answer

Use subquery with MAX() function.

---

# Find Top 3 Highest Paid Employees

```sql
SELECT TOP 3 *
FROM Employees
ORDER BY Salary DESC;
```

## Interview Question

### Q: How to fetch top records in SQL Server?

### Answer

Use TOP keyword.

Example:

```sql
SELECT TOP 5 * FROM Employees;
```

---

# Find Employees Above Average Salary

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

# 📚 Important SQL Interview Questions

# 1. What is SQL?

### Answer

SQL stands for Structured Query Language used to manage relational databases.

---

# 2. What is Primary Key?

### Answer

Primary Key uniquely identifies each row in a table.

Example:

```sql
DepartmentId INT PRIMARY KEY
```

---

# 3. What is Foreign Key?

### Answer

Foreign Key creates relationship between two tables.

---

# 4. Difference Between DELETE, TRUNCATE, and DROP?

| DELETE | TRUNCATE | DROP |
|---|---|---|
| Deletes rows | Removes all rows | Deletes table |
| WHERE allowed | WHERE not allowed | Removes structure |

---

# 5. What is Normalization?

### Answer

Normalization reduces data redundancy and improves database structure.

---

# 6. What is ACID Property?

## Answer

### A → Atomicity
Transaction fully completes or rolls back.

### C → Consistency
Database remains valid.

### I → Isolation
Transactions do not affect each other.

### D → Durability
Committed data is permanently saved.

---

# 📚 SQL Concepts Practiced

- SELECT
- WHERE
- ORDER BY
- LIKE
- GROUP BY
- HAVING
- Aggregate Functions
- Joins
- Subqueries
- Stored Procedures
- Triggers
- CRUD Operations

---

# ▶️ How to Run

1. Open SQL Server Management Studio (SSMS)
2. Create new query window
3. Copy complete SQL script
4. Execute step-by-step

---

# 📌 Author

## Dnyaneshwar Kokate

💻 Backend Developer  
🚀 ASP.NET Core | SQL Server | React | Go

- GitHub: https://github.com/Dnyanesh0902
- LinkedIn: https://www.linkedin.com/in/dnyaneshwar-kokate-04a12b258/