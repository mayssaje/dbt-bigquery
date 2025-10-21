WITH source AS (
    SELECT
        id AS customer_id,
        company,
        last_name,
        first_name,
        email_address,
        job_title,
        mobile_phone,
        address,
        current_timestamp() AS ingestion_timestamp
    FROM {{ ref('stg_customers') }}
),

unique_source AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY customer_id) AS row_number
    FROM source
)

SELECT *
EXCEPT (row_number)
FROM unique_source
WHERE row_number = 1
;
