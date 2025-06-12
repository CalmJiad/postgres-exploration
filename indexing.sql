-- PostgreSQL Indexing: Concepts & Examples

-- Indexing helps speed up SELECT queries by allowing PostgreSQL to find rows faster.
-- Indexes consume extra disk space and can slow down INSERT, UPDATE, and DELETE operations.

-- 1. Basic B-tree Index (default)
CREATE INDEX idx_employees_dept ON employees (dept_name);
-- Helps with WHERE, JOIN, ORDER BY on dept_name

-- Example:
-- SELECT * FROM employees WHERE dept_name = 'HR';

-- 2. Unique Index
CREATE UNIQUE INDEX idx_email_unique ON users (email);
-- Ensures no duplicate emails

-- 3. Composite Index (multi-column)
CREATE INDEX idx_dept_salary ON employees (dept_name, salary);
-- Helps when filtering/sorting by both columns in order
-- SELECT * FROM employees WHERE dept_name = 'Engineering' AND salary > 80000;

-- 4. Partial Index (conditional)
CREATE INDEX idx_high_salary ON employees (salary) WHERE salary > 100000;
-- Speeds up queries that only apply to rows where salary > 100000

-- 5. Expression Index
CREATE INDEX idx_lower_name ON employees (LOWER(employee_name));
-- Useful for case-insensitive lookups
-- SELECT * FROM employees WHERE LOWER(employee_name) = 'john doe';

-- 6. Full Text Search Index using GIN
-- ALTER TABLE articles ADD COLUMN content_tsv tsvector;
-- UPDATE articles SET content_tsv = to_tsvector('english', content);
-- CREATE INDEX idx_articles_fts ON articles USING GIN(content_tsv);
-- SELECT * FROM articles WHERE content_tsv @@ to_tsquery('postgres');

-- 7. BRIN Index (Block Range Index)
-- For large, append-only tables like logs or time-series data
-- CREATE INDEX idx_logs_brin ON logs USING BRIN(log_timestamp);

-- 8. Dropping an Index
DROP INDEX IF EXISTS idx_employees_dept;
-- Use CASCADE if the index is used in other constraints

-- 9. Check if an Index is Used
-- Use EXPLAIN before your query:
-- EXPLAIN SELECT * FROM employees WHERE dept_name = 'HR';

-- 10. When to Create Indexes
-- Use indexes on:
-- - Columns used frequently in WHERE, JOIN, ORDER BY, GROUP BY
-- - Columns with many unique values (high cardinality)
-- Avoid indexes on:
-- - Columns with lots of duplicates or NULLs
-- - Columns rarely used in queries
-- - Small tables (sequential scan may be faster)

-- 11. PostgreSQL chooses whether to use an index based on query planning cost.
-- Indexes are not automatically created (except for primary keys and unique constraints).

-- 12. View Existing Indexes
-- In psql: \di
-- Or:
SELECT indexname, indexdef FROM pg_indexes WHERE tablename = 'employees';

-- 13. Covering Index (Index-only Scan)
-- An index that includes all columns used in the query
CREATE INDEX idx_covering ON employees (dept_name, salary, employee_name);
-- SELECT employee_name FROM employees WHERE dept_name = 'IT' AND salary > 70000;
