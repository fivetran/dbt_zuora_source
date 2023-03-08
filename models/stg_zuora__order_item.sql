
with base as (

    select * 
    from {{ ref('stg_zuora__order_item_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__order_item_tmp')),
                staging_columns=get_order_item_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as order_item_id,
        _fivetran_deleted,
        _fivetran_synced,
        amendment_id,
        created_by_id,
        created_date,
        end_date,
        order_action_id,
        order_id,
        product_id,
        product_rate_plan_charge_id,
        product_rate_plan_id,
        quantity,
        rate_plan_charge_id,
        rate_plan_id,
        start_date,
        subscription_id,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
