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
            container.innerHTML = ""; // Clear the loading message

            posts.forEach(post => {
                let postElement = document.createElement("div");
                postElement.innerHTML = `
                    <h2><a href="${post.url}">${post.title}</a></h2>
                    <p>${post.excerpt}</p>
                `;
                container.appendChild(postElement);
            });
        })
        .catch(error => {
            console.error("Error loading posts:", error);
            document.getElementById("posts-container").innerHTML = "Failed to load posts.";
        });
});
</script>

