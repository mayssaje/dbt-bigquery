with source as (
    select
        *
    from {{ source('raw', 'sales_reports') }}
)
select * from source