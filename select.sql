-- we will practice some commands with SELECT
-- just to explore the command we are creating this table in this way, but later we can create in a optimized way by using JOIN or Grouping strategy of table creation

-- creating a new table with various data
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
)

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


SELECT * from students

-- to see the specific data
SELECT email, age from students

-- craeting a column/row aliases while viewing
SELECT email as student_email FROM students

SELECT email as "Students Email" from students

-- sorting the data while viewing
SELECT * from students ORDER BY first_name ASC

SELECT * from students ORDER BY age DESC
