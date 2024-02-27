{{ config(enabled=var('zuora__using_invoice_payment', true)) }}

select * 
from {{ var('invoice_payment') }}
