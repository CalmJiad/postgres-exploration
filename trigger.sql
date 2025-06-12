/*
-- rigger in SQL?

A TRIGGER is a special kind of stored procedure that automatically executes or fires
when certain events occur in the database.

-- When do triggers execute?

Triggers execute in response to specific actions on a table or view, such as:
   * INSERT
   * UPDATE
   * DELETE

-- Purpose of Triggers

- Enforce complex business rules automatically.
- Maintain audit trails (track changes).
- Validate or modify data before or after changes.
- Synchronize tables or replicate changes.

-- Types of Triggers

1. BEFORE Trigger:
   - Executes before the triggering event (e.g., before INSERT).
   - Can modify or validate data before it’s written.

2. AFTER Trigger:
   - Executes after the triggering event.
   - Useful for logging or cascading changes.

3. INSTEAD OF Trigger:
   - Used mainly on views.
   - Executes instead of the triggering event, allowing you to override default behavior.

-- How triggers work:

- You define the trigger to fire on a specific table and event.
- When the event happens, the trigger function runs automatically.
- The trigger can access OLD and NEW row data to compare or manipulate.

-- Example syntax for creating a trigger (PostgreSQL):

CREATE FUNCTION trigger_function_name()
RETURNS trigger AS $$
BEGIN
   -- trigger logic here
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_name
BEFORE INSERT ON table_name
FOR EACH ROW
EXECUTE FUNCTION trigger_function_name();

*/

-- Create a table where deleted employees data will be saved
CREATE TABLE deleted_employee
(
    deleted_emp_name VARCHAR(50),
    deleted_at TIMESTAMP
);

-- Trigger function
CREATE OR REPLACE FUNCTION deleted_emp_saver()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO deleted_employee VALUES(OLD.employee_name, now());
        RAISE NOTICE 'Deleted user audit log created';
        RETURN OLD;
    END
$$

-- Trigger
CREATE OR REPLACE TRIGGER save_deleted_emp
BEFORE DELETE 
ON newemployees
FOR EACH ROW
EXECUTE FUNCTION deleted_emp_saver();

DELETE FROM newemployees WHERE employee_id = 16;

SELECT * FROM deleted_employee