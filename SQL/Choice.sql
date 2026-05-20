create DATABASE Choice;


use choice;

CREATE table employees (
    id INt PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2),
    joining_Date DATE
);

insert into employees(id, name, department, salary, joining_Date) VALUES(4,'Kiran', 'HR',45000.89, '2024-01-20' )


SELECT * from employees;

-- Find all employees whose salary is greater than 50000.
SELECT * from employees 
where salary > 50000;

-- Find employees from the HR department.
SELECT * FROM employees
where department = 'HR';

-- Display employees sorted by salary descending.
SELECT * from employees
ORDER BY salary DESC;

-- Find the second highest salary.

SELECT max(salary) FROM employees
WHERE salary <
(
    select MAX(salary)
    FROM employees
);

-- Count total employees department-wise.

SELECT department,  COUNT(*) as  total_Employees
from employees
GROUP BY department;

-- Find employees who joined in 2025.

SELECT name FROM employees
WHERE joining_Date LIKE '2025%'


-- Increase salary by 10% for IT department employees.
UPDATE employees 
set salary = salary * 1.10
where department = 'It'

-- Delete employees whose salary is below 20000.


DELETE from employees
WHERE salary < 20000;



-- Intermediate SQL Questions

CREATE TABLE customers (
    customer_id INT PRIMARY KEy,
    customer_name varchar(100),
    city varchar(100)
);

create TABLE orders(
    order_id int PRIMARY KEY,
    customer_id int,
    order_amount DECIMAL(10,2),
    order_date Date
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Amit Sharma', 'Pune'),
(2, 'Rahul Patil', 'Mumbai'),
(3, 'Sneha Joshi', 'Pune'),
(4, 'Priya Kale', 'Nashik'),
(5, 'Rahul Patil', 'Delhi'),
(6, 'Vikas More', 'Nagpur');

INSERT INTO orders (order_id, customer_id, order_amount, order_date) VALUES
(101, 1, 25000.00, '2026-01-10'),
(102, 1, 80000.00, '2026-02-15'),
(103, 2, 45000.00, '2026-01-20'),
(104, 2, 70000.00, '2026-03-05'),
(105, 3, 15000.00, '2026-02-12'),
(106, 3, 22000.00, '2026-03-18'),
(107, 5, 120000.00, '2026-04-01'),
(108, 1, 30000.00, '2026-04-10');

select * FROM customers;
SELECT * FROM orders;
-- Show all customers with their orders.

SELECT c.customer_id, c.customer_name, c.city, 
        o.order_id, o.order_amount, o.order_date
        from customers c  
        INNER JOIN orders o
        ON c.customer_id = o.customer_id;

-- Find customers who never placed orders
SELECT c.*
from customers c  
LEFT JOIN orders o  
On c.customer_id = o.order_id
WHERE o.order_id IS NULL;

-- Find total order amount customer-wise

SELECT c.customer_id, c.customer_name,
    SUM(o.order_amount) as total_Amount
from customers c
INNER JOIN orders o 
On c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Find top 3 customers by order amount

SELECT TOP 3 c.customer_name,
    SUM(o.order_amount) as total_amount
    from customers c
INNER JOIN orders o 
on c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_amount DESC;

--  find customers whoes total order exceed 1lakh

SELECT c.customer_name,
       SUM(o.order_amount) AS total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.order_amount) > 100000;






