{{ config(enabled=var('zuora__using_account', true)) }}

select * 
from {{ var('account') }}
