---
# the default layout is 'page'
icon: fas fa-info-circle
order: 10
title: ""
---

# My GitHub Page

Welcometo my personal GitHub Page. This website serves as a platform to organize my repos and writings. 


The website is powered by **Jekyll** and uses the [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) Theme, with some modifications to improve content organization and display.  


If you are interested this theme, you may check out the ready-to-use [chirpy-starter](https://github.com/cotes2020/chirpy-starter), or fork this [repo](https://github.com/yu45020/yu45020.github.io) and customize your own version. 

---

## 🛠 Modifications to the Chirpy Jekyll Theme

### 📂 Improved File Organization
- Images and related files for a document are now stored in the same subfolder under `_posts/` and moved to `_site/posts/` with the correct internal URL.
  - Example: Everything inside `_posts/2025-01-01-awesome-post/` is moved to `_site/posts/2025-01-01-awesome-post`.

### 🔗 Enhanced URL Handling
- Added an internal URL resolver, allowing local images and documents to be referenced directly by filename.
  - Example: To reference an internal [tutorial](2025-03-01-setting-up-github-page#tldr):
    ```md
    [document](2025-03-01-setting-up-github-page#tldr)
    ```
  - In the original `Chirpy` theme, a Liquid function was required:
    {% raw %}
    ```md
    [document]({% post_url 2025-03-01-setting-up-github-page %}#tldr)
    ```
    {% endraw %}

### 📜 Flexible Markdown Naming
- Markdown documents are no longer required to follow the `YYYY-MM-DD-title.md` naming pattern.
  - Documents without this pattern are still processed, following the URL structure:  
    `/posts/YYYY-MM-DD-{folder}/filebasename`.

### 🎨 Style Customizations
- **Typography Adjustments:**
  - Base font size increased from 16px → 20px.
  - Changed font family to `Inter` and `Roboto`.
- **UI Improvements:**
  - Adjusted title font sizes separately for words and digits.
  - Made the side panel narrower.
  - Modified dark/light mode toggle.
- **Content Display Enhancements:**
  - Author names are always displayed, even if not included in `origin/authors.yml`.
  - Prevents unwanted line breaks after images when using:
    ```html
    <a> <img> </img> <a>
    ```
  - Introduced the attribute `no-wrap="true"` in `<img ... no-wrap="true">` to disable image pop-ups on click.


---