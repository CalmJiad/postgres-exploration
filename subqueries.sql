-- Step 1: Create the 'customers' table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Step 2: Create the 'orders' table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    total_amount NUMERIC(10, 2) NOT NULL
);

-- Step 3: Insert sample customer data
INSERT INTO customers (name) VALUES
('Alice'),
('Bob'),
('Carol');

-- Step 4: Insert sample order data
INSERT INTO orders (customer_id, total_amount) VALUES
(1, 100),   -- Alice
(1, 50),    -- Alice
(2, 300);   -- Bob

-- Step 5: Subquery to find customers with at least one order > $100
SELECT name
FROM customers
WHERE id IN (
    SELECT customer_id
    FROM orders
    WHERE total_amount > 100
);
