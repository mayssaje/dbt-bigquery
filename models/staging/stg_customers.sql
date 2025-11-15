{{config(
    materialized='incremental',
    unique_key='id',
)}}

with source as (

    select
        *,
        -- Hash pour dédupliquer proprement
          to_hex(sha256(
            CONCAT(
                COALESCE(CAST(id AS STRING), ''),
                '||', COALESCE(CAST(company AS STRING), ''),
                '||', COALESCE(CAST(last_name AS STRING), ''),
                '||', COALESCE(CAST(first_name AS STRING), ''),
                '||', COALESCE(CAST(email_address AS STRING), ''),
                '||', COALESCE(CAST(job_title AS STRING), ''),
                '||', COALESCE(CAST(business_phone AS STRING), ''),
                '||', COALESCE(CAST(home_phone AS STRING), ''),
                '||', COALESCE(CAST(mobile_phone AS STRING), ''),
                '||', COALESCE(CAST(fax_number AS STRING), ''),
                '||', COALESCE(CAST(address AS STRING), ''),
                '||', COALESCE(CAST(city AS STRING), ''),
                '||', COALESCE(CAST(state_province AS STRING), ''),
                '||', COALESCE(CAST(zip_postal_code AS STRING), ''),
                '||', COALESCE(CAST(country_region AS STRING), ''),
                '||', COALESCE(CAST(web_page AS STRING), ''),
                '||', COALESCE(CAST(notes AS STRING), ''),
                '||', COALESCE(CAST(attachments AS STRING), '')
            )
        )) AS row_hash
    from {{ source('raw', 'customers') }}

),

deduped as (

    select *
    from (
        select *,
            row_number() over (
                partition by id
                order by row_hash desc
            ) as rn
        from source
    )
    where rn = 1

)

select
    *,
    current_timestamp() as ingestion_timestamp
from deduped
