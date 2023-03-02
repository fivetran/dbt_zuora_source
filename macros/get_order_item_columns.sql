{% macro get_order_item_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "amendment_id", "datatype": dbt.type_string()},
    {"name": "created_by_id", "datatype": dbt.type_string()},
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "end_date", "datatype": "date"},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "order_action_id", "datatype": dbt.type_string()},
    {"name": "order_id", "datatype": dbt.type_string()},
    {"name": "product_id", "datatype": dbt.type_string()},
    {"name": "product_rate_plan_charge_id", "datatype": dbt.type_string()},
    {"name": "product_rate_plan_id", "datatype": dbt.type_string()},
    {"name": "quantity", "datatype": dbt.type_float()},
    {"name": "rate_plan_charge_id", "datatype": dbt.type_string()},
    {"name": "rate_plan_id", "datatype": dbt.type_string()},
    {"name": "start_date", "datatype": "date"},
    {"name": "subscription_id", "datatype": dbt.type_string()},
    {"name": "updated_by_id", "datatype": dbt.type_string()},
    {"name": "updated_date", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
