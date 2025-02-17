{{
    config(
        materialized='incremental',
        unique_key='ssn',
        sync_all_columns='true',
        post_hook =["update {{this}} set is_active='N'
        where ssn not in (Select ssn from {{source('dc_hc_sales','doctor')}})"]
        )
}}

with source_data as (

select ssn,
name,
speciality,
year_experience,
load_date,
'Y' is_active,
CURRENT_TIMESTAMP as dbt_updated_date,
from {{ source('dc_hc_sales','doctor') }}

)

select *
from source_data
{% if is_incremental() %}
where load_date >= (select coalesce(max(dbt_updated_date),'1900-01-01') from {{ this }} )
{% endif %}