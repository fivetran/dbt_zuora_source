
with base as (

    select * 
    from {{ ref('stg_zuora__accounting_code_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__accounting_code_tmp')),
                staging_columns=get_accounting_code_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as accounting_code_id,
        _fivetran_synced,
        category,
        created_by_id,
        created_date,
        glaccount_name,
        glaccount_number,
        name,
        notes,
        status,
        type,
        updated_by_id,
        updated_date,
        row_number() over (partition by id order by updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
