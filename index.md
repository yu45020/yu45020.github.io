---
layout: default
title: Yu45020
description:   
    😵‍💫🤐🥶💊☠️👻
---

 
# Hello World


[//]: # (Automatically fetch and display posts from a GitHub repository.)
<div id="posts-container">Loading posts...</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    fetch('https://raw.githubusercontent.com/yu45020/yu45020.github.io/data-storage/posts.json')
        .then(response => response.json())
        .then(posts => {
            let container = document.getElementById("posts-container");
            container.innerHTML = ""; 

            posts.forEach(post => {
                console.log(post.url.split('/'));
                let rawMdUrl = `https://raw.githubusercontent.com/yu45020/yu45020.github.io/refs/heads/data-storage/posts/${post.url.split('/').pop()}.md`;
                let postElement = document.createElement("div");
                postElement.innerHTML = `
                    <h2><a href="#" class="post-link" data-url="${rawMdUrl}">${post.title}</a></h2>
                    <p>${post.excerpt}</p>
                `;
                container.appendChild(postElement);
            });

           if (localStorage.getItem("scrollPosition")) {
                window.scrollTo(0, localStorage.getItem("scrollPosition"));
            }
 
            document.querySelectorAll(".post-link").forEach(link => {
                link.addEventListener("click", function(event) {
                    event.preventDefault();
                    let mdUrl = this.getAttribute("data-url");
                    localStorage.setItem("scrollPosition", window.scrollY);
                    loadMarkdownPost(mdUrl);
                });
            });
        })
        .catch(error => {
            console.error("Error loading posts:", error);
            document.getElementById("posts-container").innerHTML = "Failed to load posts.";
        });
});
 
function loadMarkdownPost(mdUrl) {
    fetch(mdUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.text();
        })
        .then(markdown => {
            let converter = new showdown.Converter();
            let htmlContent = converter.makeHtml(markdown);

            document.getElementById("posts-container").innerHTML = `
                <a href="#" id="back-to-posts">← Back to posts</a>
                ${htmlContent}
                <a href="#" id="back-to-posts">← Back to posts</a>
            `;

            document.getElementById("back-to-posts").addEventListener("click", function (event) {
                event.preventDefault();
                document.location.hash = "";  
                location.reload();
            });
        })
        .catch(error => {
            console.error("Error loading markdown post:", error);
            document.getElementById("posts-container").innerHTML = "Failed to load post.";
        });
}
</script>

<!-- markdown conversion -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/showdown/2.1.0/showdown.min.js"></script>

