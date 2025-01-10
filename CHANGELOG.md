# dbt_zuora_source version.version

## Documentation
- Corrected references to connectors and connections in the README. ([#16](https://github.com/fivetran/dbt_zuora_source/pull/16))

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
