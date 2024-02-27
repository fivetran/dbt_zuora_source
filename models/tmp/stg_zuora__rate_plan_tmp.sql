{{ config(enabled=var('zuora__using_rate_plan', true)) }}

select * 
from {{ var('rate_plan') }}
