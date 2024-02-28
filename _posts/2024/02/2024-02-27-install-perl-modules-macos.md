---
title: "How to Install Perl Modules on macOS"
permalink: /blog/install-perl-modules-macos
date: 2024-02-27 13:31:45 +0800
categories:
- macOS
tags: [macos,perl] 
image:
    path: /assets/img/headers/install-perl-modules-macos.png
---


I have been tasked on running a Perl script on my Mac, but for some reason I cannot make it work because of some missing modules:

```
Can't locate GD.pm in @INC (you may need to install the GD module)
```

That looked simple, right? That means just install the Perl modules right!?!

Okay sorry, I sounded defensive. I just haven't installed Perl Modules via CPAN, let alone on a Mac before. In Windows I would just extract the zipped module into the libraries there, which worked well because I know Perl is installed on a local folder, isolated from the rest. But I am not sure if the same approach can be done on macOS.

So I decided to use cpan: 

```bash
cpan GD
```

I am getting the following error:

```
***
*** ExtUtils::PkgConfig requires the pkg-config utility, but it doesn't
*** seem to be in your PATH.  Is it correctly installed?
```

The error looked at me straight to my face, and I didn't know what to do with it. Turns out `ExtUtils::PkgConfig` is an interface to a program called `pkg-config` which is either not available in my Mac or not in my `$PATH` variable. I bet it was the case of the former, so I tried this:

```
brew install pkg-config
```

For some reason I elected to use `cpanm` on installing Perl modules over the standard `cpan`, so I did this to install:

```
cpan App::cpanminus
```

And then I ran the following commands:

```
cpanm GD
cpanm GD::Image
cpanm GD::Graph::bars
cpanm GD::Graph::pie
cpanm MIME::Base64
```

And just like that I was able to run my Perl script. Cool stuff!