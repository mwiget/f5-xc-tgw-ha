# f5-xc-tgw-ha

```
                     tgw-1                 tgw-2
                     
workload-1a -- T -- master-0 --- VPC  --- master-0 -- T -- workload-2a
workload-1b -- G -- master-1 --- peer --- master-1 -- G -- workload-2b
workload-1c -- W -- master-2 ---  ing --- master-2 -- W -- workload-2c

 spokeVpc1         serviceVpc1           serviceVpc2        spokeVpc2
```

Two AWS TGW sites are site meshed via VPC peering. Workloads are deployed
per availability zone in both spoke VPCs and HTTP LB on tgw-1 VIP 100.64.15.254
connects to origin pools in spoke VPC 2 workloads.


## Issues

cleanup with help of mock-outputs seem to require setting log levels to work without errors:

```
terragrunt terragrunt-log-level info  destroy
```
 
