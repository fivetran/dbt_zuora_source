
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
        country,
        created_by_id,
        created_date,
        description, 
        first_name, 
        last_name,  
        postal_code,
        state,
        updated_by_id,
        updated_date,
        work_email,
        work_phone
    from fields
)

select *
from final
