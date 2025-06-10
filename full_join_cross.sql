-- Drop old tables if they exist
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create the employees table
CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Create the departments table
CREATE TABLE departments(
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Insert departments
INSERT INTO departments(dept_id, dept_name) VALUES
(101, 'Human Resources'),
(102, 'IT and Technology');

-- Insert employees
INSERT INTO employees(emp_id, emp_name, dept_id) VALUES
(1, 'John Cena', 101),
(2, 'Harry Potter', 102);

SELECT * FROM employees

SELECT * FROM departments

-- CROSS JOIN:
-- This returns every combination of rows from both tables.
-- It multiplies the number of rows from employees and departments (a Cartesian product).
SELECT * FROM employees
    CROSS JOIN departments;

-- NATURAL JOIN:
-- This joins both tables using all columns with the same name.
-- In this case, it joins using 'dept_id', which exists in both tables.
-- It automatically matches rows where employees.dept_id = departments.dept_id
SELECT * FROM employees
    NATURAL JOIN departments;