
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
        auto_pay,
        balance,
        batch, 
        bill_cycle_day,
        bill_to_contact_id,
        created_by_id,
        created_date,
        credit_balance,
        crm_id,
        currency,
        default_payment_method_id,
        last_invoice_date,
        mrr,
        name,
        notes,
        parent_account_id,
        payment_term,
        sold_to_contact_id,
        status, 
        tax_exempt_effective_date, 
        tax_exempt_expiration_date, 
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
