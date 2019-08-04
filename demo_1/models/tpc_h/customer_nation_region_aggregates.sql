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

SELECT
cnr.*,
aabn.average_account_balance as avg_acct_bal_by_nation
    FROM {{ref('customer_nation_region')}} as cnr
        JOIN {{ref('average_acctbal_by_nation')}} as aabn
        ON
        aabn.nation_key = cnr.nation_key
