{% macro get_account_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "account_number", "datatype": dbt.type_string()},
    {"name": "additional_email_addresses", "datatype": dbt.type_string()},
    {"name": "allow_invoice_edit", "datatype": "boolean"},
    {"name": "auto_pay", "datatype": "boolean"},
    {"name": "balance", "datatype": dbt.type_float()},
    {"name": "batch", "datatype": dbt.type_string()},
    {"name": "bcd_setting_option", "datatype": dbt.type_string()},
    {"name": "bill_cycle_day", "datatype": dbt.type_int()},
    {"name": "bill_to_contact_id", "datatype": dbt.type_string()},
    {"name": "bill_to_id", "datatype": dbt.type_string()},
    {"name": "communication_profile_id", "datatype": dbt.type_string()},
    {"name": "created_by_id", "datatype": dbt.type_string()},
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "credit_balance", "datatype": dbt.type_float()},
    {"name": "crm_id", "datatype": dbt.type_string()},
    {"name": "currency", "datatype": dbt.type_string()},
    {"name": "customer_service_rep_name", "datatype": dbt.type_string()},
    {"name": "default_payment_method_id", "datatype": dbt.type_string()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "invoice_delivery_prefs_email", "datatype": "boolean"},
    {"name": "invoice_delivery_prefs_print", "datatype": "boolean"},
    {"name": "invoice_template_id", "datatype": dbt.type_string()},
    {"name": "last_invoice_date", "datatype": dbt.type_timestamp()},
    {"name": "mrr", "datatype": dbt.type_float()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "notes", "datatype": dbt.type_string()},
    {"name": "parent_account_id", "datatype": dbt.type_string()},
    {"name": "parent_id", "datatype": dbt.type_string()},
    {"name": "payment_gateway", "datatype": dbt.type_string()},
    {"name": "payment_term", "datatype": dbt.type_string()},
    {"name": "purchase_order_number", "datatype": dbt.type_string()},
    {"name": "sales_rep_name", "datatype": dbt.type_string()},
    {"name": "sequence_set_id", "datatype": dbt.type_string()},
    {"name": "sold_to_contact_id", "datatype": dbt.type_string()},
    {"name": "sold_to_id", "datatype": dbt.type_string()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "tax_company_code", "datatype": dbt.type_string()},
    {"name": "tax_exempt_certificate_id", "datatype": dbt.type_string()},
    {"name": "tax_exempt_certificate_type", "datatype": dbt.type_string()},
    {"name": "tax_exempt_description", "datatype": dbt.type_string()},
    {"name": "tax_exempt_effective_date", "datatype": dbt.type_timestamp()},
    {"name": "tax_exempt_entity_use_code", "datatype": dbt.type_string()},
    {"name": "tax_exempt_expiration_date", "datatype": dbt.type_timestamp()},
    {"name": "tax_exempt_issuing_jurisdiction", "datatype": dbt.type_string()},
    {"name": "tax_exempt_status", "datatype": dbt.type_string()},
    {"name": "testcustom_1_c", "datatype": dbt.type_string()},
    {"name": "testcustom_2_c", "datatype": dbt.type_string()},
    {"name": "total_debit_memo_balance", "datatype": dbt.type_float()},
    {"name": "total_invoice_balance", "datatype": dbt.type_float()},
    {"name": "unapplied_balance", "datatype": dbt.type_float()},
    {"name": "unapplied_credit_memo_amount", "datatype": dbt.type_float()},
    {"name": "updated_by_id", "datatype": dbt.type_string()},
    {"name": "updated_date", "datatype": dbt.type_timestamp()},
    {"name": "vatid", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}