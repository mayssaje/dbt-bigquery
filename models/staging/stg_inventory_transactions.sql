with source as (
    select
        *
    from {{ source('raw', 'inventory_transactions') }}
)

select * from source
