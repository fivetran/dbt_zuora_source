# dbt_zuora_source v0.1.1
## Documentation Update
- Removing the disclaimer in the README specifying that this package is under contruction. Following the v0.1.0 release, this package is no longer under construction and is ready for use in your dbt project!
## Under the Hood:

- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job.
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