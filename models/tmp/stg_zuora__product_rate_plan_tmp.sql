{{ config(enabled=var('zuora__using_product_rate_plan', true)) }}

select * 
from {{ var('product_rate_plan') }}
