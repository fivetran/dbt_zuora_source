
with base as (

    select * 
    from {{ ref('stg_zuora__journal_entry_item_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__journal_entry_item_tmp')),
                staging_columns=get_journal_entry_item_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as journal_entry_item_id,
        _fivetran_deleted,
        _fivetran_synced,
        accounting_code_id,
        accounting_period_id,
        amount,
        amount_home_currency,
        created_by_id,
        created_date,
        currency,
        home_currency,
        journal_entry_id,
        journal_run_id,
        type,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
