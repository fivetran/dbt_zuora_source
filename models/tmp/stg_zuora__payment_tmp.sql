{{ config(enabled=var('zuora__using_payment', true)) }}

select * 
from {{ var('payment') }}
