
with base as (

    select * 
    from {{ ref('stg_zuora__invoice_item_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__invoice_item_tmp')),
                staging_columns=get_invoice_item_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as invoice_item_id,
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        account_receivable_accounting_code_id,
        accounting_code,
        accounting_period_id,
        amendment_id,
        applied_to_invoice_item_id,
        balance,
        bill_to_contact_id,
        booking_reference,
        charge_amount,
        charge_amount_currency_rounding,
        charge_amount_home_currency,
        charge_date,
        charge_name,
        created_by_id,
        created_date,
        default_payment_method_id,
        deferred_revenue_accounting_code_id,
        exchange_rate,
        exchange_rate_date,
        exclude_item_billing_from_revenue_accounting,
        home_currency,
        invoice_id,
        journal_entry_id,
        journal_run_id,
        parent_account_id,
        processing_type,
        product_id,
        product_rate_plan_charge_id,
        product_rate_plan_id,
        provider_exchange_rate_date,
        quantity,
        rate_plan_charge_id,
        rate_plan_id,
        recognized_revenue_accounting_code_id,
        rev_rec_start_date,
        service_end_date,
        service_start_date,
        sku,
        sold_to_contact_id,
        source_item_type,
        subscription_id,
        tax_amount,
        tax_code,
        tax_exempt_amount,
        tax_mode,
        transaction_currency,
        unit_price,
        uom,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
