{{ config(enabled=var('zuora__using_product_rate_plan_charge', true)) }}

select * 
from {{ var('product_rate_plan_charge') }}
