with base as (

    select * 
    from {{ ref('stg_zuora__contact_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__contact_tmp')),
                staging_columns=get_comment_columns()
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

 
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "account_id", "datatype": dbt.type_string()},
    {"name": "address_1", "datatype": dbt.type_string()},
    {"name": "address_2", "datatype": dbt.type_string()},
    {"name": "city", "datatype": dbt.type_string()},
    {"name": "created_date", "datatype": dbt.type_timestamp()},
    {"name": "country", "datatype": dbt.type_string()},
    {"name": "first_name", "datatype": dbt.type_string()},
    {"name": "last_name", "datatype": dbt.type_string()},
    {"name": "postal_code", "datatype": dbt.type_string()},
    {"name": "state", "datatype": dbt.type_string()},
    {"name": "updated_date", "datatype": dbt.type_timestamp()},
    {"name": "work_email", "datatype": dbt.type_string()},