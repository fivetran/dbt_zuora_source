
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
        id as taxation_item_id,
        account_id,
        account_receivable_accounting_code_id,
        accounting_code, 
        amendment_id,
        balance,
        bill_to_contact_id,
        created_by_id,
        created_date,
        credit_amount,
        exchange_rate,
        exchange_rate_date,
        exempt_amount, 
        exempt_amount_home_currency, 
        home_currency,
        invoice_id,
        invoice_item_id,
        journal_entry_id,   
        name,
        parent_account_id,
        payment_amount,
        product_id,
        product_rate_plan_charge_id,
        product_rate_plan_id, 
        rate_plan_charge_id,
        rate_plan_id,
        sales_tax_payable_accounting_code_id, 
        sold_to_contact_id,
        subscription_id,
        tax_amount, 
        tax_amount_home_currency,
        tax_date,
        tax_description,
        tax_mode,
        tax_rate_type, 
        transaction_currency,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
