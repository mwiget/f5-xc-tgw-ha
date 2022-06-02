#!/bin/bash
JUMPHOST=$(terragrunt run-all output -raw jumphost1_public_ip 2>/dev/null)
WORKLOAD=$(terragrunt run-all output -raw workload1c_private_ip 2>/dev/null)
echo ssh -J ubuntu@$JUMPHOST ubuntu@$WORKLOAD ...
ssh -o "StrictHostKeyChecking=no" -J ubuntu@$JUMPHOST ubuntu@$WORKLOAD
