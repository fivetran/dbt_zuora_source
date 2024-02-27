{{ config(enabled=var('zuora__using_subscription', true)) }}

select * 
from {{ var('subscription') }}
