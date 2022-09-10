#!/bin/bash
#
# Check that site is online before creating workload resources
#
for site in mwha-tgw-1 mwha-tgw-2; do
  #curl --location --request GET $VOLT_API_URL/config/namespaces/system/aws_tgw_sites/$site  -H "Authorization: APIToken $VOLTERRA_TOKEN" -H "content-type: application/json" -s | jq -r .spec.site_state
  site_state=$(curl --location --request GET $VOLT_API_URL/config/namespaces/system/aws_tgw_sites/$site  -H "Authorization: APIToken $VOLTERRA_TOKEN" -H "content-type: application/json" -s | jq -r .spec.site_state)
  echo $site $site_state
done
date
