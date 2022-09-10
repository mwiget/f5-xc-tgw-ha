
have 2 redundant sites running:

```
$ ./list-sites.sh 
mwha-tgw-1 (eu-north-1):
master-0        13.53.82.49     100.64.0.226    i-0fba4edd8aa9d73df
master-1        13.50.45.144    100.64.3.57     i-0334d229e041ee7a6
master-2        16.170.120.217  100.64.6.226    i-028c617a36d140803

mwha-tgw-2 (us-west-2):
master-0        54.148.130.77   100.64.32.23    i-094d73ee90f234a29
master-1        52.40.187.98    100.64.35.85    i-0e8e8cc9025d20d35
master-2        44.224.51.41    100.64.36.193   i-07390973d6d2443e1
```

```
$ ./site-status.sh 
mwha-tgw-1 ONLINE
mwha-tgw-2 ONLINE
```

Taking down master-0 in both sites via awscli


```
$ ./stop-master-0.sh 
{
    "StoppingInstances": [
        {
            "CurrentState": {
                "Code": 64,
                "Name": "stopping"
            },
            "InstanceId": "i-0fba4edd8aa9d73df",
            "PreviousState": {
                "Code": 16,
                "Name": "running"
            }
        }
    ]
}
{
    "StoppingInstances": [
        {
            "CurrentState": {
                "Code": 64,
                "Name": "stopping"
            },
            "InstanceId": "i-094d73ee90f234a29",
            "PreviousState": {
                "Code": 16,
                "Name": "running"
            }
        }
    ]
}
```

checking site status after 10 minutes:

```
$ ./site-status.sh 
mwha-tgw-1 ONLINE
mwha-tgw-2 ONLINE
```

all good so far. UI reports one node down in each cluster:


```
$ ./list-sites.sh 
mwha-tgw-1 (eu-north-1):
master-1        13.50.45.144    100.64.3.57     i-0334d229e041ee7a6
master-2        16.170.120.217  100.64.6.226    i-028c617a36d140803

mwha-tgw-2 (us-west-2):
master-1        52.40.187.98    100.64.35.85    i-0e8e8cc9025d20d35
master-2        44.224.51.41    100.64.36.193   i-07390973d6d2443e1
```

Taking down master-1 in both clusters, expecting both cluster to become down:

```


```
$ source stop-master-1.sh 
{
    "StoppingInstances": [
        {       
            "CurrentState": {   
                "Code": 64,
                "Name": "stopping"
            },
            "InstanceId": "i-0334d229e041ee7a6",
            "PreviousState": {
                "Code": 16,
                "Name": "running"
            }
        }
    ]
}
{
    "StoppingInstances": [
        {
            "CurrentState": {
                "Code": 64,
                "Name": "stopping"
            },
            "InstanceId": "i-0e8e8cc9025d20d35",
            "PreviousState": {
                "Code": 16,
                "Name": "running"
            }
        }
    ]
}
```

Checking site status after 10 minutes:

```
$ ./list-sites.sh 
mwha-tgw-1 (eu-north-1):
master-2        16.170.120.217  100.64.6.226    i-028c617a36d140803

mwha-tgw-2 (us-west-2):
master-2        44.224.51.41    100.64.36.193   i-07390973d6d2443e1
```

```
$ ./site-status.sh 
mwha-tgw-1 ONLINE
mwha-tgw-2 ONLINE
```

But all 3 nodes are reported down with 0/100 availability, but why does it still report ONLINE?


After 10 to 20 minutes, the sites report FAILED correctly:

```
$ ./site-status.sh 
mwha-tgw-1 FAILED
mwha-tgw-2 FAILED
```

Start all instances:

```
 cat start-all.sh 
#!/bin/bash
aws ec2 start-instances --region eu-north-1 --instance-ids i-0fba4edd8aa9d73df
aws ec2 start-instances --region us-west-2 --instance-ids i-094d73ee90f234a29

aws ec2 start-instances --region eu-north-1 --instance-ids i-0334d229e041ee7a6
aws ec2 start-instances --region us-west-2 --instance-ids i-0e8e8cc9025d20d35
```

```
$ ./start-all.sh 
{
    "StartingInstances": [
        {
            "CurrentState": {
                "Code": 0,
                "Name": "pending"
            },
            "InstanceId": "i-0fba4edd8aa9d73df",
            "PreviousState": {
                "Code": 80,
                "Name": "stopped"
            }
        }
    ]
}
{
    "StartingInstances": [
        {
            "CurrentState": {
                "Code": 0,
                "Name": "pending"
            },
            "InstanceId": "i-094d73ee90f234a29",
            "PreviousState": {
                "Code": 80,
                "Name": "stopped"
            }
        }
    ]
}
{
    "StartingInstances": [
        {
            "CurrentState": {
                "Code": 0,
                "Name": "pending"
            },
            "InstanceId": "i-0334d229e041ee7a6",
            "PreviousState": {
                "Code": 80,
                "Name": "stopped"
            }
        }
    ]
}
{
    "StartingInstances": [
        {
            "CurrentState": {
                "Code": 0,
                "Name": "pending"
            },
            "InstanceId": "i-0e8e8cc9025d20d35",
            "PreviousState": {
                "Code": 80,
                "Name": "stopped"
            }
        }
    ]
}
```

```
$ ./list-sites.sh 
mwha-tgw-1 (eu-north-1):
master-0        13.53.82.49     100.64.0.226    i-0fba4edd8aa9d73df
master-1        13.50.45.144    100.64.3.57     i-0334d229e041ee7a6
master-2        16.170.120.217  100.64.6.226    i-028c617a36d140803

