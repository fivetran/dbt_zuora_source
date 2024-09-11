{{ config(enabled=var('zuora__using_payment_method', true)) }}

select * 
from {{ var('payment_method') }}