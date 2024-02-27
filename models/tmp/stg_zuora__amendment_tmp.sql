{{ config(enabled=var('zuora__using_amendment', true)) }}

select * 
from {{ var('amendment') }}
