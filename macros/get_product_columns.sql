{% macro get_contact_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_string()}, 
    {"name": "allow_feature_changes", "datatype": "boolean"},
    {"name": "created_by_id", "datatype": dbt.type_string()}, 
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "category", "datatype": dbt.type_string()}, 
    {"name": "description", "datatype": dbt.type_string()}, 
    {"name": "effective_end_date", "datatype": dbt.type_timestamp()}, 
    {"name": "effective_start_date", "datatype": dbt.type_timestamp()}, 
    {"name": "name", "datatype": dbt.type_string()}, 
] %}

{{ return(columns) }}

{% endmacro %}