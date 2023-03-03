
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
[0m01:16:26  [[33mWARNING[0m]: Configuration paths exist in your dbt_project.yml file which do not apply to any resources.
There are 1 unused configuration paths:
- models.development.example

[0m01:16:29          _fivetran_deleted,
        _fivetran_synced,
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
        effective_policy,
        id,
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
        sub_type,
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
