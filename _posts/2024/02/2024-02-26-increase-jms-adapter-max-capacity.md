---
title: "Increase JMS Adapter Max Capacity"
permalink: /blog/increase-jms-adapter-max-capacity
date: 2024-02-26 16:48:16 +0800
categories: [How-To, Oracle Service Bus]
tags: [jms] 
image:
    path: /assets/img/headers/increase-jms-adapter-max-capacity.png
---


When increasing the number of managed servers in Oracle SOA Suite/Service Bus where JMS queues are widely used, it is important to take note of the max capacity of the JMS Adapter.

The issue below happened after adding more managed servers, persistent file stores and JMS servers in the OSB Domain:

```
javax.resource.spi.ApplicationServerInternalException: Unable to get a connection for pool = "eis/wls/Queue", weblogic.common.resourcepool.ResourceLimitException: Configured maximum limit of (0) on number of threads allowed to wait for a resource reached for pool eis/wls/Queue
```

We needed to increase the Max Capacity of the JMS Adapter, where `eis/wls/Queue` resides.

1. Log in to WebLogic Administration Console
2. Go to **Deployments**
3. Click **JmsAdapter**
4. Click **Configuration** tab
5. Click **Outbound Connection Pools** sub-tab
6. Expand the **oracle.tip.adapter.jms.IJmsConnectionFactory** and click `eis/wls/Queue`
7. Click **Connection Pool** tab
8. Click **Lock and Edit** to start a change session
9. Update the Max Capacity. Recommended value is above 400 per 4 managed servers. Since we have increased the managed server count from 8 to 16, we started with 500 * 4 = **2000**
10. Update the **JmsAdapter** Deployment with the updated deployment plan
11. Activate changes made in the session
12. Restart managed servers

>Make sure to check if the exact error is encountered in your case. Take note of the existing configuration prior to updating them.
{: .prompt-warning }