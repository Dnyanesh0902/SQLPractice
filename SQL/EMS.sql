create DATABASE EMS;

use EMS;

create TABLE Department(
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(200)
);


CREATE TABLE Employees(
    Employeeid int PRIMARY KEY,
    Employeename VARCHAR(200),
    DepartmentID int,
    Salary DECIMAL(12,3),
    City VARCHAR(200),
    JoiningDate DATE
);


CREATE TABLE Projects(
    ProjectId Int PRIMARY KEY,
    ProjectName varchar(100),
    EmployeeId int,
    ProjectCost DECIMAL(12,2)
);


INSERT into Department(DepartmentId, DepartmentName) VALUES(1,'IT'),(2,'HR'),(3,'Finance'),(4,'Sales');

SELECT * from Department;


INSERT INTO Employees VALUES
(101, 'Amit', 1, 50000, 'Pune', '2023-01-10'),
(102, 'Rahul', 1, 75000, 'Mumbai', '2022-05-12'),
(103, 'Sneha', 2, 40000, 'Pune', '2021-08-15'),
(104, 'Priya', 3, 65000, 'Delhi', '2020-02-20'),
(105, 'Vikas', 4, 30000, 'Nagpur', '2023-09-25'),
(106, 'Neha', 1, 85000, 'Pune', '2019-03-18'),
(107, 'Kiran', 2, 28000, 'Mumbai', '2024-01-01'),
(108, 'Rohit', NULL, 45000, 'Nashik', '2022-11-11');


SELECT * FROM Employees;


INSERT INTO Projects VALUES
(1, 'Banking App', 101, 500000),
(2, 'HR Portal', 103, 200000),
(3, 'Sales CRM', 105, 300000),
(4, 'Finance Tool', 104, 450000),
(5, 'Ecommerce', 102, 600000),
(6, 'Inventory', 101, 150000);

SELECT * FROM Projects;

-- SQL Tasks (Assignment)
-- Basic level

-- Task 1
-- Show all employees.

SELECT * from Employees;

-- Task 2
-- Show only employee name and salary.

SELECT Employeename, salary from Employees;

-- Task 3
-- Show employees whose salary is greater than 50000.

SELECT * from Employees 
where Salary > 50000;

-- Task 4
-- Show employees from Pune city.

SELECT * FROM Employees
WHERE City = 'Pune';

-- Task 5
-- Sort employees by salary descending order.

SELECT * FROM Employees
ORDER BY Salary DESC;

-- Task 6
-- Find employees whose name starts with 'A'.

SELECT * FROM Employees 
where Employeename LIKE 'A%';

-- Task 7
-- Find employees whose city ends with 'i'.

SELECT * FROM Employees
WHERE City LIKE '%i';

-- INTERMEDIATE LEVEL
-- Task 8
-- Find total number of employees.

SELECT COUNT(*) FROM Employees; 

-- Task 9
-- Find average salary.
SELECT AVG(salary) from Employees;

-- Task 10
-- Find maximum salary.

SELECT MAX(salary) FROM Employees;

-- Task 11
-- Find minimum salary.

SELECT MIN(salary) FROM Employees;

-- Task 12
-- Find total salary department wise.

SELECT d.DepartmentName, SUM(e.salary) as Total_salary
FROM Employees e 
INNER JOIN Department d  
on d.DepartmentId = e.DepartmentID
GROUP BY d.DepartmentName;


-- Task 13
-- Find departments having more than 2 employees.

SELECT d.DepartmentName, COUNT(e.Employeename) as TotalEmployees
FROM Employees e 
INNER JOIN Department d  
on d.DepartmentId = e.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.Employeeid) > 2;


-- Task 14

-- Show all employees with their department names.
-- (Use INNER JOIN)

SELECT e.Employeename, d.DepartmentName
from Employees e  
INNER JOIN Department d  
on d.DepartmentId = e.DepartmentID;

-- Task 15

-- Show all employees including employees without department.
-- (Use LEFT JOIN)

SELECT e.Employeename, d.DepartmentName
FROM Employees e 
LEFT JOIN Department d 
on d.DepartmentId = e.DepartmentID;


-- Task 16
-- Find employees who are not assigned to any department.

SELECT e.Employeename, d.DepartmentName
FROM Employees e
LEFT JOIN Department d 
ON d.DepartmentId = e.DepartmentID
WHERE d.DepartmentName  is null;

-- Task 17
-- Find employees who are working on projects.

SELECT e.Employeename, p.projectname
from Employees e  
INNER JOIN Projects p 
On e.Employeeid = p.EmployeeId;

-- Task 18
-- Show project name with employee name.

SELECT p.projectname, e.Employeename
from Projects p 
INNER JOIN Employees e  
ON p.EmployeeId = e.Employeeid;

-- ADVANCED LEVEL
-- Task 19
-- Find second highest salary.

