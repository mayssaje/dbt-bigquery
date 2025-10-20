{{ config(
    materialized='table'
) }}

WITH employees_externe AS (
    SELECT * 
    FROM `dbt_mjebari.employees_externe`
),
deduped AS (
    SELECT * EXCEPT(row_num)
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS row_num
        FROM employees_externe
    )
    WHERE row_num = 1
)
SELECT * FROM deduped
