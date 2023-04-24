{{ config(enabled=var('zuora__using_refund_invoice_payment', true)) }}

with base as (

    select * 
    from {{ ref('stg_zuora__refund_invoice_payment_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__refund_invoice_payment_tmp')),
                staging_columns=get_refund_invoice_payment_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as refund_invoice_payment_id,
        _fivetran_synced,
        created_by_id,
        created_date,
        refund_amount,
        updated_by_id,
        updated_date,
        row_number() over (partition by id order by updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
