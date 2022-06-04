#!/bin/bash
region=$1
ids=$2
echo $region $ids
aws ec2 stop-instances --region $region --instance-ids $ids
