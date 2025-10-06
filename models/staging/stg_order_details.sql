with source as (
    select
        *
    from {{ source('raw', 'order_details') }}
)

select * from source
