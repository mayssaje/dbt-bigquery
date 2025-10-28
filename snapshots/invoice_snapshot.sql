{% snapshot invoice_snapshot %}
{{
config( 
    target_schema= 'snapshots',
    unique_key ='id',
    strategy ='timestamp',
    updated_at = 'ingestion_timestamp',
    invalidate_hard_deletes = true 
)

}}



select *

from {{ref('stg_invoices') }}

{% endsnapshot%}