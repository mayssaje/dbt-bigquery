with source as (
    select
        *
    from {{ source('raw', 'privileges') }}
)
select * from source
