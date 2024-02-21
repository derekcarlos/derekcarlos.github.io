---
title: "DIY NAS and Home Server?"
permalink: /blog/diy-nas-home-server
date: 2024-02-21 19:12:26 +0800
categories:
- Home Lab
tags: [nas,synology] 
image:
    path: /assets/img/headers/diy-nas-home-server.png
---

I have a Synology DS415Play since 2016 and used it with my Intel NUC which acted as my Plex server. It has worked well since, but 6-7 years is probably too much for those two components. As I have moved to the new house I am slowly trying to revive my setup so that I could save up on streaming subscriptions.

## The Problem

Sometime during the pandemic (c. 2020) my Intel NUC, which has been working quite well as my Plex server, died. I have not been successful in troubleshooting it, and so now I am stuck with so many streaming subscriptions.

My Synology DS415Play is a four-bay NAS, and for years I have only used up to two disks - I have replaced those disks already as the old ones have started getting errors. For some reason I have decided to increase the capacity of my NAS by buying two more disks. And when I was trying to rebuild my RAID configuration somehow I thought to myself "I need to move around stuff, and I need to move my NAS, so maybe it doesn't hurt if I shut it down for now". And that's when the errors start popping out. One of the new disks crashed, and then an older disk crashed too. I was able to isolate the issue to an older disk, because when I moved the newer disk on another bay it kind of worked.

## The Options

I have the following options:

1. Rebuild and repair the storage on my existing NAS, build a new NUC and use the same setup as before
2. Buy a new Synology NAS, build a new NUC and use this setup
3. Build a DIY NAS+Plex Server so I only have one data appliance running

Obviously I have been trying to find reasons to upgrade to a new NAS, hence options 2 and 3 (maybe I consciously thought about this when I turned off my NAS while rebuilding RAID); but given the issues I am having with the existing NAS - I am not sure if it's worth buying a new disk and try repairing the RAID again. But this seems to be the cheaper version among the three options.

The second option means getting a new NAS - and I have been thinking about getting either [DS923+](https://www.synology.com/en-us/products/DS923+) or [DS423+](https://www.synology.com/en-us/products/DS423+). Both are four-bay NAS enclosures but while the former has a more powerful CPU and expandable ECC RAM slots, the latter has Intel QuickSync, which means it can be used as Plex server through its hardware transcoding capabilities. But both are pricey.

The third option is almost the same amount of the second option, but at least I get to choose the parts. The thing is - the hardware parts, although not that expensive - are hard to find as they are more catered towards industrial customers. For instance, a motherboard with ECC support and 6-8 SATA ports are hard to come by, like the ASRock IMB-X1231. Then my colleague also mentioned that it's also tough looking into different NAS platforms, and making sure that data scrubbing is enabled and running to avoid bit rot.

## So... Now What?

The data scrubbing part has got me thinking - it's been two months now that my existing NAS is running without any data scrubbing activities because it's been in Warning state due to one of four drives crashing down. I figured it might be a good short-term solution to buy a new disk and try rebuilding my RAID again. If this works then I can worry about getting a Mini PC (probably a Minisforum) to work as a Plex server.

The thing is, I don't have that much money to shell out on either option 2 or 3, and as much as I want to play around setting up everything on my own, it can be daunting, especially when I am busy with work and suddenly it fails and I am the only tech support around the house.

Maybe in the future I can expand my home lab but for now it's best to start with what I have. 