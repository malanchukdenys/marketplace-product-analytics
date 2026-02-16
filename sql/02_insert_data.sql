-- USERS
INSERT INTO users (signup_date, country) VALUES
('2024-01-01', 'UA'),
('2024-01-05', 'PL'),
('2024-01-10', 'DE'),
('2024-01-15', 'UA'),
('2024-01-20', 'PL');

-- PRODUCTS
INSERT INTO products (category, price) VALUES
('Electronics', 200),
('Clothing', 50),
('Home', 80);

-- ORDERS
INSERT INTO orders (user_id, product_id, order_date, quantity) VALUES
(1, 1, '2024-02-01', 1),
(1, 2, '2024-02-03', 2),
(2, 3, '2024-02-05', 1),
(3, 1, '2024-02-10', 1),
(4, 2, '2024-02-12', 3);
