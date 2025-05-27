-- Active: 1748170685337@@127.0.0.1@5432@ph
SELECT * FROM person_co

INSERT INTO person_co (id, user_name, age) VALUES (2, 'Rajman', 25)

INSERT INTO person_co (id, user_name, age) VALUES (3, 'Ralman', 35)

ALTER TABLE person_co 
    ADD COLUMN email VARCHAR(50) DEFAULT 'email@mail.com' NOT NULL

INSERT INTO person_co values (4, 'Ajim', 21, 'ajim@gmail.com')

ALTER TABLE person_co
    RENAME age to user_age

ALTER TABLE person_co
    ALTER COLUMN user_name TYPE VARCHAR(50)

ALTER TABLE person_co
    ALTER COLUMN user_age SET NOT NULL

