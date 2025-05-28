-- Selects and displays all columns and rows from the 'person_co' table.
SELECT * FROM person_co;

-- Inserts a new record into the 'person_co' table with id = 2, user_name = 'Rajman', and age = 25.
INSERT INTO person_co (id, user_name, age) VALUES (2, 'Rajman', 25);

-- Inserts another record into the table with id = 3, user_name = 'Ralman', and age = 35.
INSERT INTO person_co (id, user_name, age) VALUES (3, 'Ralman', 35);

-- Adds a new column named 'email' to the 'person_co' table with a default value 
-- and ensures the column cannot be left empty (NOT NULL constraint).
ALTER TABLE person_co 
    ADD COLUMN email VARCHAR(50) DEFAULT 'email@mail.com' NOT NULL;

-- Inserts a new record including values for all four columns: id, user_name, age, and email.
INSERT INTO person_co VALUES (4, 'Ajim', 21, 'ajim@gmail.com');

-- Renames the 'age' column to 'user_age' for better semantic meaning and naming consistency.
ALTER TABLE person_co
    RENAME age TO user_age;

-- Changes the data type of 'user_name' column to allow strings up to 50 characters in length.
ALTER TABLE person_co
    ALTER COLUMN user_name TYPE VARCHAR(50);

-- Sets the 'user_age' column to NOT NULL, meaning every record must have an age value.
ALTER TABLE person_co
    ALTER COLUMN user_age SET NOT NULL;

-- Removes the NOT NULL constraint, allowing 'user_age' to be optional.
ALTER TABLE person_co
    ALTER COLUMN user_age DROP NOT NULL;

-- Updates the 'user_age' for the record where id = 2, setting it to 30.
UPDATE person_co
SET user_age = 30
WHERE id = 2;

-- Updates the 'user_age' for the record where id = 1, setting it to 31.
UPDATE person_co
SET user_age = 31
WHERE id = 1;

-- Updates the 'user_age' for the record where id = 3, setting it to 32.
UPDATE person_co
SET user_age = 32
WHERE id = 3;

-- Updates the 'user_age' for the record where id = 4, setting it to 38.
UPDATE person_co
SET user_age = 38
WHERE id = 4;

-- Adds a UNIQUE constraint on the 'user_age' column to ensure no two records have the same age.
ALTER TABLE person_co
    ADD CONSTRAINT unique_person_co_user_age UNIQUE(user_age);

-- Adds a PRIMARY KEY constraint on the 'id' column to uniquely identify each record.
ALTER TABLE person_co
    ADD CONSTRAINT pk_person_co_user_age PRIMARY KEY(id);

-- Removes the UNIQUE constraint previously set on the 'user_age' column.
ALTER TABLE person_co
    DROP CONSTRAINT unique_person_co_user_age;

-- Removes all data from the 'person_co' table quickly and resets identity counters (if any).
-- Unlike DELETE, this does not log each row removal individually.
TRUNCATE TABLE person_co;

-- Completely deletes the 'person_co' table and all its data and structure from the database.
DROP TABLE person_co;
