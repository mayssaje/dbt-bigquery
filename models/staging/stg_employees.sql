with source as (
    select
        *
    from {{ source('raw', 'employees') }}
)

select *,
current_timestamp() as ingestion_timestamp
 from source