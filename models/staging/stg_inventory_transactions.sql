with source as (
    select
        *
    from {{ source('raw', 'inventory_transactions') }}
)

select *,
current_timestamp() as ingestion_timestamp
 from source
