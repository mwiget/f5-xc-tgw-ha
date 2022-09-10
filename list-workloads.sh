#!/bin/bash
for site in 1 2; do
  JUMPHOST=$(cd base-aws-region-$site && terragrunt output -raw jumphost${site}_public_ip 2>/dev/null)
  for az in a b c; do
    WORKLOAD=$(cd base-aws-region-$site && terragrunt output -raw workload${site}${az}_private_ip 2>/dev/null)
    echo "workload-${site}${az}: ssh -J ubuntu@$JUMPHOST ubuntu@$WORKLOAD"
  done
  echo ""
done
