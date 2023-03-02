
with base as (

    select * 
    from {{ ref('stg_zuora__payment_method_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__payment_method_tmp')),
                staging_columns=get_payment_method_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        ach_aba_code,
        ach_account_name,
        ach_account_number_mask,
        ach_account_type,
        ach_address_1,
        ach_address_2,
        ach_bank_name,
        ach_city,
        ach_country,
        ach_postal_code,
        ach_state,
        active,
        bank_branch_code,
        bank_check_digit,
        bank_city,
        bank_code,
        bank_identification_number,
        bank_name,
        bank_postal_code,
        bank_street_name,
        bank_street_number,
        bank_transfer_account_name,
        bank_transfer_account_number_mask,
        bank_transfer_account_type,
        bank_transfer_type,
        business_identification_code,
        city,
        company_name,
        country,
        created_by_id,
        created_date,
        credit_card_address_1,
        credit_card_address_2,
        credit_card_city,
        credit_card_country,
        credit_card_expiration_month,
        credit_card_expiration_year,
        credit_card_holder_name,
        credit_card_mask_number,
        credit_card_postal_code,
        credit_card_state,
        credit_card_type,
        device_session_id,
        email,
        existing_mandate,
        first_name,
        iban,
        id,
        identity_number,
        ipaddress,
        is_company,
        last_failed_sale_transaction_date,
        last_name,
        last_transaction_date_time,
        last_transaction_status,
        mandate_creation_date,
        mandate_id,
        mandate_reason,
        mandate_received,
        mandate_status,
        mandate_update_date,
        max_consecutive_payment_failures,
        method_reference_id,
        method_specific_data,
        name,
        num_consecutive_failures,
        payment_method_status,
        payment_retry_window,
        paypal_baid,
        paypal_email,
        paypal_preapproval_key,
        paypal_type,
        phone,
        postal_code,
        second_token_id,
        state,
        street_name,
        street_number,
        sub_type,
        token_id,
        total_number_of_error_payments,
        total_number_of_processed_payments,
        type,
        updated_by_id,
        updated_date,
        use_default_retry_rule,
        user_reference_id
    from fields
)

select *
from final
