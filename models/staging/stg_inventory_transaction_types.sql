with source as (
    select
        *
    from {{ source('raw', 'inventory_transaction_types') }}
)

select * from source
