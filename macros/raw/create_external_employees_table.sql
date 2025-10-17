{%- macro create_external_employees_table() -%}
CREATE OR REPLACE EXTERNAL TABLE `dbt_mjebari.employees_externe` (
    id INT64,
    company STRING,
    last_name STRING,
    first_name STRING,
    email_address STRING,
    job_title STRING,
    business_phone STRING,
    home_phone STRING,
    mobile_phone STRING,
    fax_number STRING,
    address STRING,
    city STRING,
    state_province STRING,
    zip_postal_code STRING,
    country_region STRING,
    web_page STRING,
    notes STRING,
    attachments STRING
)
OPTIONS (
    format = "CSV",
    uris = ["gs://dbt_projet/data/employees/employees_*.csv"],
    skip_leading_rows = 1,
    field_delimiter = ","
);
{%- endmacro -%}
