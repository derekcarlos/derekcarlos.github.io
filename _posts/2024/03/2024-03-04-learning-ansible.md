---
title: "Learning Ansible"
permalink: /blog/learning-ansible
date: 2024-03-04 14:26:37 +0800
categories:
- Ansible
tags: [ansible] 
image:
    path: /assets/img/headers/learning-ansible.png
---


I have done numerous installs on different kinds of Linux instances, and it's hard to keep track of the things you need to configure when working with a new one. I have to create a group, then a user, then assign that user to that group, then I have to install this, create initial folders, etc.

At some point it can get really sketchy, especially when you are working on multiple instances that are supposed to look like the other. I have a library of scripts, both in Bash and Python/Jython, but I still have to look for them and pick which one I want to run for a specific use-case. I created a big WLST script on how to configure a WebLogic domain, either for OUAF, SOA, or OSB. At first it's fun because you are learning something new; but it can get old really fast especially when you need to repeat those steps over and over again.

For someone who's getting older by the day - I think it's time to work smart, rather than work hard.

I have recently came across Ansible, which is a set of cookbooks that one can use to configure several things in an instance and I have seen numerous cookbooks especially those installing WebLogic and configuring domains all in that one script. And the thing is - you can rerun it several times!

I am still a newbie in Ansible, but I look forward in learning more and how it can help me automate most of my stuff at work. 