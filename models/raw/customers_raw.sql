{{ config(
    materialized='table',
    alias='customers_stag'
) }}

{{ create_external_customers_table() }}

select 
 Id,
 split(name, ' ')[safe_offset(0)] as nom
from `dbt_mjebari.customers_raw`
