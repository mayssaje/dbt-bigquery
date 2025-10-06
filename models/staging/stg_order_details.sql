with source as (
    select
        *
    from {{ source('raw', 'order_details') }}
)

select *,
current_timestamp() as ingestion_timestamp
 from source