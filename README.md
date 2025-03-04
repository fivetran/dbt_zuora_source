# Zuora Source dbt package ([Docs](https://fivetran.github.io/dbt_zuora_source/))

<p align="left">
    <a alt="License"
        href="https://github.com/fivetran/dbt_zuora_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

## What does this dbt package do?
- Materializes [Zuora staging tables](https://fivetran.github.io/dbt_zuora_source/#!/overview/github_source/models/?g_v=1), which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/zuora#schemainformation). These staging tables clean, test, and prepare your Zuora data from [Fivetran's connector](https://fivetran.com/docs/applications/zuora) for analysis by doing the following:
  - Naming columns for consistency across all packages and easier analysis
  - Adding freshness tests to source data
  - Adding column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values
- Generating a comprehensive data dictionary of your Zuora data through the [dbt docs site](https://fivetran.github.io/dbt_zuora_source/)
- These tables are designed to work simultaneously with our [Zuora transformation package](https://github.com/fivetran/dbt_zuora)

## How do I use the dbt package?
### Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran Zuora connection syncing data into your destination
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, **Databricks** destination

#### Databricks Dispatch Configuration
If you are using a Databricks destination with this package, you will need to add the below (or a variation of the below) dispatch configuration within your `dbt_project.yml`. This is required for the package to accurately search for macros within the `dbt-labs/spark_utils`, then the `dbt-labs/dbt_utils` packages, respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

### Step 2: Install the package (skip if also using the `zuora` transformation package)
If you are **not** using the [Zuora transformation package](https://github.com/fivetran/dbt_zuora), include the following `zuora_source` package version in your `packages.yml` file.
Include the following `zuora_source` package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

```yaml
packages:
  - package: fivetran/zuora_source
    version: [">=0.2.0", "<0.3.0"] # we recommend using ranges to capture non-breaking changes automatically
```
### Step 3: Define database and schema variables
By default, this package runs using your destination and the `zuora` schema. If this is not where your Zuora data is (for example, if your zuora schema is named `zuora_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    zuora_database: your_destination_name
    zuora_schema: your_schema_name 
```

### Step 4: Disable models for non-existent sources

Your Zuora connection may not be syncing all tabes that this package references. This might be because you are excluding those tables. If you are not using those tables, you can disable the corresponding functionality in the package by specifying the variable in your `dbt_project.yml`. By default, all packages are assumed to be true. You only have to add variables for tables you want to disable in the following way:

```yml 
vars: 
  zuora__using_credit_balance_adjustment: false # Disable if you do not have the credit balance adjustment table
  zuora__using_refund: false # Disable if you do not have the refund table
  zuora__using_refund_invoice_payment: false # Disable if you do not have the refund invoice payment table
  zuora__using_taxation_item: false # Disable if you do not have the taxation item table
```   
### (Optional) Step 5: Additional configurations
<details open><summary>Expand to view configurations</summary>

#### Passing Through Additional Fields
This package includes all source columns defined in the macros folder. You can add more columns using our pass-through column variables. These variables allow for the pass-through fields to be aliased (`alias`) and casted (`transform_sql`) if desired, but not required. Data type casting is configured via a SQL snippet within the `transform_sql` key. You may add the desired SQL while omitting the `as field_name` at the end and your custom pass-though fields will be casted accordingly. Use the below format for declaring the respective pass-through variables:

```yml
vars:
    zuora_account_pass_through_columns: 
      - name: "new_custom_field"
        alias: "custom_field"
        transform_sql: "cast(custom_field as string)"
      - name: "another_one"
    zuora_subscription_pass_through_columns:
      - name: "this_field"
        alias: "cool_field_name"
    zuora_rate_plan_pass_through_columns:
      - name: "another_field"
        alias: "cooler_field_name"
    zuora_rate_plan_charge_pass_through_columns:
      - name: "yet_another_field"
        alias: "coolest_field_name"
```

#### Change the build schema
By default, this package builds the Zuora staging models within a schema titled (`<target_schema>` + `_zuora_source`) in your destination. If this is not where you would like your Zuora staging data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    zuora_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

#### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:
> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_zuora_source/blob/main/dbt_project.yml) variable declarations to see the expected names.

```yml
vars:
    zuora_<default_source_table_name>_identifier: your_table_name 
```

#### Snowflake Users
If you do **not** use the default all-caps naming conventions for Snowflake, you may need to provide the case-sensitive spelling of your source tables that are also Snowflake reserved words.

In this package, this would apply to the `ORDER` source. If you are receiving errors for this source, include the below identifier in your `dbt_project.yml` file:

```yml
vars:
    zuora_order_identifier: "ORDER" # as an example, must include the double-quotes and correct case
```  

</details>

### (Optional) Step 6: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand to view details</summary>
<br>
    
Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
</details>
    
## Does this package have dependencies?
This dbt package is dependent on the following dbt packages. These dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.0.0", "<2.0.0"]

    - package: dbt-labs/spark_utils
      version: [">=0.3.0", "<0.4.0"]
```
          
## How is this package maintained and can I contribute?
### Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/zuora_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_zuora_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.
### Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions.

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package.

## Are there any resources available?
- If you have questions or want to reach out for help, see the [GitHub Issue](https://github.com/fivetran/dbt_zuora_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
