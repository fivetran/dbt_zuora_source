
with base as (

    select * 
    from {{ ref('stg_zuora__journal_entry_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__journal_entry_tmp')),
                staging_columns=get_journal_entry_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_deleted,
        _fivetran_synced,
        accounting_period_id,
        created_by_id,
        created_date,
        currency,
        home_currency,
        id,
        journal_entry_date,
        journal_run_id,
        notes,
        number,
        product_s,
        status,
        transaction_count,
        transaction_type,
        transfer_date,
        transferred_by,
        transferred_to_accounting,
        updated_by_id,
        updated_date
    from fields
)

select *
from final
