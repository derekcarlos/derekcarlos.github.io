---
title: "Generate Diagrams in Markdown"
permalink: /blog/generate-diagrams-in-markdown
date: 2024-03-05 20:20:13 +0800
categories:
- MarkDown
tags: [technical writing, markdown, mermaid] 
image:
    path: /assets/img/headers/generate-diagrams-in-markdown.png
---


I am starting to move away from Word documents towards Markdown documents. It's just easier to edit and format as you don't need to worry about a heading with no text appear in your document outline. Plus file embedding in the Word document doesn't work anytime, so might as well just include those files separately.

So I started converting our team document from Word to Markdown when I got stumbled on images. Since I am planning to export these Markdown documents into HTML file, I want them to be portable i.e. you get all the information you need in a single file. That's more portable than having an `images` directory just to store your images.

Luckily the image I need to put in is an architectural diagram, and I was able to use [Mermaid](https://mermaid.js.org) for this case.

It can be a bit overwhelming at first when you see the semantics, but it's easy to understand once you compare the markdown and the finished product. The [Mermaid's documentation](https://mermaid.js.org/intro/) shows a myriad of diagrams you can generate using plain text. Cool stuff!

Unfortunately this site is not able to generate the diagram to show for it, but at least now I only have one simple HTML document generated from my Markdown master document, it's more readable and the format can be perceived as professionally written.

I am loving my switch to Markdown.