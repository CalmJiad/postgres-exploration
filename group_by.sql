-- View all records from the 'students' table
-- This helps understand the structure and data before grouping or aggregating
SELECT * FROM students;

-- Group the students by their 'country' and calculate:
-- 1. The number of students from each country (using count(*))
-- 2. The average age of students from each country (using avg(age))
-- The HAVING clause filters out any group (country) where the average age is less than 22.5
-- NOTE: HAVING is used to filter results AFTER grouping and aggregation
SELECT 
    country, 
    COUNT(*) AS student_count, 
    AVG(age) AS average_age
FROM 
    students
GROUP BY 
    country
HAVING 
    AVG(age) >= 22.50;

-- Extract the year of birth from each student's date of birth (dob)
-- Group students by their birth year and count how many were born each year
-- This is useful for demographic or age distribution analysis
-- 'extract(year FROM ...)' pulls just the year part from a date
-- 'dob::date' ensures the value is treated as a date before extraction
SELECT 
    EXTRACT(YEAR FROM dob::date) AS birth_year, 
    COUNT(*) AS total_students
FROM 
    students
GROUP BY 
    birth_year;
