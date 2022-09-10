#!/bin/bash
JUMPHOST=$(cd base-aws-region-1 &&  terragrunt output -raw jumphost1_public_ip 2>/dev/null)
WORKLOAD=$(cd base-aws-region-1 && terragrunt output -raw workload1b_private_ip 2>/dev/null)
echo ssh -J ubuntu@$JUMPHOST ubuntu@$WORKLOAD ...
ssh -o "StrictHostKeyChecking=no" -J ubuntu@$JUMPHOST ubuntu@$WORKLOAD $@
