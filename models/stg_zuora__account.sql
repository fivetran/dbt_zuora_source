
with base as (

    select * 
    from {{ ref('stg_zuora__account_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__account_tmp')),
                staging_columns=get_account_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as account_id,
        account_number,
        additional_email_addresses,
        allow_invoice_edit,
        auto_pay,
        balance,
        batch,
        bcd_setting_option,
        bill_cycle_day,
        bill_to_contact_id,
        bill_to_id,
        communication_profile_id,
        created_by_id,
        created_date,
        credit_balance,
        crm_id,
        currency,
        customer_service_rep_name,
        default_payment_method_id,

        invoice_delivery_prefs_email,
        invoice_delivery_prefs_print,
        invoice_template_id,
        last_invoice_date,
        mrr,
        name,
        notes,
        parent_account_id,
        parent_id,
        payment_gateway,
        payment_term,
        purchase_order_number,
        sales_rep_name,
        sequence_set_id,
        sold_to_contact_id,
        sold_to_id,
        status,
        tax_company_code,
        tax_exempt_certificate_id,
        tax_exempt_certificate_type,
        tax_exempt_description,
        tax_exempt_effective_date,
        tax_exempt_entity_use_code,
        tax_exempt_expiration_date,
        tax_exempt_issuing_jurisdiction,
        tax_exempt_status, 
        total_debit_memo_balance,
        total_invoice_balance,
        unapplied_balance,
        unapplied_credit_memo_amount,
        updated_by_id,
        updated_date,
        vatid
        {{ fivetran_utils.fill_pass_through_columns('zuora_account_pass_through_columns') }}
    from fields
)

select *
from final
