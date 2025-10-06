with source as (
    select
        *
    from {{ source('raw', 'orders_tax_status') }}
)

select *,
current_timestamp() as ingestion_timestamp
 from source
