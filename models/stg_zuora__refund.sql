
with base as (

    select * 
    from {{ ref('stg_zuora__refund_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__refund_tmp')),
                staging_columns=get_refund_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_deleted,
        _fivetran_synced,
        accounting_code,
        amount,
        cancelled_on,
        comment,
        created_by_id,
        created_date,
        gateway,
        gateway_reconciliation_reason,
        gateway_reconciliation_status,
        gateway_response,
        gateway_response_code,
        gateway_state,
        id,
        marked_for_submission_on,
        method_type,
        payment_method_id,
        payout_id,
        reason_code,
        reference_id,
        refund_date,
        refund_number,
        refund_transaction_time,
        second_refund_reference_id,
        settled_on,
        soft_descriptor,
        soft_descriptor_phone,
        source_type,
        status,
        submitted_on,
        transferred_to_accounting,
        type,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
