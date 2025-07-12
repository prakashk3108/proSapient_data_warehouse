with 

source as (

    select * from {{ source('raw', 'transactions') }}

),

renamed as (

SELECT
    cast(id as integer) as transaction_id,
    cast(customer_id as integer) as customer_id,
    cast(product_id as integer) as product_id,
    cast(quantity as integer) as quantity,
    cast(transaction_date as date) as transaction_date

    from source

)

select * from renamed
