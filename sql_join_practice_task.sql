-- Create a table to store employee data
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,           -- Unique ID for each employee
    employee_name VARCHAR(50),                -- Employee's full name
    department_id INT,                        -- ID of the department they work in
    salary DECIMAL(10, 2),                    -- Employee's salary
    hire_date DATE                            -- Date the employee was hired
);

-- Create a table to store department data
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,         -- Unique ID for each department
    department_name VARCHAR(50)               -- Name of the department (e.g., HR, IT)
);

-- Insert sample departments into the departments table
INSERT INTO departments (department_name) VALUES 
    ('HR'), 
    ('Marketing'), 
    ('Finance'), 
    ('IT'), 
    ('Sales'), 
    ('Engineering'), 
    ('Customer Support'), 
    ('Administration'), 
    ('Research'), 
    ('Quality Assurance');

-- Insert sample employees into the employees table
-- Each employee is assigned to one of the departments
INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES 
    ('John Doe', 1, 60000.00, '2022-01-10'),
    ('Jane Smith', 2, 75000.50, '2021-05-22'),
    ('Bob Johnson', 3, 80000.75, '2020-11-15'),
    ('Alice Williams', 4, 90000.25, '2019-08-03'),
    ('David Lee', 5, 65000.50, '2020-03-18'),
    ('Sara Brown', 6, 70000.00, '2021-09-28'),
    ('Mike Miller', 7, 55000.75, '2022-02-05'),
    ('Emily Davis', 8, 95000.00, '2018-12-12'),
    ('Chris Wilson', 9, 72000.50, '2020-06-30'),
    ('Amy White', 10, 68000.25, '2021-11-09'),
    ('John Johnson', 1, 62000.00, '2022-01-15'),
    ('Jessica Thompson', 2, 78000.50, '2021-06-05'),
    ('Michael Harris', 3, 85000.75, '2020-11-25'),
    ('Emma Martinez', 4, 92000.25, '2019-09-15'),
    ('James Taylor', 5, 67000.50, '2020-04-08'),
    ('Sophia Anderson', 6, 72000.00, '2021-10-10'),
    ('William Jackson', 7, 56000.75, '2022-02-10'),
    ('Olivia Nelson', 8, 97000.00, '2018-12-20'),
    ('Daniel White', 9, 73000.50, '2020-07-05'),
    ('Ava Wilson', 10, 69000.25, '2021-11-15'),
    ('Matthew Brown', 1, 63000.00, '2022-01-20'),
    ('Emily Garcia', 2, 76000.50, '2021-06-15'),
    ('Christopher Allen', 3, 86000.75, '2020-12-05'),
    ('Madison Hall', 4, 93000.25, '2019-09-25'),
    ('Andrew Cook', 5, 68000.50, '2020-04-18'),
    ('Abigail Torres', 6, 73000.00, '2021-10-20'),
    ('Ethan Murphy', 7, 57000.75, '2022-02-15'),
    ('Ella King', 8, 98000.00, '2018-12-28'),
    ('Nathan Rivera', 9, 74000.50, '2020-07-15'),
    ('Mia Roberts', 10, 70000.25, '2021-11-20');

-- 1. Inner Join to Retrieve Employee and Department Information
-- This query joins employees with departments to show names instead of IDs
SELECT 
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary,
    e.hire_date
FROM 
    employees e
INNER JOIN 
    departments d 
ON 
    e.department_id = d.department_id;

-- 2. Group By Department with Average Salary
-- Shows the average salary of employees in each department
SELECT 
    d.department_name,
    AVG(e.salary) AS average_salary
FROM 
    employees e
JOIN 
    departments d 
ON 
    e.department_id = d.department_id
GROUP BY 
    d.department_name
ORDER BY 
    average_salary DESC;

-- 3. Count Employees in Each Department
-- This counts how many employees work in each department
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM 
    employees e
JOIN 
    departments d 
ON 
    e.department_id = d.department_id
GROUP BY 
    d.department_name
ORDER BY 
    employee_count DESC;

-- 4. Find the Department with the Highest Average Salary
-- Identifies which department has the highest-paid employees on average
SELECT 
    d.department_name,
    AVG(e.salary) AS average_salary
FROM 
    employees e
JOIN 
    departments d 
ON 
    e.department_id = d.department_id
GROUP BY 
    d.department_name
ORDER BY 
    average_salary DESC
LIMIT 1;

-- 5. Count Employees Hired Each Year
-- Shows how many employees were hired in each year
SELECT 
    EXTRACT(YEAR FROM hire_date) AS hire_year,
    COUNT(*) AS number_of_employees
FROM 
    employees
GROUP BY 
    hire_year
ORDER BY 
    hire_year;

-- Create the orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,              -- Unique order ID
    customer_id INT,                          -- ID of the customer who placed the order
    order_date DATE,                          -- Date when the order was placed
    total_amount DECIMAL(10, 2)               -- Total order value
);

-- Insert sample data into orders table
INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
    (1, '2022-01-05', 100.50),
    (2, '2022-01-07', 200.75),
    (1, '2022-01-08', 150.25),
    (3, '2022-01-10', 300.00),
    (2, '2022-01-15', 180.50),
    (3, '2022-01-20', 220.25),
    (1, '2022-01-25', 90.00),
    (2, '2022-01-28', 120.75),
    (3, '2022-02-01', 250.50),
    (1, '2022-02-05', 180.25);

-- 6. Find customers who have placed more than 2 orders and calculate total spent
-- Filters only customers with more than 2 orders and sums how much they spent
SELECT 
    customer_id,
    COUNT(*) AS order_count,
    SUM(total_amount) AS total_spent
FROM 
    orders
GROUP BY 
    customer_id
HAVING 
    COUNT(*) > 2;

-- 7. Find total amount of orders placed each month in 2022
-- Sums order values grouped by year and month
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS order_month,
    SUM(total_amount) AS total_sales
FROM 
    orders
WHERE 
    EXTRACT(YEAR FROM order_date) = 2022
GROUP BY 
    order_month
ORDER BY 
    order_month;

-- View all employee records
SELECT * FROM employees;

-- View all order records
SELECT * FROM orders;
