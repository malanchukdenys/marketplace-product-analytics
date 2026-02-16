-- Revenue by category
SELECT
    p.category,
    SUM(p.price * o.quantity) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Total users
SELECT COUNT(*) AS total_users
FROM users;

-- Activated users
SELECT COUNT(DISTINCT user_id) AS activated_users
FROM orders;

-- Repeat rate
SELECT
    COUNT(DISTINCT user_id) FILTER (WHERE order_count > 1) * 1.0
    / COUNT(DISTINCT user_id) AS repeat_rate
FROM (
    SELECT user_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY user_id
) sub;

-- Average orders per user
SELECT
    COUNT(*) * 1.0 / COUNT(DISTINCT user_id) AS avg_orders_per_user
FROM orders;

