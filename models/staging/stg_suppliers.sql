with source as (
    select
        *
    from {{ source('raw', 'suppliers') }}
)
select * from source