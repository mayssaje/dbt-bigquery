with source as (
    select
        *
    from {{ source('raw', 'purchase_orders') }}
)
select * from source