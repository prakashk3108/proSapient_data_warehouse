WITH base AS (

    SELECT
        tx.customer_id,
        COUNT(tx.transaction_id) AS transaction_count,
        SUM(tx.quantity * pr.price_gbp) AS total_spent,
        COUNT(DISTINCT pr.category) AS category_count
    FROM {{ ref('fct_transactions') }} tx
    LEFT JOIN {{ ref('dim_products') }} pr ON tx.product_id = pr.product_id
    GROUP BY tx.customer_id

),

segmented AS (

    SELECT *,
        CASE
            WHEN total_spent >= 1000 THEN 'High'
            WHEN total_spent >= 300 THEN 'Medium'
            ELSE 'Low'
        END AS spend_segment,

        CASE
            WHEN transaction_count >= 10 THEN 'Frequent'
            WHEN transaction_count >= 3 THEN 'Occasional'
            ELSE 'Rare'
        END AS frequency_segment,

        CASE
            WHEN category_count >= 4 THEN 'Diverse'
            ELSE 'Focused'
        END AS diversity_segment

    FROM base

)

SELECT * FROM segmented
