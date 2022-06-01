#!/bin/bash
HOST=$(cd tgw-vpc-peer-1-2 && terragrunt output -raw AWS_INSTANCE 2>/dev/null)
ssh -o "StrictHostKeyChecking=no" ubuntu@$HOST
