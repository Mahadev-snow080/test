{% test check_string_length(model, column_name, required_len) %}
select *
from {{ model }}
where length({{ column_name }}) < {{ required_len }}
{% endtest %}