mwha-tgw-2 (us-west-2):
master-0        54.148.130.77   100.64.32.23    i-094d73ee90f234a29
master-1        52.40.187.98    100.64.35.85    i-0e8e8cc9025d20d35
master-2        44.224.51.41    100.64.36.193   i-07390973d6d2443e1
```

Nodes are recovering

```
./site-status.sh 
mwha-tgw-1 ONLINE
mwha-tgw-2 ONLINE
```

Also in the UI, both sites back online at 100/100:



Trying again, stopping 2 masters in each site:

```
$ cat stop-2-masters.sh 
#!/bin/bash
aws ec2 stop-instances --region eu-north-1 --instance-ids i-0fba4edd8aa9d73df
aws ec2 stop-instances --region us-west-2 --instance-ids i-094d73ee90f234a29

aws ec2 stop-instances --region eu-north-1 --instance-ids i-0334d229e041ee7a6
aws ec2 stop-instances --region us-west-2 --instance-ids i-0e8e8cc9025d20d35
```

```
$ ./list-sites.sh 
mwha-tgw-1 (eu-north-1):
master-2        16.170.120.217  100.64.6.226    i-028c617a36d140803

mwha-tgw-2 (us-west-2):
master-2        44.224.51.41    100.64.36.193   i-07390973d6d2443e1

$ date
Thu Jul 14 06:21:17 AM CEST 2022
```

waiting for both sites to report FAILURE:

```
$ ./site-status.sh 
mwha-tgw-1 FAILED
mwha-tgw-2 FAILED
Thu Jul 14 06:34:43 AM CEST 2022
```

Took 13 minutes to report FAILURE.

Bring back all nodes online:

```
$ cat start-all.sh 
#!/bin/bash
aws ec2 start-instances --region eu-north-1 --instance-ids i-0fba4edd8aa9d73df
aws ec2 start-instances --region us-west-2 --instance-ids i-094d73ee90f234a29

aws ec2 start-instances --region eu-north-1 --instance-ids i-0334d229e041ee7a6
aws ec2 start-instances --region us-west-2 --instance-ids i-0e8e8cc9025d20d35
```

```
Thu Jul 14 06:35:55 AM CEST 2022
```

Quickly reported online again

```
$ ./site-status.sh 
mwha-tgw-1 ONLINE
mwha-tgw-2 ONLINE
Thu Jul 14 06:36:16 AM CEST 2022
```

But the nodes are still not ready. In the UI, all nodes are marked red.

06:43 nodes are online in the UI, but still reporting 0/100.

06:44 mwha-tgw-1 reports 50/100.

06:45 mwha-tgw-1 reports 100/100 and mwha-tgw-2 50/100.

06:43 nodes are online in the UI, but still reporting 0/100.

06:44 mwha-tgw-1 reports 50/100.

06:45 mwha-tgw-1 reports 100/100 and mwha-tgw-2 50/100.

06:43 nodes are online in the UI, but still reporting 0/100.

06:44 mwha-tgw-1 reports 50/100.

06:45 mwha-tgw-1 reports 100/100 and mwha-tgw-2 50/100.

06:43 nodes are online in the UI, but still reporting 0/100.

06:44 mwha-tgw-1 reports 50/100.

06:45 mwha-tgw-1 reports 100/100 and mwha-tgw-2 50/100.

06:43 nodes are online in the UI, but still reporting 0/100.

06:44 mwha-tgw-1 reports 50/100.

06:45 mwha-tgw-1 reports 100/100 and mwha-tgw-2 50/100.

06:43 nodes are online in the UI, but still reporting 0/100.

06:44 mwha-tgw-1 reports 50/100.

06:45 mwha-tgw-1 reports 100/100 and mwha-tgw-2 50/100.

```
$ ./site-status.sh 
mwha-tgw-1 ONLINE
mwha-tgw-2 ONLINE
Thu Jul 14 06:46:55 AM CEST 2022
```

both sites report 100/100.


stopping 2 masters in each site one more time ...

```
$ ./list-sites.sh 
mwha-tgw-1 (eu-north-1):
master-2        16.170.120.217  100.64.6.226    i-028c617a36d140803

mwha-tgw-2 (us-west-2):
master-2        44.224.51.41    100.64.36.193   i-07390973d6d2443e1

[mwiget@rog1 f5-xc-tgw-ha]$ ./site-status.sh 
mwha-tgw-1 ONLINE
mwha-tgw-2 ONLINE
Thu Jul 14 06:50:07 AM CEST 2022
```

```
$ ./site-status.sh 
mwha-tgw-1 FAILED
mwha-tgw-2 FAILED
Thu Jul 14 07:05:08 AM CEST 2022
```

bring nodes back online

```
$ ./start-all.sh
```

```
$ ./list-sites.sh 
mwha-tgw-1 (eu-north-1):
master-0        13.53.82.49     100.64.0.226    i-0fba4edd8aa9d73df
master-1        13.50.45.144    100.64.3.57     i-0334d229e041ee7a6
master-2        16.170.120.217  100.64.6.226    i-028c617a36d140803

mwha-tgw-2 (us-west-2):
master-0        54.148.130.77   100.64.32.23    i-094d73ee90f234a29
master-1        52.40.187.98    100.64.35.85    i-0e8e8cc9025d20d35
master-2        44.224.51.41    100.64.36.193   i-07390973d6d2443e1

[mwiget@rog1 f5-xc-tgw-ha]$ ./site-status.sh 
mwha-tgw-1 FAILED
mwha-tgw-2 FAILED
Thu Jul 14 07:05:50 AM CEST 2022
```

07:14 both sites 50/100 online.

07:19 one site 100/100, the other 97/100

07:21 both sites 100/100 online.


```
$ ./site-status.sh 
mwha-tgw-1 ONLINE
mwha-tgw-2 ONLINE
Thu Jul 14 07:21:23 AM CEST 2022
```


