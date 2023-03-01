with base as (

    select * 
    from {{ ref('stg_zuora__account_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__account_tmp')),
                staging_columns=get_account_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as account_id, 
        account_number,
        auto_pay,
        balance,
        bill_to_contact_id,
        created_by_id,
        created_date,
        credit_balance,
        currency,
        default_payment_method_id,
        last_invoice_date,
        invoice_template_id,
        mrr,
        name as account_name,
        parent_account_id,
        payment_term,
        sold_to_contact_id,
        status as account_status, 
        total_invoice_balance,
        _fivetran_synced
    from fields
)

select * 
from final  