with source as (
    select
        *
    from {{ source('raw', 'privileges') }}
)
select *,
current_timestamp() as ingestion_timestamp
 from source