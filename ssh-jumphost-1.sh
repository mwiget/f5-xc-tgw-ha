#!/bin/bash
JUMPHOST=$(terragrunt run-all output -raw jumphost1_public_ip 2>/dev/null)
ssh -o "StrictHostKeyChecking=no" ubuntu@$JUMPHOST
