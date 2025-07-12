with 

source as (

    select * from {{ source('raw', 'customers') }}

),

renamed as (

    select

    cast(id as integer) as customer_id,
    cast(first_name as text) as first_name,
    cast(last_name as text) as last_name,
    cast(email as text) as email,
    cast(gender as text) as gender,
    cast(age as integer) as age,
    cast(country as text) as country,
    cast(signup_date as date) as signup_date
    from source

)

select * from renamed
