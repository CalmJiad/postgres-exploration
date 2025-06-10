-- Show all users in the 'randomuser' table
SELECT * FROM randomuser;

-- Show all posts in the 'posts' table
SELECT * FROM posts;

-- Add 3 new users to the 'randomuser' table
INSERT INTO randomuser(username) VALUES
('Sadeq'),
('Mishu'),
('Rofiq');

-- Add 3 new posts linked to the new users by their user IDs (6, 7, 8)
INSERT INTO posts(title, user_id) VALUES
('Huawei has announced its latest flagship', 6),
('Bangladesh will rise again', 7),
('There is no success until you work hard', 8);

-- Show each post's title along with the username of the person who posted it
-- Combines data from 'posts' and 'randomuser' tables
SELECT title, username FROM posts
    JOIN randomuser ON posts.user_id = randomuser.id;

-- Show all columns from both tables for each post and its author
SELECT * FROM posts
    JOIN randomuser ON posts.user_id = randomuser.id;

-- Show only the post IDs for each post joined with its user
SELECT posts.id FROM posts
    JOIN randomuser ON posts.user_id = randomuser.id;

-- Same as above, but uses 'p' as a short name (alias) for the 'posts' table
SELECT * FROM posts p
    JOIN randomuser ON p.user_id = randomuser.id;

-- Same again, with a different alias style using 'as'
SELECT * FROM posts as p
    JOIN randomuser ON p.user_id = randomuser.id;
