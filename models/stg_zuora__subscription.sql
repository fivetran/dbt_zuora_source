
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
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        auto_renew,
        bill_to_contact_id,
        cancel_reason,
        cancelled_date,
        contract_acceptance_date,
        contract_effective_date,
        cpq_bundle_json_id_qt,
        created_by_id,
        created_date,
        creator_account_id,
        creator_invoice_owner_id,
        current_term,
        current_term_period_type, 
        default_payment_method_id,
        externally_managed_by,
        id,
        initial_term,
        initial_term_period_type,
        invoice_owner_id,
        invoice_template_id,
        is_invoice_separate,
        is_latest_version,
        last_booking_date,
        name,
        notes,
        opportunity_close_date_qt,
        opportunity_name_qt,
        original_created_date,
        original_id,
        parent_account_id,
        payment_term,
        previous_subscription_id,
        quote_business_type_qt,
        quote_number_qt,
        quote_type_qt,
        renewal_setting,
        renewal_term,
        renewal_term_period_type,
        revision,
        sequence_set_id,
        service_activation_date,
        sold_to_contact_id,
        status,
        subscription_end_date,
        subscription_start_date,
        subscription_version_amendment_id,
        term_end_date,
        term_start_date,
        term_type, 
        updated_by_id,
        updated_date,
        version
        {{ fivetran_utils.fill_pass_through_columns('zuora_subscription_pass_through_columns') }}
    from fields
)

select *
from final
