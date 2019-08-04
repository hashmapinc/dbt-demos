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

WITH calc AS (
    SELECT
        CASE
            WHEN supply_cost = average_supply_cost THEN 0
            ELSE 1
        END AS supplies_mismatch

    FROM {{ ref('analytics_view') }}
),

agg AS (
    SELECT
        SUM(supplies_mismatch)::float / NULLIF(COUNT(*), 0) as pct_mismatch
    FROM calc
)

SELECT *
FROM agg
    WHERE PCT_MISMATCH > 0.99