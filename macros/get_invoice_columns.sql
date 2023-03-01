{% macro get_invoice_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_string()}, 
    {"name": "account_id", "datatype": dbt.type_string()}, 
    {"name": "adjustment_amount", "datatype": dbt.type_float()}, 
    {"name": "amount", "datatype": dbt.type_float()}, 
    {"name": "amount_currency_rounding", "datatype": dbt.type_float()}, 
    {"name": "amount_home_currency", "datatype": dbt.type_float()}, 
    {"name": "amount_without_tax_home_currency", "datatype": dbt.type_float()}, 
    {"name": "auto_pay", "datatype": "boolean"}, 
    {"name": "balance", "datatype": dbt.type_float()}, 
    {"name": "bill_to_contact_id", "datatype": dbt.type_string()}, 
    {"name": "created_by_id", "datatype": dbt.type_string()}, 
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "default_payment_method_id", "datatype": dbt.type_string()}, 
    {"name": "due_date", "datatype": dbt.type_timestamp()},
    {"name": "exchange_rate", "datatype": dbt.type_float()}, 
    {"name": "exchange_rate_date", "datatype": dbt.type_timestamp()},
    {"name": "home_currency", "datatype": dbt.type_string()}, 
    {"name": "invoice_date", "datatype": dbt.type_timestamp()},
    {"name": "invoice_number", "datatype": dbt.type_string()}, 
    {"name": "payment_amount", "datatype": dbt.type_float()}, 
    {"name": "sold_to_contact_id", "datatype": dbt.type_string()},
    {"name": "source_id", "datatype": dbt.type_string()},
    {"name": "source_type", "datatype": dbt.type_string()},
    {"name": "transaction_currency", "datatype": dbt.type_string()}, 

    {"name": "updated_by_id", "datatype": dbt.type_string()}, 
    {"name": "updated_date", "datatype": dbt.type_timestamp()},
] %}

{{ return(columns) }}

{% endmacro %}