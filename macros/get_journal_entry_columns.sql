{% macro get_journal_entry_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "accounting_period_id", "datatype": dbt.type_string()},
    {"name": "created_by_id", "datatype": dbt.type_string()},
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "currency", "datatype": dbt.type_string()},
    {"name": "home_currency", "datatype": dbt.type_string()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "journal_entry_date", "datatype": "date"},
    {"name": "journal_run_id", "datatype": dbt.type_string()},
    {"name": "notes", "datatype": dbt.type_string()},
    {"name": "number", "datatype": dbt.type_string()},
    {"name": "product_s", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "transaction_count", "datatype": dbt.type_int()},
    {"name": "transaction_type", "datatype": dbt.type_string()},
    {"name": "transfer_date", "datatype": dbt.type_timestamp()},
    {"name": "transferred_by", "datatype": dbt.type_string()},
    {"name": "transferred_to_accounting", "datatype": dbt.type_string()},
    {"name": "updated_by_id", "datatype": dbt.type_string()},
    {"name": "updated_date", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
