{{ config(enabled=var('zuora__using_order', true)) }}

select * 
from {{ var('order') }}
