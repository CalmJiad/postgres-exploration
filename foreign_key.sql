
CREATE TABLE randomuser (
    id SERIAL PRIMARY KEY,               -- Automatically generated unique ID for each user
    username VARCHAR(25) NOT NULL        
);

-- Create a table named 'posts'
-- This table will store blog posts or any content written by users
-- 'id' is the primary key (unique identifier for each post)
-- 'title' is a required text field for the post title/content
-- 'user_id' is a foreign key that links each post to a user in the 'randomuser' table

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,                             
    title TEXT NOT NULL,                               
    user_id INTEGER REFERENCES randomuser(id)          -- Foreign key constraint
);

ALTER table posts
    alter COLUMN user_id set NOT NULL


INSERT INTO randomuser(username) VALUES
('Rocky'),
('Robin'),
('Munshi'),
('Iqbal'),
('Khurshed')

SELECT * from randomuser

SELECT * from posts

INSERT INTO posts(title, user_id) VALUES
('Enjoying a sunny day today', 1),
('It might be not that much easy', 3),
('The sun is shining', 2),
('Apple has announced its latest OS', 5)
('Germany had its election last month', 4)
-- Deletion constraints regarding foreign key

-- On delete restriction / on delete no action (default)
DELETE FROM randomuser
    WHERE id = 4

-- On delete cascade
DROP TABLE randomuser

DROP TABLE posts

-- recreating the tables
CREATE TABLE randomuser (
    id SERIAL PRIMARY KEY,               -- Automatically generated unique ID for each user
    username VARCHAR(25) NOT NULL        
);

-- Now posts table with new deletion constraints
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,                             
    title TEXT NOT NULL,                               
    user_id INTEGER REFERENCES randomuser(id) ON DELETE CASCADE         -- Foreign key constraint
);

DELETE FROM randomuser
    WHERE ID = 4

DELETE FROM randomuser
    WHERE ID = 3


-- There are many other deletion constraints could be set while Deletion process
-- 1. ON DELTE SET NULL
-- 2. ON DELETE SET DEFAULT
