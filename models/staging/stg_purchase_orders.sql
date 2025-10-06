with source as (
    select
        *
    from {{ source('raw', 'purchase_orders') }}
)
select *,
current_timestamp() as ingestion_timestamp
 from source