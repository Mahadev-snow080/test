{% snapshot doctor_snapshot %}  

{{
  config(      
    target_schema='snapshots',      
    strategy='timestamp',      
    unique_key='ssn',      
    updated_at='load_date',
    invalidate_hard_deletes=True
      )  
}}  
/* invalidate_hard_deletes=True delete the record from the snapshot if record is deleted from the source*/
  select * 
  from {{ source('dc_hc_sales','doctor') }}

{% endsnapshot %}