
with base as (

    select * 
    from {{ ref('stg_zuora__product_rate_plan_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__product_rate_plan_tmp')),
                staging_columns=get_product_rate_plan_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_deleted,
        _fivetran_synced,
        created_by_id,
        created_date,
        description,
        effective_end_date,
        effective_start_date,
        external_id_source_system,
        id,
        name,
        product_id,
        promotion_code_c,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
