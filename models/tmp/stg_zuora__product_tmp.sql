{{ config(enabled=var('zuora__using_product', true)) }}

select * 
from {{ var('product') }}
