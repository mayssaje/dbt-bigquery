with source as (
select 
    id  as customer_id,
    company,
    last_name,
    first_name,
    email_address,
    job_title,
    mobile_phone,
    address,
    current_timestamp() as ingestion_timestamp
from {{ ref('stg_customers') }}

),
unique_source as (
    select *, 
    row_number() over(partition by customer_id) as row_number
    from source
)


select *
except (row_number),
from unique_source 
where row_number =1

