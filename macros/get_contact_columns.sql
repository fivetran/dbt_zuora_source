{% macro get_contact_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "account_id", "datatype": dbt.type_string()},
    {"name": "address_1", "datatype": dbt.type_string()},
    {"name": "address_2", "datatype": dbt.type_string()},
    {"name": "city", "datatype": dbt.type_string()},
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "country", "datatype": dbt.type_string()},
    {"name": "first_name", "datatype": dbt.type_string()},
    {"name": "last_name", "datatype": dbt.type_string()},
    {"name": "postal_code", "datatype": dbt.type_string()},
    {"name": "state", "datatype": dbt.type_string()},
    {"name": "updated_date", "datatype": dbt.type_timestamp()},
    {"name": "work_email", "datatype": dbt.type_string()},
] %}

{{ return(columns) }}

{% endmacro %}