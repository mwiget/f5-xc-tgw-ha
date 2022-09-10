#!/bin/bash
JUMPHOST=$(cd base-aws-region-2 &&  terragrunt output -raw jumphost2_public_ip 2>/dev/null)
WORKLOAD=$(cd base-aws-region-2 && terragrunt output -raw workload2b_private_ip 2>/dev/null)
echo ssh -J ubuntu@$JUMPHOST ubuntu@$WORKLOAD ...
ssh -o "StrictHostKeyChecking=no" -J ubuntu@$JUMPHOST ubuntu@$WORKLOAD $@
