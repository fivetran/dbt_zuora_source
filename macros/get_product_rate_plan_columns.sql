{% macro get_product_rate_plan_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "created_by_id", "datatype": dbt.type_string()},
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "description", "datatype": dbt.type_string()},
    {"name": "effective_end_date", "datatype": "date"},
    {"name": "effective_start_date", "datatype": "date"},
    {"name": "external_id_source_system", "datatype": dbt.type_string()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "product_id", "datatype": dbt.type_string()},
    {"name": "promotion_code_c", "datatype": dbt.type_string()},
    {"name": "updated_by_id", "datatype": dbt.type_string()},
    {"name": "updated_date", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
