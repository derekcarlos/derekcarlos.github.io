---
title: "How to Create Users in WebLogic via WLST"
permalink: /blog/wlst-create-users
date: 2024-02-12 10:08:19 +0800
categories: [How-To, Oracle WebLogic]
tags: [wlst] 
image:
    path: /assets/img/headers/wlst-create-users.png
---


One of the most repetitive requests that I get over the years is people asking me to provide login credentials for individuals who want access to an application instance deployed on Oracle WebLogic.

Unfortunately there are still instances where the domain is not integrated with an LDAP store like Active Directory, so I have to go to the Admin Console, click Security Realm, then the myrealm, then Users and Groups tab, etc., to add those users.

And in my case, I have to add that user to a specific group just so they can log in to the application. Which means, after creating the user, I have to click it, go to Groups tab and select that specific group.

It's fine for one user. Or maybe two. But if you're asked to create 30-100 users like for a training environment, that's when the sense of injustice creeps in. You can't possibly be sitting at your desk the entire day creating USER01 to USER99. 

Imagine the horror if at USER55 you noticed you have only created 54 users so far. *Oh fudge, which number did I skip?!*

Or maybe, you forget to add a specific user to that group I was talking about earlier. Are you willing to go back to the first 55 users you created to individually check if they were already added?

This is the type of repetitive task that needs to be scripted. It removes possibility of human error and makes sure that every user was created equal (as all things should be).

This is the script that I made for that specific purpose: creating one or more users.

```python
#
#   Author : Frederick Carlos
#
#   Script : createUser.py
#   Purpose: Create a WebLogic user on DefaultAuthenticator and add to cisusers group
#   Usage  : createUser.py [domain.properties]
#
if __name__ == '__main__':
    from wlstModule import *#@UnusedWildImport
    import os
    
def createUser(username, password, description, groupname):
    securityConfigurationMBean = getMBean('/SecurityConfiguration/' + DOMAIN_NAME)
    securityRealmMBean = securityConfigurationMBean.getDefaultRealm()
    defaultAuthenticatorProvider = securityRealmMBean.lookupAuthenticationProvider('DefaultAuthenticator')
    
    if defaultAuthenticatorProvider.userExists(username):
        print '>> Existing user: ' + username
    else:
        defaultAuthenticatorProvider.createUser(username, password, description)
        defaultAuthenticatorProvider.addMemberToGroup(groupname, username)
        print '>> Added user ' + username + ' to ' + groupname
    

# Read the domain properties file
try:
    if len(sys.argv) == 2:
        domainProperties = sys.argv[1]
    else:
        domainProperties=os.path.realpath(os.path.dirname(sys.argv[0])) + '/domain.properties'
    loadProperties(domainProperties)
    print ">>> Loaded the properties file: " + domainProperties
    print
    
except:
    exit(exitcode=1)
    
try:
    redirect('/dev/null','false')
    
    # Connect to Admin Server
    connect(userConfigFile=CONFIG_FILE, userKeyFile=KEY_FILE,url=ADMIN_URL)
    print ">>> Connected to the AdminServer."
    
    users = array(eval(APP_USERS), java.lang.String)
    
    for user in users:
        createUser(user, 'static-password', 'Application User', 'cisusers')
    
except Exception, e:
    print "ERROR... check error messages for cause."
    print e
    exit(exitcode=1)
    
redirect('/dev/null','false')

disconnect()
exit(exitcode=0)
```

So this script requires a properties file which it will use to log in to a domain and create a user. And since it's possible to create multiple users at any given point, I defined a function aptly named createUser which I can call multiple times.

This is a sample copy of the properties file that I called `domain.properties`. You can name it whatever you want, as long as you pass the file name as a parameter to the script. If you don't pass any file, the script will assume that a file named domain.properties exists and use that instead. If that file doesn't exists, well, I can't really connect to WebLogic without that now, can I?

```properties
# Admin Server Parameters
CONFIG_FILE=/home/oracle/start_scripts/DEV_domain.userconfig
KEY_FILE=/home/oracle/start_scripts/DEV_domain.userkey
ADMIN_URL=t3://localhost:8001
DOMAIN_NAME=DEV
# Users in an array
APP_USERS=['USER01','USER02']
```

To run the script, just call the `wlst.sh` from your Middleware Home like this:

```bash
# This is for WebLogic 12c. Actual file paths may differ on lower versions.
$MW_HOME/oracle_common/common/bin/wlst.sh createUser.py domain.properties
```

And that's it! The added bonus is that if you want to add more users, you can just add to the existing `APP_USERS` array. The script will know if the user already exists and skip it to avoid runtime error.

You can of course modify the script if you want a different password for different users. I didn't have that requirement, so I just created the same password for all.