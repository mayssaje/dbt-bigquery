with source as (
    select
        *
    from {{ source('raw', 'employees') }}
)


select * from source
