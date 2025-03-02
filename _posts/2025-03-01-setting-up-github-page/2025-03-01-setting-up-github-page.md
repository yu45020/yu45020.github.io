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


 

<a href="https://github.com/yu45020/jekyll-theme-chirpy/fork" target="_blank" rel="noopener noreferrer">
  <img loading="lazy" width="149" height="149" 
    src="https://github.blog/wp-content/uploads/2008/12/forkme_right_darkblue_121621.png?resize=149%2C149" 
    style="position: absolute; top: 0; right: 0; border: 0;" 
    alt="Fork me on GitHub" no-wrapper=true>
</a>

 


##  TLDR

* Create a new public repo using your username 


* Download a Jekyll theme 
  * [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/), [minimal-light](https://xiao-chenguang.github.io/minimal-light/), [Chirpy](https://chirpy.cotes.page/)
  * [GitHub Pages supported ](https://pages.github.com/themes/)
  * [and more ...](https://jekyllrb.com/docs/themes/)

* Configure the build process

  * go to the repo's `Settings` --> `Pages` on the left panel, 
  * under the `Build and deployment` section, choose `GitHub Actions`. 
  * go to `Actions` tab and set up a new workflow
  * copy my [version](https://github.com/yu45020/yu45020.github.io/blob/main/.github/workflows/build-deploy.yml) to your repo folder `.github/build-deploy.yml` 
  * a new action is available to run, which then builds and deploys the site 

* Put all markdown documents under the `_posts` folder with the file name pattern `YYYY-MM-DD-title.md`

* When you push commits to the main branch, GitHub then automatically rebuilds the site. 

* If you want to run the site localy
  * Install `Ruby`, `Bundler`, `Jekyll` [(prerequisites)](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll#prerequisites)
  * or the docker [way](https://dev.to/cuongnp/setting-up-a-local-development-environment-for-jekyll-with-docker-d8k)

## About this theme 

This GitHub page uses the [Chirpy](https://chirpy.cotes.page/) theme. The codes are well-written. I make the following changes 

* When markdown documents  are organized in subfolders in `_posts`,  files in the same folder will be copied to the same folder in the site. 
  * for example: everything in  `_posts/2025-01-01-awesome-post/` is moved to `_site/posts/2025-01-01-awesome-post`

* add an interanl url resolver so that images and documents can be directly referred by filename.
  * for example,  `2025-01-01-awesome-post2.md`,  can be cited as `[doc](2025-01-01-awesome-post)` as long as `2025-01-01-awesome-post.md` is in `_posts/`
 
* markdown documents are not required to following the naming pattern
  * Jekyll requires all posts in the `_posts/` following the naming pattern `YYYY-MM-DD-title.md`. Otherwises, the post will not be processed. 
  * This new feature frees the naming pattern. 

* some style changes
  * make the base font size from 16px to 20px and change font-family to "Inter" and "Roboto"
  * change the black/light theme-toggle  
  * make the side panel narrower   
  * adjust title font size separetely for words and digits 
  * can display author names even though they are not included in the `origin/authors.yml`
  * no break line behind an image when using `<a> <img> </img> <a>`
  * add option `no-wrap="true"` in `<img ... no-warp="true">` to avoid poping up an image on click