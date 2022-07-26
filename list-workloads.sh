#!/bin/bash
for site in 1 2; do
  JUMPHOST=$(terragrunt run-all output -raw jumphost${site}_public_ip 2>/dev/null)
  for az in a b c; do
    WORKLOAD=$(terragrunt run-all output -raw workload${site}${az}_private_ip 2>/dev/null)
    echo "workload-${site}${az}: ssh -J ubuntu@$JUMPHOST ubuntu@$WORKLOAD"
  done
  echo ""
done
