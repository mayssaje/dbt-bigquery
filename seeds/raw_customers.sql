CREATE OR REPLACE EXTERNAL TABLE `dbt_mjebari.customers` (
    id STRING,
    name STRING
)
OPTIONS (
format = 'CSV',
uris = ['gs://europe-west1-dbt-airflow-33db5cc2-bucket/data/raw_customers.csv'], 
skip_leading_rows = 1
);