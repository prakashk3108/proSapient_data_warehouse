with 

source as (

    select * from {{ source('raw', 'products') }}

),

renamed as (
SELECT
    cast(id as integer) as product_id,
    cast(name as text) as product_name,
    cast(category as text) as category,
    cast(price_gbp as numeric(10,2)) as price_gbp

    from source

)

select * from renamed
