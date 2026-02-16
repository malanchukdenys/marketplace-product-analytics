-- USERS TABLE
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    signup_date DATE,
    country TEXT
);

-- PRODUCTS TABLE
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    category TEXT,
    price NUMERIC
);

-- ORDERS TABLE
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    order_date DATE,
    quantity INT
);
