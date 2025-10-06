with source as (
    select
        *
    from {{ source('raw', 'orders') }}
)


select *,
current_timestamp() as ingestion_timestamp
 from source
