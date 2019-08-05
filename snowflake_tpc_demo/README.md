### dbt models for snowflake_tpc_demo

---
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

---
