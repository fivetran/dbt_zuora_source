
with base as (

    select * 
    from {{ ref('stg_zuora__subscription_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__subscription_tmp')),
                staging_columns=get_subscription_columns()
            )
        }}
    from base
),

final as (
    
    select  
        id as subscription_id,
        account_id,
        auto_renew,
        bill_to_contact_id,
        cancel_reason,
        cancelled_date,
        contract_acceptance_date,
        contract_effective_date,
        created_by_id,
        created_date,
        current_term,
        current_term_period_type, 
        default_payment_method_id,
        externally_managed_by,
        initial_term,
        initial_term_period_type,
        invoice_owner_id,
        is_invoice_separate,
        is_latest_version,
        last_booking_date,
        name,
        notes,
        original_created_date,
        original_id,
        parent_account_id,
        payment_term,
        previous_subscription_id,
        renewal_term,
        renewal_term_period_type,
        revision,
        service_activation_date,
        sold_to_contact_id,
        status,
        subscription_end_date,
        subscription_start_date,
        term_end_date,
        term_start_date,
        term_type, 
        updated_by_id,
        updated_date,
        version,
        row_number() over (partition by id order by updated_date desc) = 1 as is_most_recent_record

        {{ fivetran_utils.fill_pass_through_columns('zuora_subscription_pass_through_columns') }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
