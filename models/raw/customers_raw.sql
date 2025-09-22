{{ config(
    materialized='table',
    alias='customers_raw_internal'
) }}

{{ create_external_customers_table() }}

select *
from `dbt_mjebari.customers_raw`
