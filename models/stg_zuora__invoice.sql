
with base as (

    select * 
    from {{ ref('stg_zuora__invoice_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__invoice_tmp')),
                staging_columns=get_invoice_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        adjustment_amount,
        amount,
        amount_currency_rounding,
        amount_home_currency,
        amount_without_tax,
        amount_without_tax_currency_rounding,
        amount_without_tax_home_currency,
        auto_pay,
        balance,
        bill_to_contact_id,
        comments,
        created_by_id,
        created_date,
        credit_balance_adjustment_amount,
        credit_memo_amount,
        default_payment_method_id,
        due_date,
        exchange_rate,
        exchange_rate_date,
        home_currency,
        id,
        includes_one_time,
        includes_recurring,
        includes_usage,
        invoice_date,
        invoice_number,
        last_email_sent_date,
        parent_account_id,
        payment_amount,
        payment_term,
        posted_by,
        posted_date,
        provider_exchange_rate_date,
        refund_amount,
        reversed,
        sequence_set_id,
        sold_to_contact_id,
        source,
        source_id,
        source_type,
        status,
        target_date,
        tax_amount,
        tax_exempt_amount,
        tax_message,
        tax_status,
        template_id,
        transaction_currency,
        transferred_to_accounting,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
