---
layout: default
title: Yu45020
description:  😵‍💫🤐🥶💊☠️👻
---

 
# Hello World


[//]: # (Automatically fetch and display posts from a GitHub repository.)
<div id="posts-container">Loading posts...</div>

<script>
const githubName = "{{ site.githubname }}";
const postBranch = "{{ site.postbranch }}";
const postFolder = "{{ site.postfolder }}";
const postJson = "{{ site.postjson }}";

document.addEventListener("DOMContentLoaded", function() {
    fetch(`https://raw.githubusercontent.com/${githubName}/${githubName}.github.io/${postBranch}/${postJson}`)
        .then(response => response.json())
        .then(posts => {
            let container = document.getElementById("posts-container");
            container.innerHTML = ""; 

            posts.forEach(post => {
                let rawMdUrl = `https://raw.githubusercontent.com/${githubName}/${githubName}.github.io/refs/heads/${postBranch}/${postFolder}/${post.filename}`;
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
            let { metadata, content } = parseFrontMatter(markdown);
            let converter = new showdown.Converter();
            let htmlContent = converter.makeHtml(content);
            let formattedDate = metadata.date ? formatDate(metadata.date) : "";

            document.getElementById("posts-container").innerHTML = `
                <a href="#" id="back-to-posts-top">← Back to posts</a>
                <hr class="hr-bottom-line">
                <h1></h1>

                <h1>${metadata.title || "Untitled Post"}</h1>
                ${formattedDate ? `<p style="text-align: right;">${formattedDate}</p>` : ""}
                <!-- ${metadata.excerpt ? `<abstract>${metadata.excerpt}</abstract>` : ""} -->

                ${htmlContent}
                <h1></h1>
                <hr class="hr-bottom-line">
                <a href="#" id="back-to-posts-bottom">← Back to posts</a>
            `;

            document.getElementById("back-to-posts-top").addEventListener("click", function (event) {
                event.preventDefault();
                document.location.hash = "";  
                location.reload();
            });

            document.getElementById("back-to-posts-bottom").addEventListener("click", function (event) {
                event.preventDefault();
                document.location.hash = "";  
                location.reload();
            });
        })
        .catch(error => {
            console.error("Error loading markdown post:", error);
            document.getElementById("posts-container").innerHTML = "Failed to load post.";
        });

function parseFrontMatter(markdown) {
    let frontMatterRegex = /^---\n([\s\S]*?)\n---\n/;
    let match = markdown.match(frontMatterRegex);

    if (match) {
        let frontMatter = match[1];
        let content = markdown.replace(frontMatterRegex, ''); // Remove front matter

        let yamlObject = {};
        frontMatter.split("\n").forEach(line => {
            let [key, ...value] = line.split(": ");
            if (key && value.length) {
                yamlObject[key.trim()] = value.join(": ").trim();
            }
        });

        return { metadata: yamlObject, content: content };
    }

    return { metadata: {}, content: markdown };
}
}

function formatDate(dateString) {
    let date = new Date(dateString);
    if (isNaN(date)) return dateString; // Return original if parsing fails

    let day = String(date.getDate()).padStart(2, "0");
    let month = String(date.getMonth() + 1).padStart(2, "0");
    let year = date.getFullYear();

    return `${day}-${month}-${year}`;
}
</script>

<!-- markdown conversion -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/showdown/2.1.0/showdown.min.js"></script>

