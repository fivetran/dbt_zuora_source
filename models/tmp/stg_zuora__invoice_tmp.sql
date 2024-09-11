{{ config(enabled=var('zuora__using_invoice', true)) }}

select * 
from {{ var('invoice') }}
