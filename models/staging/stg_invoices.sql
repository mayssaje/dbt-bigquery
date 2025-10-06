with source as (
    select
        *
    from {{ source('raw', 'invoices') }}
)

select *,
current_timestamp() as ingestion_timestamp
 from source
