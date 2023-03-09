
with base as (

    select * 
    from {{ ref('stg_zuora__amendment_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__amendment_tmp')),
                staging_columns=get_amendment_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as amendment_id,
        auto_renew,
        booking_date,
        code,
        contract_effective_date,
        created_by_id,
        created_date,
        current_term,
        current_term_period_type,
        customer_acceptance_date,
        description,
        effective_date,
        name,
        new_rate_plan_id,
        removed_rate_plan_id,
        renewal_setting,
        renewal_term,
        renewal_term_period_type,
        resume_date,
        service_activation_date,
        specific_update_date,
        status,
        subscription_id,
        suspend_date,
        term_start_date,
        term_type,
        type,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
