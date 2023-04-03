
with base as (

    select * 
    from {{ ref('stg_zuora__rate_plan_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__rate_plan_tmp')),
                staging_columns=get_rate_plan_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as rate_plan_id,
        account_id,
        amendment_id,
        bill_to_contact_id,
        created_by_id,
        created_date,
        default_payment_method_id,  
        name,
        original_rate_plan_id, 
        product_id,
        product_rate_plan_id,
        sold_to_contact_id,
        subscription_id, 
        updated_by_id,
        updated_date,
        row_number() over (partition by id order by updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
