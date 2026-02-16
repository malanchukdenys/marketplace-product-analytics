-- Users without orders
SELECT u.user_id
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.user_id IS NULL;

-- Signup → First Order
SELECT
    u.user_id,
    u.signup_date,
    MIN(o.order_date) AS first_order_date
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.signup_date;

-- Time to first order
SELECT
    u.user_id,
    MIN(o.order_date) - u.signup_date AS days_to_first_order
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.signup_date;

-- Repeat users
SELECT
    user_id,
    COUNT(*) AS total_orders
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 1;

-- First order per user
WITH first_orders AS (
    SELECT
        user_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY user_id
)
SELECT * FROM first_orders;

-- D7 retention
WITH first_orders AS (
    SELECT
        user_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY user_id
)
SELECT
    COUNT(DISTINCT o.user_id) * 1.0
    / COUNT(DISTINCT f.user_id) AS d7_retention
FROM first_orders f
LEFT JOIN orders o
    ON f.user_id = o.user_id
    AND o.order_date = f.first_order_date + INTERVAL '7 days';
