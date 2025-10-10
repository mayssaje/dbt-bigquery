{%- macro create_external_employees_table() -%}

  {% set create_table %}
    CREATE OR REPLACE EXTERNAL TABLE `dbt_raw.employees` (
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
        uris = ["gs://europe-west1-dbt-airflow-33db5cc2-bucket/data/employees.csv"],
        skip_leading_rows = 1,
        field_delimiter = ","
    );
  {% endset %}

  {% do run_query(create_table) %}

{%- endmacro -%}
