-- Create a table called 'randomuser'
-- 'id' will be created automatically and uniquely for each user
-- 'username' must be provided (cannot be empty)
CREATE TABLE randomuser (
    id SERIAL PRIMARY KEY,               
    username VARCHAR(25) NOT NULL        
);

-- Create a table called 'posts'
-- This table will store posts written by users
-- 'id' is the unique post ID
-- 'title' is the content of the post and must not be empty
-- 'user_id' links the post to a user from the 'randomuser' table
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,                             
    title TEXT NOT NULL,                               
    user_id INTEGER REFERENCES randomuser(id)          
);

-- Make sure 'user_id' in posts table is required (cannot be empty)
ALTER table posts
    alter COLUMN user_id set NOT NULL;

-- Add 5 users to the 'randomuser' table
INSERT INTO randomuser(username) VALUES
('Rocky'),
('Robin'),
('Munshi'),
('Iqbal'),
('Khurshed');

-- Show all users
SELECT * from randomuser;

-- Show all posts
SELECT * from posts;

-- Add 4 posts, each linked to a user by user_id
INSERT INTO posts(title, user_id) VALUES
('Enjoying a sunny day today', 1),
('It might be not that much easy', 3),
('The sun is shining', 2),
('Apple has announced its latest OS', 5),
('Germany had its election last month', 4);

-- Try to delete a user with ID = 4
-- This may fail if there are posts linked to this user
-- Because by default, deletion of a user is not allowed if they have posts
DELETE FROM randomuser
    WHERE id = 4;

-- Now we drop (delete) both tables completely
DROP TABLE randomuser;
DROP TABLE posts;

-- Recreate the 'randomuser' table
CREATE TABLE randomuser (
    id SERIAL PRIMARY KEY,               
    username VARCHAR(25) NOT NULL        
);

-- Recreate the 'posts' table with a new rule:
-- If a user is deleted, all their posts will also be deleted automatically
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,                             
    title TEXT NOT NULL,                               
    user_id INTEGER REFERENCES randomuser(id) ON DELETE CASCADE
);

-- Delete the user with ID = 4
-- Their posts (if any) will be deleted automatically because of the cascade rule
DELETE FROM randomuser
    WHERE ID = 4;

-- Delete the user with ID = 3
-- Their posts (if any) will also be deleted
DELETE FROM randomuser
    WHERE ID = 3;

-- Other delete options you can use instead of CASCADE:
-- 1. ON DELETE SET NULL → sets user_id in posts to NULL when the user is deleted
-- 2. ON DELETE SET DEFAULT → sets user_id to a default value when the user is deleted
