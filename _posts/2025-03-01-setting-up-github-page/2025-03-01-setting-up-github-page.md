---
title: Setting Up A GitHub Page
description: A brief tutorial on launching a GitHub page
author: yu45020
date: 2025-03-01
categories: [Tutorial]
tags: [tutorial, jekyll, jekyll-theme]
pin: false
math: false
mermaid: false

image:
  path: https://camo.githubusercontent.com/7deb9e4905ab1e73cec83fa80f3a5d0c7f613e6b522a9fdc41d5c79fad37eda8/68747470733a2f2f6368697270792d696d672e6e65746c6966792e6170702f636f6d6d6f6e732f646576696365732d6d6f636b75702e706e67
  alt: Chripy Jekyll Theme
---


<div onclick="window.open('https://github.com/yu45020/yu45020.github.io/fork', '_blank');" 
     style="position: absolute; top: 0; right: 0; width: 149px; height: 149px; 
            background: url('https://github.blog/wp-content/uploads/2008/12/forkme_right_darkblue_121621.png?resize=149%2C149') no-repeat center; 
            background-size: cover; cursor: pointer; z-index: 9999;">
</div>




##  TLDR

* Create a new public repo using your username 

* Install `Ruby`, `Bundler`, `Jekyll` [(prerequisites)](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll#prerequisites)

* Download a Jekyll theme [(list)](https://jekyllrb.com/docs/themes/)

* Configure the build process

  * go to the repo's `Settings` --> `Pages` on the left panel, 
  * under the `Build and deployment` section, choose `GitHub Actions`. 
  * go to `Actions` tab and set up a new workflow
  * copy my [version](https://github.com/yu45020/yu45020.github.io/blob/main/.github/workflows/build-deploy.yml) to your repo folder `.github/build-deploy.yml` 
  * a new action is available to run, which then builds and deploys the site 

* When you push commits to the main branch, GitHub then automatically rebuilds the site. 