SELECT
    tx.transaction_id,
    tx.customer_id,
    tx.product_id,
    tx.quantity,
    tx.transaction_date,
    tx.quantity * pr.price_gbp AS transaction_amount
FROM {{ ref('stg_transactions') }} tx
LEFT JOIN {{ ref('stg_products') }} pr
    ON tx.product_id = pr.product_id
