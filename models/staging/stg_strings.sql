with source as (
    select
        *
    from {{ source('raw', 'strings') }}
)
select *,
current_timestamp() as ingestion_timestamp
 from source