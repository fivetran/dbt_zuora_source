
with base as (

    select * 
    from {{ ref('stg_zuora__product_rate_plan_charge_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_zuora__product_rate_plan_charge_tmp')),
                staging_columns=get_product_rate_plan_charge_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as product_rate_plan_charge_id,
        _fivetran_deleted,
        _fivetran_synced,
        account_receivable_accounting_code_id,
        accounting_code,
        apply_discount_to,
        bill_cycle_day,
        bill_cycle_type,
        billing_period,
        billing_period_alignment,
        billing_timing,
        charge_model,
        charge_type,
        created_by_id,
        created_date,
        default_quantity,
        deferred_revenue_account,
        deferred_revenue_accounting_code_id,
        description,
        discount_class_id,
        discount_level,
        end_date_condition,
        exclude_item_billing_from_revenue_accounting,
        exclude_item_booking_from_revenue_accounting,
        included_units,
        is_stacked_discount,
        legacy_revenue_reporting,
        list_price_base,
        max_quantity,
        min_quantity,
        name,
        number_of_period,
        overage_calculation_option,
        overage_unused_units_credit_option,
        price_change_option,
        price_increase_percentage,
        price_upsell_quantity_stacked,
        product_id,
        product_rate_plan_id,
        rating_group,
        recognized_revenue_account,
        recognized_revenue_accounting_code_id,
        rev_rec_code,
        rev_rec_trigger_condition,
        revenue_recognition_rule_name,
        smoothing_model,
        specific_billing_period,
        specific_list_price_base,
        tax_code,
        tax_mode,
        taxable,
        trigger_event,
        uom,
        up_to_periods,
        up_to_periods_type,
        updated_by_id,
        updated_date,
        usage_record_rating_option,
        use_discount_specific_accounting_code,
        use_tenant_default_for_price_change,
        weekly_bill_cycle_day
    from fields
)

select *
from final
