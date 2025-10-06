with source as (
    select
        Id,
        split(name, ' ')[safe_offset(0)] as nom
    from {{ source('raw', 'customers_raw') }}
),

customers_staging as (
    select *
    from source
)

select * from customers_staging
