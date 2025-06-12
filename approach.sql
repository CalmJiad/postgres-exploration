/*
-- PostgreSQL Architecture and SQL Execution --

PostgreSQL follows a **non-procedural (declarative) approach** when it comes to SQL queries.
- You write *what* you want (e.g., SELECT employees with salary > 50000), not *how* to get it.
- The database engine figures out the best way to execute your query.

-- PostgreSQL Architecture Overview --

1. Parser:
   - Converts SQL text into a parse tree.
   - Checks syntax and semantics.

2. Planner/Optimizer:
   - Generates possible query execution plans.
   - Uses statistics and cost-based optimization to pick the most efficient plan.

3. Executor:
   - Runs the chosen plan step-by-step.
   - Retrieves data, applies joins, filters, aggregates, etc.

4. Storage & Buffer Manager:
   - Manages disk I/O and memory caching.
   - Implements MVCC (Multi-Version Concurrency Control) for safe concurrent transactions.

-- Execution Model --

- SQL is **non-procedural**: you specify *what* you want.
- PostgreSQL converts your query into a **logical plan**.
- The planner creates a **physical plan** for execution.
- The executor performs the actual data retrieval and processing.
- MVCC ensures ACID compliance and supports concurrent access.

*/

-- sample function creation
SELECT * FROM newemployees

SELECT count(*) FROM newemployees

CREATE FUNCTION emp_count()
RETURNS INT
LANGUAGE SQL
AS
$$
    SELECT COUNT(*) FROM newemployees
$$

SELECT emp_count()

-- function with params
CREATE FUNCTION emp_del(p_emp_id INT)
RETURNS void
LANGUAGE SQL
AS
$$
    DELETE FROM newemployees WHERE employee_id = p_emp_id
$$

SELECT emp_del(39)