SELECT MAX(salary) FROM Employees
WHERE Salary <(
    SELECT MAX(Salary) from Employees
);

-- Task 20
-- Find top 3 highest paid employees.
SELECT  TOP 3 * 
FROM Employees
ORDER BY Salary DESC;

-- Task 21
-- Find duplicate cities.

SELECT city, COUNT(*) AS TotalCount
 from Employees
 GROUP BY City
 HAVING COUNT(*)> 1;

-- Task 22
-- Find employees joined after 2022.
SELECT * from Employees
WHERE YEAR(JoiningDate) >2022;

-- Task 23
-- Find employee count city wise.

SELECT city, COUNT(*) as TotalEmployees
from Employees
GROUP BY City;

-- Task 24
-- Find highest salary department wise.

SELECT d.departmentname,
MAX(e.salary)as HighestSalary
FROM Employees e  
INNER JOIN Department d 
on d.DepartmentId = e.DepartmentID
GROUP BY d.DepartmentName;

-- Task 25

-- Find employees whose salary is above average salary.

SELECT Employeename, Salary
FROM Employees
WHERE Salary >(
    select  AVG(Salary)
    FROM Employees
);

-- Task 26

-- Find latest joined employee.
SELECT Employeename, JoiningDate 
FROM Employees
WHERE JoiningDate = (
    Select MAX(JoiningDate)
    FROM Employees
);

-- Task 27
-- Find employees who do not have projects.

SELECT e.employeename, p.projectname
FROM Employees e   
LEFT JOIN Projects p  
On e.Employeeid = p.EmployeeId
WHERE p.ProjectName is NULL;

-- Task 28
-- Find total project cost employee wise.

SELECT e.employeename, SUM(p.projectcost) as totalprojectCost
FROM Employees e 
INNER JOIN Projects p 
On e.Employeeid = p.EmployeeId
GROUP BY e.Employeename;


-- Task 29

-- Find employee with highest project cost.

SELECT e.Employeename, p.projectcost
from Employees e 
INNER JOIN Projects p
ON e.Employeeid = p.EmployeeId
WHERE p.ProjectCost = (
    SELECT MAX(projectcost)
    from Projects
);

-- Task 30

-- Delete employees whose salary is below 30000.

DELETE from Employees
WHERE Salary < 30000;

-- STORED PROCEDURE TASKS
-- Task 31
-- Create procedure to get all employees.

    CREATE PROCEDURE GetAllEmployees
    AS
    BEGIN
        SELECT * FROM Employees;
    END;

-- execute Store procedure

EXEC GetAllEmployees;
-- Task 32

-- Create procedure to get employee by ID.

CREATE PROCEDURE GetEmployeeById
     @id INT
AS
BEGIN
    SELECT * from Employees WHERE Employeeid = @id;
END;


EXEC GetEmployeeById @id = 101;
-- Task 33

-- Create procedure to insert employee.

CREATE PROCEDURE AddEmployee
        @id INT,
        @name VARCHAR(100),
        @deptid int,
        @salary DECIMAL(10,2),
        @city VARCHAR(100),
        @joiningDate DATE
AS 
BEGIN
    INSERT into Employees(Employeeid, Employeename, DepartmentID, Salary, City, JoiningDate) VALUES
    (@id, @name, @deptid, @salary, @city, @joiningDate);
END;
SELECT * from Employees;

-- Insert Record 
EXEC AddEmployee @id =110,@name='Ashish',@deptid=2,@salary=57000,@city='Sangamner',@joiningDate='2024-01-01'

Select * from Employees;


-- Trigger
CREATE TRIGGER trgAfterInsertEmployee
ON Employees
AFTER INSERT
AS 
BEGIN
    PRINT 'New Employee Inserted Successfully';
END;


-- Task 35

-- Create trigger after delete on Employees table.
CREATE TRIGGER trgAfterDeleteEmployee
On Employees
AFTER DELETE
AS 
BEGIN
    PRINT 'Employee Deleted Successfully';
END;

-- 
CREATE PROCEDURE DeleteEmployeeById
     @id INT
AS
BEGIN
    DELETE from Employees WHERE Employeeid = @id;
END;

EXEC DeleteEmployeeById @id=110;

-- Task 36

-- Find employees earning more than average salary.
SELECT Employeename, salary 
from Employees
Where Salary >(
    select AVG(Salary)
    FROM Employees
);

-- Task 37

-- Find employees working in IT department.
SELECT Employeename
FROM Employees
WHERE DepartmentID =
(
    SELECT DepartmentId
    FROM Department
    WHERE DepartmentName = 'IT'
);
-- (Using Subquery)

-- Task 38

-- Find employee with maximum salary.
SELECT Employeename, salary 
from Employees 
WHERE Salary =(
    select MAX(Salary) from Employees
);

-- (Using Subquery)

SELECT name FROM sys.databases;
GO