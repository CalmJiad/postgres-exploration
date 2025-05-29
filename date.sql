-- Check the current timezone setting of the PostgreSQL server
SHOW timezone;

-- Get the current timestamp (includes date, time, and time zone info if applicable)
SELECT now();

-- Create a table with two timestamp columns:
-- 'ts' stores a timestamp without time zone (plain date and time)
-- 'tsz' stores a timestamp with time zone (adjusted and stored relative to time zone)
CREATE TABLE timez (
    ts TIMESTAMP WITHOUT TIME ZONE,
    tsz TIMESTAMP WITH TIME ZONE
);

-- View all rows in the 'timez' table
SELECT * FROM timez;

-- Insert a timestamp value into both columns
-- Note: 'ts' will treat the timestamp as-is; 'tsz' will adjust it to the server's time zone
INSERT INTO timez VALUES ('2024-01-01 10:55:55', '2024-01-01 10:55:55');

-- Return only the current date (without time)
SELECT CURRENT_DATE;

-- Get the date part from the current timestamp using type casting
SELECT now()::date;

-- Get the time part from the current timestamp using type casting
SELECT now()::time;

-- Format the current timestamp as a string in 'yyyy/mm/dd' format
SELECT to_char(now(), 'yyyy/mm/dd');

-- Get the day of the year (e.g., 032 for February 1)
SELECT to_char(now(), 'DDD');

-- Subtract 1 year and 2 months from the current date
SELECT current_date - INTERVAL '1 year 2 month';

-- Calculate the age between today's date and a specific date
SELECT age(current_date, '1996-02-20');

-- Assuming a 'students' table exists with a 'dob' (date of birth) column,
-- this query calculates the age of each student
SELECT *, age(current_date, dob) FROM students;

-- Extract the year part from a given date after casting it to date type
SELECT extract(year FROM '2024-02-02'::date);

-- Type casting examples:

-- Cast an integer to boolean: 1 becomes TRUE
SELECT 1::BOOLEAN;

-- Cast a string 'y' to boolean: becomes TRUE
SELECT 'y'::BOOLEAN;

-- Cast a string 'N' to boolean: becomes FALSE
SELECT 'N'::BOOLEAN;
