#!/bin/bash
SCRIPT=test-url.sh
JUMPHOST=$(terragrunt run-all output -raw jumphost1_public_ip 2>/dev/null)
echo using jumphost $JUMPHOST ...
for instance in 1a 1b 1c; do
  WORKLOAD=$(terragrunt run-all output -raw workload${instance}_private_ip 2>/dev/null)
  echo $WORKLOAD ...
  scp -o "StrictHostKeyChecking=no" -oProxyCommand="ssh -W %h:%p ubuntu@$JUMPHOST" $SCRIPT ubuntu@$WORKLOAD:
done

JUMPHOST=$(terragrunt run-all output -raw jumphost2_public_ip 2>/dev/null)
echo using jumphost $JUMPHOST ...
for instance in 2a 2b 2c; do
  WORKLOAD=$(terragrunt run-all output -raw workload${instance}_private_ip 2>/dev/null)
  echo $WORKLOAD ...
  scp -o "StrictHostKeyChecking=no" -oProxyCommand="ssh -W %h:%p ubuntu@$JUMPHOST" $SCRIPT ubuntu@$WORKLOAD:
done
