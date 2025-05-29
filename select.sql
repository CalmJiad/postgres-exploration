-- we will practice some commands with SELECT
-- just to explore the command we are creating this table in this way, but later we can create in a optimized way by using JOIN or Grouping strategy of table creation

-- Create the 'students' table for practicing SELECT queries
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT CHECK (age > 18),
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(10),
    country VARCHAR(50)
);

-- Insert sample student data
INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country) VALUES
('Alice', 'Johnson', 22, 'A+', 'Computer Science', 'alice.johnson@example.com', '2002-05-14', 'O+', 'USA'),
('Bob', 'Smith', 24, 'B', 'Mechanical Engineering', 'bob.smith@example.com', '2000-08-30', 'A+', 'Canada'),
('Charlie', 'Brown', 20, 'A', 'Physics', 'charlie.brown@example.com', '2004-01-12', 'B+', 'UK'),
('David', 'Lee', 23, 'C+', 'Mathematics', 'david.lee@example.com', '2001-06-22', 'AB-', 'South Korea'),
('Eva', 'Martinez', 21, 'B+', 'Architecture', 'eva.martinez@example.com', '2003-03-19', 'O-', 'Mexico'),
('Frank', 'Miller', 22, 'A-', 'Biology', 'frank.miller@example.com', '2002-11-10', 'B-', 'Germany'),
('Grace', 'Williams', 25, 'A+', 'Law', 'grace.williams@example.com', '1999-04-08', 'A+', 'UK'),
('Hannah', 'Kim', 20, 'B', 'History', 'hannah.kim@example.com', '2004-09-17', 'AB+', 'South Korea'),
('Ian', 'Thomas', 23, 'C', 'Computer Science', 'ian.thomas@example.com', '2001-12-24', 'O+', 'USA'),
('Julia', 'Nguyen', 22, 'B-', 'Nursing', 'julia.nguyen@example.com', '2002-07-02', 'A-', 'Vietnam'),
('Kevin', 'Patel', 21, 'A+', 'Business', 'kevin.patel@example.com', '2003-10-15', 'B+', 'India'),
('Luna', 'Garcia', 24, 'B+', 'Fine Arts', 'luna.garcia@example.com', '2000-02-05', 'O-', 'Spain'),
('Michael', 'Chen', 20, 'C+', 'Political Science', 'michael.chen@example.com', '2004-06-12', 'AB+', 'China'),
('Nina', 'Adams', 23, 'A-', 'Economics', 'nina.adams@example.com', '2001-01-09', 'O+', 'Australia'),
('Oliver', 'Clark', 21, 'B', 'Engineering', 'oliver.clark@example.com', '2003-11-30', 'B-', 'New Zealand'),
('Priya', 'Rao', 25, 'A', 'Psychology', 'priya.rao@example.com', '1999-03-25', 'A+', 'India'),
('Quinn', 'Harris', 22, 'B+', 'Information Tech', 'quinn.harris@example.com', '2002-08-14', 'O-', 'USA'),
('Rachel', 'Lopez', 20, 'C-', 'Media Studies', 'rachel.lopez@example.com', '2004-04-22', 'B+', 'Argentina'),
('Samuel', 'Khan', 23, 'A+', 'Philosophy', 'samuel.khan@example.com', '2001-05-18', 'AB+', 'Pakistan'),
('Tina', 'Moore', 24, 'B-', 'Sociology', 'tina.moore@example.com', '2000-09-09', 'O+', 'UK'),
('Uma', 'Singh', 22, 'A+', 'Biochemistry', 'uma.singh@example.com', '2002-10-03', 'A-', 'India'),
('Victor', 'White', 21, 'B+', 'Statistics', 'victor.white@example.com', '2003-01-28', 'B-', 'Canada'),
('Wendy', 'Perez', 25, 'A', 'Medicine', 'wendy.perez@example.com', '1999-12-12', 'O+', 'Colombia'),
('Xander', 'Young', 20, 'C+', 'Geology', 'xander.young@example.com', '2004-03-06', 'AB-', 'USA'),
('Yasmin', 'Ali', 23, 'B-', 'Linguistics', 'yasmin.ali@example.com', '2001-07-27', 'A+', 'Egypt');

-- Select all columns and all rows
SELECT * FROM students;

-- Select only email and age columns
SELECT email, age FROM students;

-- Rename email column using alias
SELECT email AS student_email FROM students;

-- Alias with space in the name (quoted)
SELECT email AS "Students Email" FROM students;

-- Sort results by first name in ascending order
SELECT * FROM students ORDER BY first_name ASC;

-- Sort results by age in descending order
SELECT * FROM students ORDER BY age DESC;

-- Get unique countries (no duplicates)
SELECT DISTINCT country FROM students;

-- Get unique blood groups
SELECT DISTINCT blood_group FROM students;

-- Get all students from the USA
SELECT * FROM students
    WHERE country = 'USA';

-- Get students who have an A+ grade and are in Computer Science
SELECT * FROM students
    WHERE grade = 'A+' AND course = 'Computer Science';

-- Get students from either USA or Germany
SELECT * FROM students
    WHERE country = 'USA' OR country = 'Germany';

-- Get students from USA or Germany who are 20 years old
SELECT * FROM students
    WHERE (country = 'USA' OR country = 'Germany') AND age = 20;

-- Get students aged 20 or older
SELECT * FROM students
    WHERE age >= 20;

-- Get students whose age is not equal to 20
SELECT * FROM students
    WHERE age <> 20;
-- Convert all first names to uppercase and display all columns.
SELECT upper(first_name) AS first_name_capitalized, * FROM students;

-- Concatenate first and last names into a single string (full name).
SELECT concat(first_name, ' ', last_name) AS full_name FROM students;

-- Calculate the average age of all students (returns one value).
SELECT avg(age) AS average_age FROM students;

-- Select students who are NOT from the USA and are at least 20 years old.
SELECT * FROM students 
    WHERE NOT country = 'USA' AND age >= 20;

-- Select students where email is NULL (no email provided).
SELECT * FROM students
    WHERE email IS NULL;

-- Display email; if it's NULL, show "email not provided" instead.
-- COALESCE returns the first non-null value in the list.
SELECT COALESCE(email, 'email not provided') AS email_status FROM students;

-- Select students whose country is either USA or Germany.
-- IN is a cleaner alternative to multiple OR conditions.
SELECT * FROM students 
    WHERE country IN('USA', 'Germany');

-- Select students whose country is neither USA nor Germany.
-- NOT IN excludes specified values.
SELECT * FROM students
    WHERE country NOT IN('USA', 'Germany');

-- Select students aged between 19 and 22 (inclusive).
-- BETWEEN is inclusive of both boundary values.
SELECT * FROM students
    WHERE age BETWEEN 19 AND 22;

-- Select students born between Jan 1, 2000 and Nov 30, 2004, sorted by date of birth.
SELECT * FROM students
    WHERE dob BETWEEN '2000-01-01' AND '2004-11-30'
    ORDER BY dob;

-- Find students whose first name ends with 'el'.
-- % represents any sequence of characters in a LIKE pattern.
SELECT * FROM students
    WHERE first_name LIKE '%el';

-- Find students whose first name is exactly 4 characters and ends with 'a'.
-- _ represents a single character in LIKE.
SELECT * FROM students
    WHERE first_name LIKE '___a';

-- Find students whose first name ends with 'a' (case-insensitive).
-- ILIKE is a case-insensitive version of LIKE in PostgreSQL.
SELECT * FROM students
    WHERE first_name ILIKE '%a';
