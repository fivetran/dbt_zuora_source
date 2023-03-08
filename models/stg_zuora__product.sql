
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
        _fivetran_deleted,
        _fivetran_synced,
        allow_feature_changes,
        category,
        created_by_id,
        created_date,
        description,
        effective_end_date,
        effective_start_date,
        name,
        sku,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
