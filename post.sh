#!/bin/zsh

# Make sure API key loads from .zshrc file
source ~/.zshrc


# Get current date, year, and month
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S +0800")
DATE=$(date +"%Y-%m-%d")
YEAR=$(date +"%Y")
MONTH=$(date +"%m")

# Get title from user input
echo "Enter the post title:"
read TITLE

echo "Enter the post slug:"
read SLUG

# Create year and month directories if they don't exist
mkdir -p _posts/$YEAR/$MONTH

# Create the file with YAML frontmatter
cat > _posts/$YEAR/$MONTH/$DATE-$SLUG.md <<EOL
---
title: "$TITLE"
permalink: /blog/$SLUG
date: $TIMESTAMP
categories:
- Category
tags: [] 
image:
    path: /assets/img/headers/$SLUG.png
---


EOL
