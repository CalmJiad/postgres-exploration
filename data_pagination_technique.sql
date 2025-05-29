-- Select all records from the students table (no pagination).
SELECT * FROM students;

-- Pagination: Page 1 (first 5 records)
-- OFFSET = 5 * (page_number - 1) => OFFSET = 5 * 0 = 0
SELECT * FROM students LIMIT 5 OFFSET 5 * 0;

-- Pagination: Page 2 (next 5 records, skipping the first 5)
-- OFFSET = 5 * 1 = 5
SELECT * FROM students LIMIT 5 OFFSET 5 * 1;

-- Pagination: Page 3 (records 11–15)
-- OFFSET = 5 * 2 = 10
SELECT * FROM students LIMIT 5 OFFSET 5 * 2;

-- Pagination: Page 4 (records 16–20)
-- OFFSET = 5 * 3 = 15
SELECT * FROM students LIMIT 5 OFFSET 5 * 3;
