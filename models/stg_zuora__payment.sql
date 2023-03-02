
with base as (

    select * 
    from {{ ref('stg_zuora__payment_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__payment_tmp')),
                staging_columns=get_payment_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        accounting_code,
        amount,
        amount_currency_rounding,
        amount_home_currency,
        applied_amount,
        applied_credit_balance_amount,
        auth_transaction_id,
        bank_identification_number,
        bill_to_contact_id,
        cancelled_on,
        comment,
        created_by_id,
        created_date,
        currency,
        default_payment_method_id,
        effective_date,
        exchange_rate,
        exchange_rate_date,
        gateway,
        gateway_order_id,
        gateway_reconciliation_reason,
        gateway_reconciliation_status,
        gateway_response,
        gateway_response_code,
        gateway_state,
        home_currency,
        id,
        is_standalone,
        marked_for_submission_on,
        parent_account_id,
        payment_method_id,
        payment_number,
        payout_id,
        provider_exchange_rate_date,
        reference_id,
        referenced_payment_id,
        refund_amount,
        second_payment_reference_id,
        settled_on,
        soft_descriptor,
        soft_descriptor_phone,
        sold_to_contact_id,
        source,
        source_name,
        status,
        submitted_on,
        transaction_currency,
        transferred_to_accounting,
        type,
        unapplied_amount,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
