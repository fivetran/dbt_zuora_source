#!/bin/bash

set -euo pipefail

apt-get update
apt-get install libsasl2-dev

python3 -m venv venv
. venv/bin/activate
pip install --upgrade pip setuptools
pip install -r integration_tests/requirements.txt
mkdir -p ~/.dbt
cp integration_tests/ci/sample.profiles.yml ~/.dbt/profiles.yml

db=$1
echo `pwd`
cd integration_tests
dbt deps
dbt seed --target "$db" --full-refresh
dbt run --target "$db" --full-refresh
dbt test --target "$db"
dbt run --vars '{zuora__using_account: false, zuora__using_amendment: false, zuora__using_contact: false, zuora__using_credit_balance_adjustment: false, zuora__using_invoice_item: false, zuora__using_invoice_payment: false, zuora__using_invoice: false, zuora__using_order: false, zuora__using_payment_method: false, zuora__using_payment: false, zuora__using_product_rate_plan_charge: false, zuora__using_product_rate_plan: false, zuora__using_product: false, zuora__using_product_rate_plan_charge: false, zuora__using_rate_plan: false, zuora__using_refund_invoice_payment: false zuora__using_refund: false, zuora__using_subscription: false, zuora__using_taxation_item: false}' --target "$db" 
dbt test --target '{zuora__using_account: false, zuora__using_amendment: false, zuora__using_contact: false, zuora__using_credit_balance_adjustment: false, zuora__using_invoice_item: false, zuora__using_invoice_payment: false, zuora__using_invoice: false, zuora__using_order: false, zuora__using_payment_method: false, zuora__using_payment: false, zuora__using_product_rate_plan_charge: false, zuora__using_product_rate_plan: false, zuora__using_product: false, zuora__using_product_rate_plan_charge: false, zuora__using_rate_plan: false, zuora__using_refund_invoice_payment: false zuora__using_refund: false, zuora__using_subscription: false, zuora__using_taxation_item: false}' --target "$db"

dbt run-operation fivetran_utils.drop_schemas_automation --target "$db"
