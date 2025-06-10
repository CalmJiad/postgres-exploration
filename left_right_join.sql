-- We will see the joining sequence of LEFT JOIN and RIGHT JOIN
--
-- In SQL (including PostgreSQL), when we join two tables,
-- we call one the "left table" and the other the "right table".
--
-- The "left table" is the one written on the LEFT side of the JOIN keyword.
-- The "right table" is the one written on the RIGHT side of the JOIN keyword.
--
-- LEFT JOIN (also called LEFT OUTER JOIN):
-- - Returns all rows from the left table.
-- - If there are matching rows in the right table, those are included.
-- - If there is no match, the result still includes the row from the left table,
--   but the columns from the right table will show NULL.
--
-- RIGHT JOIN (also called RIGHT OUTER JOIN):
-- - Returns all rows from the right table.
-- - If there are matching rows in the left table, those are included.
-- - If there is no match, the result still includes the row from the right table,
--   but the columns from the left table will show NULL.
--
-- These joins are useful when you want to include all records from one table,
-- even if the other table doesn't have a match.

-- Add a new user to 'randomuser' table
INSERT INTO randomuser(username) VALUES
('Sadeq');

-- Add a post without linking it to any user (user_id is NULL)
INSERT INTO posts(title, user_id) VALUES
('Huawei has announced its latest flagship', NULL);

-- RIGHT JOIN: shows all users (right table),
-- even if they don't have matching posts (left table)
SELECT * FROM posts as p
    RIGHT JOIN randomuser as u on p.user_id = u.id;

-- LEFT JOIN: shows all posts (left table),
-- even if they are not linked to any user (right table)
SELECT * FROM posts as p
    LEFT JOIN randomuser as u on p.user_id = u.id;

-- LEFT JOIN and LEFT OUTER JOIN are the same
SELECT * FROM posts as p
    RIGHT JOIN randomuser as u on p.user_id = u.id;

SELECT * FROM posts as p
    LEFT OUTER JOIN randomuser as u on p.user_id = u.id;

SELECT * FROM posts as p
    RIGHT OUTER JOIN randomuser as u on p.user_id = u.id;
