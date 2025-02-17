{{ config(materialized='table',
transient='false') }}

/*{{ config(materialized='table') }}
transient='false',
database='dc_hc_sales_dev',
schema ='staging')}}*/

with source_data as (

    select SSN, NAME, age,address, phy_ssn
    from {{ source('dc_hc_sales','patient') }}

)

select *
from source_data