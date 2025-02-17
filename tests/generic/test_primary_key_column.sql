{% test primary_key_column(model, column_name) %}

WITH dup_null_record_validation as(
   SELECT {{ column_name }} as primary_key_column,
          COUNT(1) as record_count
          FROM {{ model }}
   GROUP BY 1
)

select * from dup_null_record_validation WHERE primary_key_column is null OR record_count > 1

{% endtest %}