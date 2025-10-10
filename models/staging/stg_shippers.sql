with source as (
    select
        *
    from {{ source('raw', 'shippers') }}
)
select *,
current_timestamp() as ingestion_timestamp
 from source