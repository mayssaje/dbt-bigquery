with source as (
    select
        *
    from {{ source('raw', 'purchase_order_details') }}
)
select * from source