with source as (
    select
        *
    from {{ source('raw', 'suppliers') }}
)
select *,
current_timestamp() as ingestion_timestamp
 from source