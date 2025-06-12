-- In postgres, VIEW is like a virtual table. It doesn’t store data itself but provides a way to save a query so that we can reuse it like a regular table.

-- creating a newemployees table
CREATE TABLE newemployees (
  employee_id INT PRIMARY KEY,
  employee_name TEXT,
  dept_name TEXT,
  salary NUMERIC(10, 2),
  hire_date DATE
);

INSERT INTO newemployees (employee_id, employee_name, dept_name, salary, hire_date) VALUES
(1, 'Derek Larson', 'Operations', 64480, '2018-07-02'),
(2, 'William Phillips', 'HR', 104398, '2019-04-07'),
(3, 'Frank Shaw', 'Marketing', 93571, '2018-08-05'),
(4, 'Amy Martinez', 'Engineering', 60523, '2024-03-03'),
(5, 'Phillip Mercado', 'Legal', 75572, '2022-01-06'),
(6, 'Nicole Johnson', 'Finance', 56115, '2021-08-15'),
(7, 'Juan Taylor', 'IT', 44155, '2022-01-06'),
(8, 'Sarah George', 'HR', 112076, '2024-05-19'),
(9, 'Dawn Garcia', 'IT', 92258, '2021-01-06'),
(10, 'Tracy Avila', 'Engineering', 92650, '2015-12-16'),
(11, 'Jeffrey Barnett', 'Marketing', 41789, '2020-03-28'),
(12, 'Stephanie Joseph', 'Operations', 95637, '2016-06-22'),
(13, 'Cynthia Craig', 'Finance', 114654, '2018-09-30'),
(14, 'Patrick Henry', 'Legal', 58744, '2019-11-14'),
(15, 'Jessica Yates', 'Sales', 110382, '2017-04-19'),
(16, 'Christina Conner', 'Engineering', 94927, '2015-03-05'),
(17, 'Cheryl Smith', 'HR', 108058, '2017-05-17'),
(18, 'Erica Gonzalez', 'Marketing', 41832, '2020-10-23'),
(19, 'Brian Rivers', 'Sales', 87839, '2019-07-01'),
(20, 'Douglas Carpenter', 'Operations', 119231, '2016-08-13'),
(21, 'Steven Powell', 'Finance', 63497, '2020-12-09'),
(22, 'Renee Johnson', 'IT', 77129, '2022-09-14'),
(23, 'Shane Harper', 'Engineering', 111947, '2017-06-12'),
(24, 'Paula Wood', 'HR', 50451, '2021-03-25'),
(25, 'Melissa Baker', 'Marketing', 78326, '2020-02-28'),
(26, 'Cody Pierce', 'Legal', 91824, '2019-05-21'),
(27, 'Julie Pugh', 'Operations', 46852, '2015-10-30'),
(28, 'Travis Cooper', 'Sales', 88200, '2018-03-03'),
(29, 'Angela Hughes', 'Finance', 71002, '2019-09-18'),
(30, 'Jacob Smith', 'IT', 88615, '2021-11-09'),
(31, 'Rebecca Miles', 'Engineering', 76224, '2017-08-01'),
(32, 'Amanda Sharp', 'HR', 40231, '2020-06-11'),
(33, 'Kevin Hayes', 'Marketing', 94820, '2020-04-15'),
(34, 'Jesse Griffin', 'Operations', 81358, '2016-02-04'),
(35, 'Brittany Banks', 'Legal', 64819, '2022-05-18'),
(36, 'Vincent Gonzalez', 'IT', 104899, '2020-01-21'),
(37, 'Christina Bowers', 'Finance', 98445, '2018-11-12'),
(38, 'Nathaniel Logan', 'Sales', 75029, '2015-09-04'),
(39, 'Pamela Russell', 'HR', 105210, '2021-04-27'),
(40, 'Zachary Norman', 'Engineering', 117734, '2019-01-15');


select * from employees

CREATE VIEW dept_avg_salary 
AS
SELECT dept_name, avg(salary) FROM newemployees GROUP BY dept_name

SELECT * FROM dept_avg_salary

DROP VIEW test_complex_view

CREATE VIEW test_complex_view
AS
SELECT employee_name, salary, dept_name
FROM newemployees
WHERE dept_name IN
(SELECT dept_name FROM newemployees WHERE dept_name LIKE '%%T%') 

SELECT * FROM test_complex_view