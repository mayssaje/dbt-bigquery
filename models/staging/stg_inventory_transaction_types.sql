with source as (
    select
        *
    from {{ source('raw', 'inventory_transaction_types') }}
)

select *,
current_timestamp() as ingestion_timestamp
 from source
