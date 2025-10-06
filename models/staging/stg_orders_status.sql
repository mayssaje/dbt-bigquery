with source as (
    select
        *
    from {{ source('raw', 'orders_status') }}
)

select * from source
