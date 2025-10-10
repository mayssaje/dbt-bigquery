with source as (
    select
        *
    from {{ source('raw', 'sales_reports') }}
)
select *,
current_timestamp() as ingestion_timestamp
 from source