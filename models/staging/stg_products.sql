with source as (
    select
        *
    from {{ source('raw', 'products') }}
)
select *,
current_timestamp() as ingestion_timestamp
 from source