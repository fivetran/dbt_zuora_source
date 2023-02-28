with base as (

    select * 
    from {{ ref('stg_zuora__contact_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__contact_tmp')),
                staging_columns=get_contact_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as contact_id, 
        account_id,
        address_1,
        address_2,
        city,
        created_date,
        country,
        first_name,
        last_name,
        postal_code,
        state,
        updated_date,
        work_email,
        _fivetran_synced
    from fields
)

select * 
from final  