with source as (
    select
        *
    from {{ source('raw', 'shippers') }}
)
select * from source