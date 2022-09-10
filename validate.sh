#!/bin/bash
for site in 1a 1b 1c; do
  echo ./ssh-workload-$site.sh curl -H host:workload.tgw2.example.internal -s 100.64.15.254/txt ...
  ./ssh-workload-$site.sh curl -H host:workload.tgw2.example.internal -s 100.64.15.254/txt 
done
