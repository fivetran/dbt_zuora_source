{% macro get_order_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_string()}, 
    {"name": "account_id", "datatype": dbt.type_string()}, 
    {"name": "bill_to_contact_id", "datatype": dbt.type_string()}, 
    {"name": "category", "datatype": dbt.type_string()}, 
    {"name": "created_by_id", "datatype": dbt.type_string()}, 
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "default_payment_method_id", "datatype": dbt.type_string()},
    {"name": "description", "datatype": dbt.type_string()},
    {"name": "order_date", "datatype": dbt.type_timestamp()},
    {"name": "order_number", "datatype": dbt.type_string()}, 
    {"name": "parent_account_id", "datatype": dbt.type_string()},
    {"name": "sold_to_contact_id", "datatype": dbt.type_string()},
    {"name": "state", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "updated_date", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}