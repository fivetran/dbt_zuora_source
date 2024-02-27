{{ config(enabled=var('zuora__using_invoice_item', true)) }}

select * 
from {{ var('invoice_item') }}