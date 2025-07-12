SELECT
    product_id,
    product_name,
    category,
    price_gbp
FROM {{ ref('stg_products') }}
