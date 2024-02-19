---
title: "Organize External Monitors with Display Placer"
permalink: /blog/display-placer-external-monitors
date: 2024-02-19 12:17:25 +0800
categories:
- macOS
tags: [displayplacer] 
image:
    path: /assets/img/headers/display-placer-external-monitors.png
---


It's been almost a year since I got my MacBook Pro for work and it's been smooth sailing since then. I got two monitors connected to my Mac via Caldigit TS4 because my old Lenovo Thunderbolt Dock can no longer provide enough power to its connected devices as my second external monitor now flickers every now and then. So my setup is *almost* perfect.

Now the problem is my screens. I have a dual monitor configuration, with my MacBook Pro opened just in case Touch ID is required. Whenever I wake or restart my Mac, somehow my monitor arrangements get mixed up (i.e. left monitor projects right screen, and vice-versa). I was able to live with it in at least a week or so, but it became unbearable especially when I need to urgently look into my emails after lunch where my Mac would inadvertently sleep.

After checking forums for those who happened to encounter the same problem, I found a good tool that I could use to do this, and that is [Display Placer](https://github.com/jakehilborn/displayplacer). Using Display Placer, you can configure your monitor arrangements via command line. Essentially you would want to arrange your monitors first as you see fit, then run the `displayplacer list` which would give a detailed output of screens connected and ultimately the configuyration you can use to arrange the screens again:

```bash
displayplacer "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1512x982 hz:120 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" \
    "id:A854C8EE-593E-41CD-B6BC-E04241123C98 res:1920x1080 hz:60 color_depth:8 enabled:true scaling:off origin:(0,-1080) degree:0" \
    "id:AB239858-6AFD-47D9-8E03-4873A40B72E8 res:1920x1080 hz:60 color_depth:8 enabled:true scaling:off origin:(1920,-1080) degree:0"
```

I thought my problems ended there as long as I have this command because I could just execute it when required, but I am still getting an issue. Somehow even after running the same script, my monitors would not change at all because macOS tends to change the persistent screen IDs[^1]. So I went with possible solutions to this problem by checking the recommended discussions.

I later found a good workaround where a command will just be executed to just switch the external monitors regardless of screen IDs.[^2]. The command contains a good amount of `sed` which is one of those commands where I am glad it works but still couldn't figure out how it works. So now I have this command:

```bash
/opt/homebrew/bin/displayplacer list | tail -n1 | \
    sed 's/displayplacer //;s/id:\(.\{36\}\) res:\([0-9x]\{7,9\}\) \(.*\)id:\(.\{36\}\) res:\2/id:\4 res:\2 \3id:\1 res:\2/g' | \
    xargs /opt/homebrew/bin/displayplacer
```

This worked well for me since I only have two monitors. Now instead of memorizing this command, I am delighted to take advantage of macOS Automator, where I would just put this command as a 'Run Shell Script' action. Then I saved it as `CorrectDisplay.app` saved in my Documents folder. Now whenever my screens would swap, I would just run this app via Alfred.

[^1]: Then why call it persistent then? I don't know.
[^2]: [Swap positions of two monitors by contextual screen ID](https://github.com/jakehilborn/displayplacer/issues/80)