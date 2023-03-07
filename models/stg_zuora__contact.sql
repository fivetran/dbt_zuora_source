
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
        _fivetran_deleted,
        _fivetran_synced,
        account_id,
        address_1,
        address_2,
        city,
        country,
        county,
        created_by_id,
        created_date,
        description,
        fax,
        first_name,
        home_phone,
        last_name,
        mobile_phone,
        nick_name,
        other_phone,
        other_phone_type,
        personal_email,
        postal_code,
        state,
        tax_region,
        updated_by_id,
        updated_date,
        work_email,
        work_phone
    from fields
)

select *
from final
