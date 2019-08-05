[![Build Status](https://dev.azure.com/hashmap-labs/berserk-john/_apis/build/status/hashmapinc.dbt-demos?branchName=master)](https://dev.azure.com/hashmap-labs/berserk-john/_build/latest?definitionId=3&branchName=master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/08b1644d9cac4350b182dd5556d17051)](https://www.codacy.com?utm_source=github.com&utm_medium=referral&utm_content=hashmapinc/dbt-demos&utm_campaign=Badge_Grade)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fhashmapinc%2Fdbt-demos.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fhashmapinc%2Fdbt-demos?ref=badge_shield)
[![Build Status](http://jenkins.hashmapinc.com:8080/buildStatus/icon?job=dbt-demos%2FJenkins)](http://jenkins.hashmapinc.com:8080/job/dbt-demos/job/Jenkins/)

# dbt-demos

Demonstrations of DBT

## About

This repository has a collection of DBT (data build tool) demos. Each demo, although technically could
be sourced within a common project, they are kept separate dbt projects for simplicity of demonstrating
different functionality across different platforms.

## Postgres (WIP)

This demo is tied to another git repo. That project must be installed and running in order to use this
one.

This demo is a WIP.

## Snowflake Metadata (WIP)

This demo is just for fun. Please use it to further explore the metadata within a single snowflake database.

This demo is a WIP.

## Snowflake TPC-H

Snowflake comes along with various sample [datasets](https://docs.snowflake.net/manuals/user-guide/sample-data-tpch.html). This specific scenario aims to

1. Join up the Customer, Nation and Region tables
   1. Compute the average account balance by part and supplier
   1. Compute the average account balance by nation
1. Join up the Supplier, Part and PartSupp tables
   1. Compute the average supply cost and average available quantity per part
1. Join the aggregation tables back to the fine grained tables for both cases above
1. Join up the aggregation tables into a single analytics view

All tables before the aggregations are marked ephemeral. When the aggregations are joined back up, then the results are
materialized as tables. The final model results in view (analytics_view).

### Running DBT

From root execute the following:

**To Test**:

```bash
pipenv install
pipenv update
(cd snowflake_tpc_demo && pipenv test)
```

**To Build**:

```bash
pipenv install
pipenv update
(cd snowflake_tpc_demo && pipenv build)
```

**To Build and Serve Documentation**

```bash
pipenv install
pipenv update
(cd snowflake_tpc_demo && pipenv build_and_serve)
```

**To Build and RUN**:

```bash
pipenv install
pipenv update
(cd snowflake_tpc_demo && pipenv build_and_run)
```
