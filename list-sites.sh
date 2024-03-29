#!/bin/bash
projectPrefix='mwha'
siteid=1
for region in eu-north-1 us-west-2; do
  site="${projectPrefix}-tgw-${siteid}"
  echo "$site ($region):" 
  aws ec2 describe-instances \
  --region $region \
  --filters \
    Name=tag:ves-io-creator-id,Values=m.wiget\* \
    Name=tag:ves-io-site-name,Values=$site \
  --query "Reservations[*].Instances[*].[Tags[?Key=='Name'].Value|[0],PublicIpAddress,PrivateIpAddress,InstanceId]" \
  --output=text | sort
  echo ""
  siteid=$((siteid+1))
done
