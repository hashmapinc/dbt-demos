/*
Copyright © 2019 Hashmap, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

{{ config(materialized='ephemeral') }}

With supplier_parts as (
  SELECT * from snowflake_sample_data.tpch_sf1.supplier
    JOIN snowflake_sample_data.tpch_sf1.partsupp
        ON s_suppkey=ps_suppkey
            JOIN snowflake_sample_data.tpch_sf1.part
                ON ps_partkey=p_partkey
)

SELECT
s_suppkey as supplier_key,
s_name as supplier_name,
s_nationkey as nation_key,
s_acctbal as account_balance,
ps_availqty as available_quantity,
ps_supplycost as supply_cost,
p_partkey as part_key,
p_name as part_name,
p_mfgr as part_manufacturer,
p_brand as part_brand,
p_type as part_type,
p_size as part_size,
p_container as part_container,
p_retailprice as part_retail_price
    FROM supplier_parts
