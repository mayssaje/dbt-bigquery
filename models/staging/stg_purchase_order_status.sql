with source as (
    select
        *
    from {{ source('raw', 'purchase_order_status') }}
)

select * from source
