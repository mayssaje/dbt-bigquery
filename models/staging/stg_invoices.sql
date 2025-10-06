with source as (
    select
        *
    from {{ source('raw', 'invoices') }}
)

select * from source
