
with base as (

    select * 
    from {{ ref('stg_zuora__taxation_item_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__taxation_item_tmp')),
                staging_columns=get_taxation_item_columns()
            )
        }}
    from base
),

final as (
    
    select  
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        account_receivable_accounting_code_id,
        accounting_code,
        accounting_period_id,
        amendment_id,
        balance,
        bill_to_contact_id,
        created_by_id,
        created_date,
        credit_amount,
        customer_code,
        default_payment_method_id,
        exchange_rate,
        exchange_rate_date,
        exempt_amount,
        exempt_amount_currency_rounding,
        exempt_amount_home_currency,
        exempt_certificate,
        home_currency,
        id,
        invoice_id,
        invoice_item_id,
        journal_entry_id,
        journal_run_id,
        jurisdiction,
        location_code,
        name,
        parent_account_id,
        payment_amount,
        product_id,
        product_rate_plan_charge_id,
        product_rate_plan_id,
        provider_exchange_rate_date,
        rate_plan_charge_id,
        rate_plan_id,
        sales_tax_payable_accounting_code_id,
        seller_registration,
        sold_to_contact_id,
        subscription_id,
        tax_amount,
        tax_amount_currency_rounding,
        tax_amount_home_currency,
        tax_code,
        tax_code_description,
        tax_date,
        tax_description,
        tax_mode,
        tax_rate,
        tax_rate_description,
        tax_rate_type,
        tax_rule_id,
        transaction_currency,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
