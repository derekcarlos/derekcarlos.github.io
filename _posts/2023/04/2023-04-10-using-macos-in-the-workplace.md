---
title: "Using macOS in the Workplace"
permalink: /blog/using-macos-in-the-workplace
date: 2023-04-10 08:00:00 +0800
categories: [How-To, macOS]
tags: [macos] 
image:
    path: /assets/img/headers/using-macos-in-the-workplace.png
---


It was more than six months ago when I learned that we can finally procure Apple laptops for workplace use. I have been inside the Apple ecosystem for quite some time, and would like to experience using an Apple laptop as my daily driver instead of just a "hobby" computer which I just use when I got free time.

My first MacBook Pro was the 2018 entry-level model which still runs on an Intel chip. It was never a fun experience using that laptop, especially on my lap, because it can get pretty hot even when running mundane tasks like browsing the web or watching a video.

I have heard good things about the thermal performance of M1 MacBooks, especially the M1 Pro, so I went and procured the 14-inch M1 Pro MacBook Pro.

## Advantages

I love the screen resolution and the way macOS renders fonts. I know Windows have anti-aliasing applied on fonts when rendering them on the screen, but macOS is still the one I'd choose if I am looking for an eye-candy. Even when I am using external monitors which are only running on 1080p, the font types are still refreshing to look at. I enjoy typing this post just because of that, so I guess that can help with my productivity?

I like the universal clipboard that comes with the Apple devices - I can just copy a OTP code from an authenticator app installed on my iPhone and paste it on a prompt on my laptop. Other than that, I can also read my phone's messages on my laptop, so I can readily reply when needed. I never liked typing on my phone because I always hit a typo and it blocks my train of thought.

The apps are also intuitive. For instance, I used to go to a web page to convert time between timezones, and it can get troublesome. Windows allow you to add at most two timezones viewable on the system tray, but I am afraid it's not enough as I work with people who are scattered across at least within three timezones. In macOS I use this nifty tool called [Clocker](https://apps.apple.com/us/app/clocker/id1056643111?mt=12&ref=derek.ph) which allows me to add as many timezones as I want, and it has this time scroller that refreshes other timezones so if I want to send out a meeting invite, it can be pretty reasonable for all attendees.

## Disadvantages (at least for now)

I am still trying to get used to the changes in using the Command key and the CTRL key for my keyboard shortcuts. For the most part I just replace CTRL with Command, like copying (Command + C) and pasting (Command + V). But there are times when CTRL is still required, like when interrupting a foreground process that I run on the terminal.

Speaking of terminal, I am also a bit dismayed that I will not be able to use my favorite MobaXterm on macOS; it is my favorite SSH client on Windows because it organizes your SSH sessions into folders so it's easier to manage sessions per project. But then again, macOS comes with its own terminal so everything is built in. The main advantage is the session management part. I was able to find a fix for this by using an SSH Config Editor app, which manages my `~/.ssh/config` file. I just need to remember to *save* the changes I have made before launching a new session.

My mechanical keyboard's Home and End keys were kind of rendered useless on macOS. I was able to find [this article](https://discussions.apple.com/thread/251108215?login=true&ref=derekph.ghost.io) which maps these keys so that they would behave the same as in Windows:

```bash
mkdir -p $HOME/Library/KeyBindings
echo '{
/* Remap Home / End keys to be correct */
"\UF729" = "moveToBeginningOfLine:"; /* Home */
"\UF72B" = "moveToEndOfLine:"; /* End */
"$\UF729" = "moveToBeginningOfLineAndModifySelection:"; /* Shift + Home */
"$\UF72B" = "moveToEndOfLineAndModifySelection:"; /* Shift + End */
"^\UF729" = "moveToBeginningOfDocument:"; /* Ctrl + Home */
"^\UF72B" = "moveToEndOfDocument:"; /* Ctrl + End */
"$^\UF729" = "moveToBeginningOfDocumentAndModifySelection:"; /* Shift + Ctrl + Home */
"$^\UF72B" = "moveToEndOfDocumentAndModifySelection:"; /* Shift + Ctrl + End */
}' > $HOME/Library/KeyBindings/DefaultKeyBinding.dict
```

## Conclusion

Even with those shortcomings, I am liking my experience so far with my MacBook Pro. It's still running on Monterey, and even though the newer Ventura has already been released for months now, I am still waiting for it to be stable (at least waiting for my peers to say it is) before jumping in. That's something that I grew cautious about because I don't want my daily driver to fail me when I need it the most, unlike on my hobby computer where I can just upgrade it whenever I want.

The thermals is great so far, and I never found it uncomfortable to work on especially when it's on my lap. I really hope it stays that way.

I will have this laptop for the next four years, so I guess this is a start of a new journey. I have been using Windows for my work for more than a decade, so I guess it's kind of refreshing to try something new. I might share a few of the tricks I learned here so stay tuned.