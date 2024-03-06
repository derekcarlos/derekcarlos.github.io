---
title: "Fortinet Client in Command Line"
permalink: /blog/fortinet-client-cli
date: 2024-03-06 11:02:15 +0800
categories:
- VPN
tags: [macos,vpn] 
image:
    path: /assets/img/headers/fortinet-client-cli.png
---


I was asked to connect to a client VPN using Fortinet Client. Since I have been using Cisco Secure Client via command-line interface (CLI), I have been spoiled by the comfort of connecting via command line. So I looked for possible ways to connect to said client VPN using the same way.

Turns out there's a utility called **openfortivpn** that allows you to connect to PPP+TLS VPN tunnel services. Since I already have Homebrew installed on my Mac, I installed openfortivpn using the following command:

```bash
brew install openfortivpn
```

I then created a configuration file which I can use to connect to the VPN. 

```properties
host = <vpn-gateway-ip>
port = <port>
username = <my-username>
password = <my-password>
```

I then ran the following in `sudo` as it needs privileges to establish tunneling.

```bash
sudo openfortivpn -c VPN.config
```

Initially it didn't work, so I added the `-v` parameter to enable debug:

```bash
sudo openfortivpn -v -c VPN.config
```

That's when I learned that I need to add to add the following line in my `VPN.config` file:

```properties
trusted-cert = <string as it appeared in the debug logs>
```

I was able to connect okay, but I noticed that hostnames in URLs are not resolving to their IP addresses. The IP addresses are fine, so I thought it could be a problem with the DNS. I then added the following so the connection will allow the network to use the client's DNS settings:

```properties
set-dns = 0
pppd-use-peerdns = 1
```

After that, I added the connections as aliases and so I have a single command to type when connecting.