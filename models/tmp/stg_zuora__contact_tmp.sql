{{ config(enabled=var('zuora__using_contact', true)) }}

select * 
from {{ var('contact') }}
