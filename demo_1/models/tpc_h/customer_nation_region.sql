/*
Modifications © 2019 Hashmap, Inc

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

With customer_nation_region as (
  SELECT * from snowflake_sample_data.tpch_sf1.customer
    JOIN snowflake_sample_data.tpch_sf1.nation
        ON n_nationkey=c_nationkey
            JOIN snowflake_sample_data.tpch_sf1.region
                ON n_regionkey=r_regionkey
)

SELECT
r_name as region,
n_name as nation,
n_nationkey as nation_key,
c_name as customer_name,
c_acctbal as account_balance,
c_mktsegment as market_segment
    FROM customer_nation_region
