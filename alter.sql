-- Active: 1748170685337@@127.0.0.1@5432@ph
-- Selects and displays all columns and rows from the 'person_co' table.
SELECT * FROM person_co;

-- Inserts a new record into the 'person_co' table with id = 2, user_name = 'Rajman', and age = 25.
INSERT INTO person_co (id, user_name, age) VALUES (2, 'Rajman', 25);

-- Inserts another record into the table with id = 3, user_name = 'Ralman', and age = 35.
INSERT INTO person_co (id, user_name, age) VALUES (3, 'Ralman', 35);

-- Adds a new column named 'email' to the 'person_co' table with a default value and ensures it cannot be NULL.
ALTER TABLE person_co 
    ADD COLUMN email VARCHAR(50) DEFAULT 'email@mail.com' NOT NULL;

-- Inserts a new record into the table including all four columns: id, user_name, age, and email.
INSERT INTO person_co VALUES (4, 'Ajim', 21, 'ajim@gmail.com');

-- Renames the existing 'age' column to 'user_age' for better clarity or naming convention.
ALTER TABLE person_co
    RENAME age TO user_age;

-- Changes the data type of 'user_name' column to VARCHAR(50), allowing longer names up to 50 characters.
ALTER TABLE person_co
    ALTER COLUMN user_name TYPE VARCHAR(50);

-- Modifies the 'user_age' column to make it mandatory (cannot be NULL).
ALTER TABLE person_co
    ALTER COLUMN user_age SET NOT NULL;

-- Reverses the previous constraint, making 'user_age' optional (can be NULL again).
ALTER TABLE person_co
    ALTER COLUMN user_age DROP NOT NULL;
