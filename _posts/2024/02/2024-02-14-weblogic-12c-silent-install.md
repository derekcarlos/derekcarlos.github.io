---
title: "How to Install WebLogic 12c in Silent Mode"
permalink: /blog/weblogic-12c-silent-install
date: 2024-02-14 13:19:37 +0800
categories: [How-To, Oracle WebLogic]
tags: [weblogic,silent install] 
image:
    path: /assets/img/headers/weblogic-12c-silent-install.png
---


I am working on installing WebLogic 12c on another server for a quick Coherence test and I have been scrambling on finding the notes on how to install it in silent mode. Basically you can install it with an installation wizard, but if you're doing it remotely via X11 it's going to be painfully slow. So instead of using that, I prefer silent install. That way, I don't need to set up X11 and work via the command line.

After downloading the FMW installer, a response file needs to be created. See below:

```properties
[ENGINE]

#DO NOT CHANGE THIS.
Response File Version=1.0.0.0.0

[GENERIC]

#The oracle home location. This can be an existing Oracle Home or a new Oracle Home
ORACLE_HOME=/u01/app/oracle/middleware

#Set this variable value to the Installation Type selected. e.g. Fusion Middleware Infrastructure, Fusion Middleware Infrastructure With Examples.
INSTALL_TYPE=Fusion Middleware Infrastructure

#Provide the My Oracle Support Username. If you wish to ignore Oracle Configuration Manager configuration provide empty string for user name.
MYORACLESUPPORT_USERNAME=

#Provide the My Oracle Support Password
MYORACLESUPPORT_PASSWORD=<SECURE VALUE>

#Set this to true if you wish to decline the security updates. Setting this to true and providing empty string for My Oracle Support username will ignore the Oracle Configuration Manager configuration
DECLINE_SECURITY_UPDATES=true

#Set this to true if My Oracle Support Password is specified
SECURITY_UPDATES_VIA_MYORACLESUPPORT=false

#Provide the Proxy Host
PROXY_HOST=

#Provide the Proxy Port
PROXY_PORT=

#Provide the Proxy Username
PROXY_USER=

#Provide the Proxy Password
PROXY_PWD=<SECURE VALUE>

#Type String (URL format) Indicates the OCM Repeater URL which should be of the format [scheme[Http/Https]]://[repeater host]:[repeater port]
COLLECTOR_SUPPORTHUB_URL=
```

In this case the only thing you need to modify is the `ORACLE_HOME`. Make sure that your user has access to create that folder.

Next, run the following commands:

```bash
# Set JAVA_HOME and PATH
export JAVA_HOME=/u01/jdk/latest
export PATH=$JAVA_HOME/bin:$PATH

java -jar /tmp/fmw_12.2.1.4.0_infrastructure.jar -silent -responseFile /u01/silent-weblogic.rsp
```

Make sure that when entering the path of the response file (i.e. `silent-weblogic.rsp`) you use the absolute path. 

And that's it, you want the prompt (see below sample) and have a sip of coffee.

```
Launcher log file is /tmp/OraInstall2024-02-14_05-25-08AM/launcher2024-02-14_05-25-08AM.log.
Extracting the installer . . . . . . . . . Done
Checking if CPU speed is above 300 MHz.   Actual 2245.780 MHz    Passed
Checking swap space: must be greater than 512 MB.   Actual 16141 MB    Passed
Checking if this platform requires a 64-bit JVM.   Actual 64    Passed (64-bit not required)
Checking temp space: must be greater than 300 MB.   Actual 56050 MB    Passed
Preparing to launch the Oracle Universal Installer from /tmp/OraInstall2024-02-14_05-25-08AM
Log: /tmp/OraInstall2024-02-14_05-25-08AM/install2024-02-14_05-25-08AM.log
Copyright (c) 1996, 2019, Oracle and/or its affiliates. All rights reserved.
Reading response file..
Skipping Software Updates
Starting check : CertifiedVersions
Expected result: One of oracle-6, oracle-7, redhat-7, redhat-6, SuSE-11, SuSE-12, SuSE-15
Actual Result: oracle-8.5
Check complete. The overall result of this check is: Passed
CertifiedVersions Check: Success.


Starting check : CheckJDKVersion
Expected result: 1.8.0_191
Actual Result: 1.8.0_361
Check complete. The overall result of this check is: Passed
CheckJDKVersion Check: Success.


Validations are enabled for this session.
Verifying data
Copying Files
Percent Complete : 10
Percent Complete : 20
Percent Complete : 30
Percent Complete : 40
Percent Complete : 50
Percent Complete : 60
Percent Complete : 70
Percent Complete : 80
Percent Complete : 90
Percent Complete : 100

The installation of Oracle Fusion Middleware 12c Infrastructure 12.2.1.4.0 completed successfully.
Logs successfully copied to /scratch/oracle/oraInventory/logs.
```