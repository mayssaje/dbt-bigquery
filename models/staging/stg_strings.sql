with source as (
    select
        *
    from {{ source('raw', 'strings') }}
)
select * from source