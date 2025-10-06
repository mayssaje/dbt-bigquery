with source as (
    select
        *
    from {{ source('raw', 'purchase_order_status') }}
)

select *,
current_timestamp() as ingestion_timestamp
 from source