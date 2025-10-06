with source as (
    select
        *
    from {{ source('raw', 'orders_tax_status') }}
)

select * from source
