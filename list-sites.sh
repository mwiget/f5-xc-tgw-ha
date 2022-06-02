#!/bin/bash
projectPrefix='mwha'

for site in $projectPrefix-tgw-1 ; do
  echo "$site:" 
  aws ec2 describe-instances \
  --region eu-north-1 \
  --filters \
    Name=tag:ves-io-creator-id,Values=m.wiget@f5.com \
    Name=tag:ves-io-site-name,Values=$site \
    Name=instance-state-name,Values=running \
  --query "Reservations[*].Instances[*].[Tags[?Key=='Name'].Value|[0],PublicIpAddress,PrivateIpAddress]" \
  --output=text | sort
  echo ""
done

for site in $projectPrefix-tgw-2 ; do
  echo "$site:" 
  aws ec2 describe-instances \
  --region us-west-2 \
  --filters \
    Name=tag:ves-io-creator-id,Values=m.wiget@f5.com \
    Name=tag:ves-io-site-name,Values=$site \
    Name=instance-state-name,Values=running \
  --query "Reservations[*].Instances[*].[Tags[?Key=='Name'].Value|[0],PublicIpAddress,PrivateIpAddress]" \
  --output=text | sort
  echo ""
done
