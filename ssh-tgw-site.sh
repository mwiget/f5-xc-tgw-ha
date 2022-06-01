#!/bin/bash
SITE="${1:-1}"
NODE="${2:-0}"
public_ips=$(cd tgw-site-$SITE && terraform output -json public_ips | jq -r '.[]')
echo tgw-site-$SITE: $public_ips
