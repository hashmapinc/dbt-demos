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

{{ config(materialized='view') }}

select
spa.supplier_name,
spa.account_balance as supplier_account_balance,
cnra.account_balance as customer_account_balance,
cnra.avg_acct_bal_by_nation as average_account_balance_by_nation,
spa.available_quantity,
spa.average_available_quantity,
spa.supply_cost,
spa.average_supply_cost,
spa.part_name,
spa.part_manufacturer,
spa.part_brand,
spa.part_type,
spa.part_size,
cnra.nation,
cnra.region,
cnra.market_segment,
cnra.customer_name
    FROM {{ref('supplier_parts_aggregates')}} as spa
        JOIN {{ref('customer_nation_region_aggregates')}} as cnra
        ON
        spa.nation_key = cnra.nation_key
