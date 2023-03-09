{% macro get_payment_method_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "account_id", "datatype": dbt.type_string()},
    {"name": "ach_aba_code", "datatype": dbt.type_string()},
    {"name": "ach_account_name", "datatype": dbt.type_string()},
    {"name": "ach_account_number_mask", "datatype": dbt.type_string()},
    {"name": "ach_account_type", "datatype": dbt.type_string()},
    {"name": "ach_address_1", "datatype": dbt.type_string()},
    {"name": "ach_address_2", "datatype": dbt.type_string()},
    {"name": "ach_bank_name", "datatype": dbt.type_string()},
    {"name": "ach_city", "datatype": dbt.type_string()},
    {"name": "ach_country", "datatype": dbt.type_string()},
    {"name": "ach_postal_code", "datatype": dbt.type_string()},
    {"name": "ach_state", "datatype": dbt.type_string()},
    {"name": "active", "datatype": "boolean"},
    {"name": "bank_branch_code", "datatype": dbt.type_string()},
    {"name": "bank_check_digit", "datatype": dbt.type_string()},
    {"name": "bank_city", "datatype": dbt.type_string()},
    {"name": "bank_code", "datatype": dbt.type_string()},
    {"name": "bank_identification_number", "datatype": dbt.type_string()},
    {"name": "bank_name", "datatype": dbt.type_string()},
    {"name": "bank_postal_code", "datatype": dbt.type_string()},
    {"name": "bank_street_name", "datatype": dbt.type_string()},
    {"name": "bank_street_number", "datatype": dbt.type_string()},
    {"name": "bank_transfer_account_name", "datatype": dbt.type_string()},
    {"name": "bank_transfer_account_number_mask", "datatype": dbt.type_string()},
    {"name": "bank_transfer_account_type", "datatype": dbt.type_string()},
    {"name": "bank_transfer_type", "datatype": dbt.type_string()},
    {"name": "business_identification_code", "datatype": dbt.type_string()},
    {"name": "city", "datatype": dbt.type_string()},
    {"name": "company_name", "datatype": dbt.type_string()},
    {"name": "country", "datatype": dbt.type_string()},
    {"name": "created_by_id", "datatype": dbt.type_string()},
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "credit_card_address_1", "datatype": dbt.type_string()},
    {"name": "credit_card_address_2", "datatype": dbt.type_string()},
    {"name": "credit_card_city", "datatype": dbt.type_string()},
    {"name": "credit_card_country", "datatype": dbt.type_string()},
    {"name": "credit_card_expiration_month", "datatype": dbt.type_int()},
    {"name": "credit_card_expiration_year", "datatype": dbt.type_int()},
    {"name": "credit_card_holder_name", "datatype": dbt.type_string()},
    {"name": "credit_card_mask_number", "datatype": dbt.type_string()},
    {"name": "credit_card_postal_code", "datatype": dbt.type_string()},
    {"name": "credit_card_state", "datatype": dbt.type_string()},
    {"name": "credit_card_type", "datatype": dbt.type_string()},
    {"name": "device_session_id", "datatype": dbt.type_string()},
    {"name": "email", "datatype": dbt.type_string()},
    {"name": "existing_mandate", "datatype": dbt.type_string()},
    {"name": "first_name", "datatype": dbt.type_string()},
    {"name": "iban", "datatype": dbt.type_string()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "identity_number", "datatype": dbt.type_string()},
    {"name": "ipaddress", "datatype": dbt.type_string()},
    {"name": "is_company", "datatype": "boolean"},
    {"name": "last_failed_sale_transaction_date", "datatype": dbt.type_timestamp()},
    {"name": "last_name", "datatype": dbt.type_string()},
    {"name": "last_transaction_date_time", "datatype": dbt.type_timestamp()},
    {"name": "last_transaction_status", "datatype": dbt.type_string()},
    {"name": "mandate_creation_date", "datatype": "date"},
    {"name": "mandate_id", "datatype": dbt.type_string()},
    {"name": "mandate_reason", "datatype": dbt.type_string()},
    {"name": "mandate_received", "datatype": dbt.type_string()},
    {"name": "mandate_status", "datatype": dbt.type_string()},
    {"name": "mandate_update_date", "datatype": "date"},
    {"name": "max_consecutive_payment_failures", "datatype": dbt.type_int()},
    {"name": "method_reference_id", "datatype": dbt.type_string()},
    {"name": "method_specific_data", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "num_consecutive_failures", "datatype": dbt.type_int()},
    {"name": "payment_method_status", "datatype": dbt.type_string()},
    {"name": "payment_retry_window", "datatype": dbt.type_int()},
    {"name": "paypal_baid", "datatype": dbt.type_string()},
    {"name": "paypal_email", "datatype": dbt.type_string()},
    {"name": "paypal_preapproval_key", "datatype": dbt.type_string()},
    {"name": "paypal_type", "datatype": dbt.type_string()},
    {"name": "phone", "datatype": dbt.type_string()},
    {"name": "postal_code", "datatype": dbt.type_string()},
    {"name": "second_token_id", "datatype": dbt.type_string()},
    {"name": "state", "datatype": dbt.type_string()},
    {"name": "street_name", "datatype": dbt.type_string()},
    {"name": "street_number", "datatype": dbt.type_string()},
    {"name": "sub_type", "datatype": dbt.type_string()},
    {"name": "token_id", "datatype": dbt.type_string()},
    {"name": "total_number_of_error_payments", "datatype": dbt.type_int()},
    {"name": "total_number_of_processed_payments", "datatype": dbt.type_int()},
    {"name": "type", "datatype": dbt.type_string()},
    {"name": "updated_by_id", "datatype": dbt.type_string()},
    {"name": "updated_date", "datatype": dbt.type_timestamp()},
    {"name": "use_default_retry_rule", "datatype": "boolean"},
    {"name": "user_reference_id", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}