{% macro get_account_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "account_number", "datatype": dbt.type_string()},
    {"name": "auto_pay", "datatype": "boolean"},
    {"name": "balance", "datatype": dbt.type_float()}, 
    {"name": "bill_to_contact_id", "datatype": dbt.type_string()},
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "credit_balance", "datatype": dbt.type_float()}, 
    {"name": "currency", "datatype": dbt.type_string()}, 
    {"name": "default_payment_method_id", "datatype": dbt.type_string()},
    {"name": "last_invoice_date", "datatype": dbt.type_timestamp()},  
    {"name": "invoice_template_id", "datatype": dbt.type_string()}, 
    {"name": "mrr", "datatype": dbt.type_float()}, 
    {"name": "name", "datatype": dbt.type_string()}, 
    {"name": "parent_account_id", "datatype": dbt.type_string()},
    {"name": "payment_term", "datatype": dbt.type_string()}, 
    {"name": "sold_to_contact_id", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "tax_exempt_status", "datatype": dbt.type_string()},
    {"name": "total_debit_memo_balance", "datatype": dbt.type_float()}, 
    {"name": "total_invoice_balance", "datatype": dbt.type_float()}, 
    {"name": "unapplied_balance", "datatype": dbt.type_float()}, 
] %}

{{ return(columns) }}

{% endmacro %}