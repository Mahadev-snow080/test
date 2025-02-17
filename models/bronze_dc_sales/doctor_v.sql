{{ config(materialized='veiw')}}


/*{{ config(materialized='table') }}
transient='false',
database='dc_hc_sales_dev',
schema ='staging')}}*/

with source_data as (

    select SSN, NAME, SPECIALITY, YEAR_EXPERIENCE
    from {{ source('dc_hc_sales','doctor') }}

)

select *
from source_data