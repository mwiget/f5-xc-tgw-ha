#!/bin/bash
JUMPHOST=$(terragrunt run-all output -raw jumphost2_public_ip 2>/dev/null)
ssh -o "StrictHostKeyChecking=no" ubuntu@$JUMPHOST
