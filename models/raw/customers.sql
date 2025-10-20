{{ config(
    materialized='incremental',
    unique_key='id'
) }}

{{ create_external_customers_table() }}

-- Étape 1 : Créer un CTE avec last_updated
WITH source AS (
    SELECT
       *,
        CURRENT_TIMESTAMP() AS last_updated ,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY CURRENT_TIMESTAMP()  DESC) AS row_num
    FROM `dbt_raw.customers`
)


SELECT *
FROM source
WHERE row_num = 1
{% if is_incremental() %}
  AND last_updated > (SELECT MAX(last_updated) FROM {{ this }})
{% endif %}