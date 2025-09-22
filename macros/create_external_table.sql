{%- macro create_external_customers_table() -%}

  {% set create_table %}
    CREATE OR REPLACE EXTERNAL TABLE `dbt_mjebari.customers_raw` (
      Id STRING,
      name STRING
    )
    OPTIONS(
      format = "CSV",
      uris = ['gs://europe-west1-dbt-airflow-33db5cc2-bucket/data/raw_customers.csv'],
      skip_leading_rows = 1,
      field_delimiter = ","
    );
  {% endset %}

  {% do run_query(create_table) %}

{%- endmacro -%}
