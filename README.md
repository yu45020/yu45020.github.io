# yu45020.github.io
The website uses github [minimal](https://github.com/pages-themes/minimal) theme

## To Test Locally

```
bundle exec jekyll serve --incremental

```

## Changes

* The index.md fetches the posts from the `posts.json` file in the `data-storage` branch without rebuilding the site.
* to add posts: 
  * checkout the `data-storage` branch 
  * add the post to the `posts` folder
  * update the `posts.json` file

* Move the description part to the index.md header

* Add a button for dark theme

* update the `/assets/css/style.scss`

 
## To Build

* [Creating a GitHub Pages site with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll)

* [Testing your GitHub Pages site locally with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)
