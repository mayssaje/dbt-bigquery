with source as (
    select
        *
    from {{ source('raw', 'customers') }}
)


select *,
current_timestamp() as ingestion_timestamp
from source
