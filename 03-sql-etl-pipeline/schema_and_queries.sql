-- ============================================================
-- SQL DATABASE OPTIMIZATION & ANALYTICS PIPELINE
-- ============================================================

-- 1. Schema Definition (Relational Structure)
CREATE TABLE IF NOT EXISTS dim_customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    segment VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS fact_transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES dim_customers(customer_id),
    transaction_amount NUMERIC(12, 2) NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexing for Query Optimization
CREATE INDEX IF NOT EXISTS idx_transactions_customer_date 
ON fact_transactions (customer_id, transaction_date DESC);

-- 2. Advanced Analytical Query (CTEs & Window Functions)
WITH Customer_Summary AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.segment,
        t.transaction_amount,
        t.transaction_date,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id 
            ORDER BY t.transaction_date DESC
        ) AS rank_recent,
        SUM(t.transaction_amount) OVER (
            PARTITION BY c.customer_id
        ) AS total_customer_spend
    FROM dim_customers c
    JOIN fact_transactions t ON c.customer_id = t.customer_id
)
SELECT 
    customer_id,
    customer_name,
    segment,
    transaction_amount AS latest_transaction_amount,
    transaction_date AS latest_transaction_date,
    total_customer_spend
FROM Customer_Summary
WHERE rank_recent = 1;

-- 3. Incremental Data Ingestion Filter Logic
SELECT 
    transaction_id,
    customer_id,
    transaction_amount,
    transaction_date
FROM fact_transactions
WHERE updated_at > NOW() - INTERVAL '24 hours';
