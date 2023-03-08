
with base as (

    select * 
    from {{ ref('stg_zuora__order_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__order_tmp')),
                staging_columns=get_order_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as order_id,
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        bill_to_contact_id,
        category,
        created_by_id,
        created_by_migration,
        created_date,
        default_payment_method_id,
        description,
        error_code,
        error_message,
        order_date,
        order_number,
        parent_account_id,
        response,
        scheduled_date,
        scheduled_date_policy,
        sold_to_contact_id,
        state,
        status,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
