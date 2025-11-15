{{
    config(
        materialized='incremental',
        unique_key='id',
        on_schema_change='fail'
    )
}}
with source as (
    select
        *
    from {{ source('raw', 'orders') }}
)


select *,
current_timestamp() as ingestion_timestamp
 from source
