with base as (

    select * 
    from {{ ref('stg_zuora__product_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__product_tmp')),
                staging_columns=get_product_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as product_id, 
        allow_feature_changes,
        created_by_id, 
        created_date,
        category,
        description as product_description, 
        effective_end_date,
        effective_start_date,
        name as product_name,
        sku,
        updated_by_id,
        updated_date,
        _fivetran_synced
    from fields
)

select * 
from final