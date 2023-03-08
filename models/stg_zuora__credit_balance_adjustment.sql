
with base as (

    select * 
    from {{ ref('stg_zuora__credit_balance_adjustment_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__credit_balance_adjustment_tmp')),
                staging_columns=get_credit_balance_adjustment_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as credit_balance_adjustment_id,
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        account_receivable_accounting_code_id,
        accounting_code,
        accounting_period_id,
        adjustment_date,
        amount,
        amount_currency_rounding,
        amount_home_currency,
        bill_to_contact_id,
        cancelled_on,
        comment,
        created_by_id,
        created_date,
        customer_cash_on_account_accounting_code_id,
        default_payment_method_id,
        exchange_rate,
        exchange_rate_date,
        home_currency,

        invoice_id,
        journal_entry_id,
        journal_run_id,
        number,
        parent_account_id,
        provider_exchange_rate_date,
        reason_code,
        reference_id,
        sold_to_contact_id,
        source_transaction_id,
        source_transaction_number,
        source_transaction_type,
        status,
        transaction_currency,
        transferred_to_accounting,
        type,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
