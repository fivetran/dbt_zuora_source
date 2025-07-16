[PR #20](https://github.com/fivetran/dbt_zuora_source/pull/20) includes the following updates:

### Under the Hood - July 2025 Updates

- Updated conditions in `.github/workflows/auto-release.yml`.
- Added `.github/workflows/generate-docs.yml`.
- Added `+docs: show: False` to `integration_tests/dbt_project.yml`.
- Migrated `flags` (e.g., `send_anonymous_usage_stats`, `use_colors`) from `sample.profiles.yml` to `integration_tests/dbt_project.yml`.
- Updated `maintainer_pull_request_template.md` with improved checklist.
- Refreshed README tag block:
  - Standardized Quickstart-compatible badge set
  - Left-aligned and positioned below the H1 title.
- Updated Python image version to `3.10.13` in `pipeline.yml`.
- Added `CI_DATABRICKS_DBT_CATALOG` to:
  - `.buildkite/hooks/pre-command` (as an export)
  - `pipeline.yml` (under the `environment` block, after `CI_DATABRICKS_DBT_TOKEN`)
- Added `certifi==2025.1.31` to `requirements.txt` (if missing).
- Updated `.gitignore` to exclude additional DBT, Python, and system artifacts.

# dbt_zuora_source v0.2.3
This release includes the following updates:

## Under the Hood
- Prepends `materialized` configs in the package's `dbt_project.yml` file with `+` to improve compatibility with the newer versions of dbt-core starting with v1.10.0. ([PR #18](https://github.com/fivetran/dbt_zuora_source/pull/18))
- Updates the package maintainer pull request template. ([PR #19](https://github.com/fivetran/dbt_zuora_source/pull/19))

## Contributors
- [@b-per](https://github.com/b-per) ([PR #18](https://github.com/fivetran/dbt_zuora_source/pull/18))

# dbt_zuora_source v0.2.2
This release includes the following updates:

## Bug Fixes
- Leveraged the `{{ dbt.type_timestamp() }}` macro within the staging models for all timestamp fields. ([#17](https://github.com/fivetran/dbt_zuora_source/pull/17))
    - This is needed as certain Redshift warehouses sync these fields as `timestamp with time zone` fields by default, causing compilation errors in downstream models in the `dbt_zuora` package. This macro appropriately removes timezone values from the UTC timestamps and ensures successful compilations of these models.

| **Models**                         | **Field updates cast as timestamp**                                                                 |
|------------------------------------|------------------------------------------------------------------------------------|
| `stg_zuora__account`              | `created_date`, `last_invoice_date`, `tax_exempt_effective_date`, `tax_exempt_expiration_date`, `updated_date` |
| `stg_zuora__amendment`            | `created_date`, `updated_date`                                 |
| `stg_zuora__contact`            | `created_date`, `updated_date`                                 |
| `stg_zuora__credit_balance_adjustment` | `cancelled_on`, `created_date`, `updated_date`             |
| `stg_zuora__invoice_item`         | `charge_date`, `created_date`, `updated_date`                 |
| `stg_zuora__invoice_payment`      | `created_date`, `updated_date`                                 |
| `stg_zuora__invoice`              | `created_date`, `last_email_sent_date`, `posted_date`, `updated_date` |
| `stg_zuora__order`                | `created_date`, `updated_date`                                 |
| `stg_zuora__payment_method`       | `created_date`, `last_failed_sale_transaction_date`, `last_transaction_date_time`, `updated_date` |
| `stg_zuora__payment`              | `cancelled_on`, `created_date`, `settled_on`, `submitted_on`, `updated_date` |
| `stg_zuora__product_rate_plan_charge` | `created_date`, `updated_date`                         |
| `stg_zuora__product_rate_plan`    | `created_date`, `updated_date`                                 |
| `stg_zuora__product`    | `created_date`, `updated_date`                                 |
| `stg_zuora__rate_plan`            | `created_date`, `updated_date`                   |    
| `stg_zuora__rate_plan_charge`     | `created_date`, `updated_date`                                 |
| `stg_zuora__refund_invoice_payment`            |     `created_date`, `updated_date`                              |    
| `stg_zuora__refund`               | `cancelled_on`, `created_date`, `refund_transaction_time`, `settled_on`, `submitted_on`, `updated_date` |
| `stg_zuora__subscription`         | `cancelled_date`, `contract_acceptance_date`, `contract_effective_date`, `created_date`, `original_created_date`, `service_activation_date`, `term_end_date`, `term_start_date`, `updated_date` |
| `stg_zuora__taxation_item`        | `created_date`, `exchange_rate_date`, `tax_date`, `updated_date` |

## Documentation
- Corrected references to connectors and connections in the README. ([#16](https://github.com/fivetran/dbt_zuora_source/pull/16))
- Moved badges at top of the README below the H1 header to be consistent with popular README formats. ([#17](https://github.com/fivetran/dbt_zuora_source/pull/17))

## Under the Hood
- Updated `run_models.sh` to remove duplicative Buildkite script.

# dbt_zuora_source v0.2.2-a1
This pre-release introduces the following updates:

## Bug Fixes
- Leveraged the `{{ dbt.type_timestamp() }}` macro within the staging models for all timestamp fields. ([#17](https://github.com/fivetran/dbt_zuora_source/pull/17))
    - This is needed as certain Redshift warehouses sync these fields as `timestamp with time zone` fields by default, causing compilation errors in downstream models in the `dbt_zuora` package. This macro appropriately removes timezone values from the UTC timestamps and ensures successful compilations of these models.

| **Models**                         | **Field updates cast as timestamp**                                                                 |
|------------------------------------|------------------------------------------------------------------------------------|
| `stg_zuora__account`              | `created_date`, `last_invoice_date`, `tax_exempt_effective_date`, `tax_exempt_expiration_date`, `updated_date` |
| `stg_zuora__amendment`            | `created_date`, `updated_date`                                 |
| `stg_zuora__contact`            | `created_date`, `updated_date`                                 |
| `stg_zuora__credit_balance_adjustment` | `cancelled_on`, `created_date`, `updated_date`             |
| `stg_zuora__invoice_item`         | `charge_date`, `created_date`, `updated_date`                 |
| `stg_zuora__invoice_payment`      | `created_date`, `updated_date`                                 |
| `stg_zuora__invoice`              | `created_date`, `last_email_sent_date`, `posted_date`, `updated_date` |
| `stg_zuora__order`                | `created_date`, `updated_date`                                 |
| `stg_zuora__payment_method`       | `created_date`, `last_failed_sale_transaction_date`, `last_transaction_date_time`, `updated_date` |
| `stg_zuora__payment`              | `cancelled_on`, `created_date`, `settled_on`, `submitted_on`, `updated_date` |
| `stg_zuora__product_rate_plan_charge` | `created_date`, `updated_date`                         |
| `stg_zuora__product_rate_plan`    | `created_date`, `updated_date`                                 |
| `stg_zuora__product`    | `created_date`, `updated_date`                                 |
| `stg_zuora__rate_plan`            | `created_date`, `updated_date`                   |    
| `stg_zuora__rate_plan_charge`     | `created_date`, `updated_date`                                 |
| `stg_zuora__refund_invoice_payment`            |     `created_date`, `updated_date`                              |    
| `stg_zuora__refund`               | `cancelled_on`, `created_date`, `refund_transaction_time`, `settled_on`, `submitted_on`, `updated_date` |
| `stg_zuora__subscription`         | `cancelled_date`, `contract_acceptance_date`, `contract_effective_date`, `created_date`, `original_created_date`, `service_activation_date`, `term_end_date`, `term_start_date`, `updated_date` |
| `stg_zuora__taxation_item`        | `created_date`, `exchange_rate_date`, `tax_date`, `updated_date` |

## Documentation
- Corrected references to connectors and connections in the README. ([#16](https://github.com/fivetran/dbt_zuora_source/pull/16))
- Moved badges at top of the README below the H1 header to be consistent with popular README formats. ([#17](https://github.com/fivetran/dbt_zuora_source/pull/17))


# dbt_zuora_source v0.2.1
[PR #11](https://github.com/fivetran/dbt_zuora_source/pull/11) includes the following update:
## 🔧 Bug Fixes
- Updated default column macros to remove columns not used in their associated staging models. This prevents conflicts when bringing in this columns via the passthrough functionality.

# dbt_zuora_source v0.2.0
[PR #9](https://github.com/fivetran/dbt_zuora_source/pull/9) includes the following update:

## 🚨 Breaking Change 🚨
- Updated model configuration in `dbt_project.yml` to correctly reflect project configuration name as `zuora_source`. This is a breaking change because customers may unexpectedly see errors if they changed their materialization settings on any of their models.

## 🔧 Under The Hood 🔩
- Updated seed files in `integration_tests` to match those in `dbt_zuora` for the `v0.2.0` release.

# dbt_zuora_source v0.1.2
[PR #6](https://github.com/fivetran/dbt_zuora_source/pull/6) includes the following updates:
## Bug Fixes
- Included a where clause within **all** staging models to filter out `_fivetran_deleted` records.
- Added a conditional config within the `src_zuora.yml` to properly handle the `order` (reserved word) source table when using Snowflake as a destination.

## Documentation
- Added a call out in the identifier configuration section of the README to provide instructions for Snowflake users to handle the `order` source table if their destination has case sensitivity enabled.

## Under the Hood
- Added the `_fivetran_deleted` field to **all** `get_*_columns` macros to ensure the field may be leveraged in the respective staging models.

## Contributors
- [@raphaelvarieras](https://github.com/raphaelvarieras) ([PR #6](https://github.com/fivetran/dbt_zuora_source/pull/6))
# dbt_zuora_source v0.1.1
## Bug Fixes
- Included model disable logic within the `stg_zuora__credit_balance_adjustment_tmp` and `stg_zuora__refund_invoice_payment_tmp` models in order to ensure they are not run if the appropriate variables are set to `false`.

## Documentation Update
- Adjustment within the README to classify the package is no longer in development post v0.1.0 release.

## Under the Hood
- Updated `run_models.sh` script that is utilized in the integration tests of this package to ensure rollouts are successful prior to release.
- Updated the pull request [templates](/.github).

# dbt_zuora_source v0.1.0
🎉 Initial Release 🎉
- This is the initial release of this package. 

This package is designed to enrich your Fivetran Zuora data by doing the following:

- Cleans, tests, and prepares your Zuora data from [Fivetran's connector](https://fivetran.com/docs/applications/zuora) for analysis.
- Add descriptions to tables and columns that are synced using Fivetran.
- Add freshness tests to source data.
- Add column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Model staging tables which leverage data in the format described [here](https://fivetran.com/docs/applications/zuora#schemainformation), which can then be used simultaneously with our [Zuora modeling transformation package](https://github.com/fivetran/dbt_zuora).
- Currently the package supports Postgres, Redshift, BigQuery, Databricks, and Snowflake. Additionally, this package is designed to work with dbt versions [">=1.3.0", "<2.0.0"].

For more information refer to the [README](https://github.com/fivetran/dbt_zuora_source/blob/main/README.md).
