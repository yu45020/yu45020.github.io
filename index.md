---
layout: default
title: Yu45020
description: 😵‍💫🤐🥶💊☠️👻
github: "https://github.com/Yu45020"
---
 

<div class="container">
    <div class="right-column">
        <div class="nav-tabs">
            <a class="tab" href="#home" onclick="showTab('home')">Home</a>
            <a class="tab" href="#projects" onclick="showTab('projects')">Projects</a>
        </div>

        <div class="separator"></div>

        <div id="home" class="tab-content">
            <h2>Welcome to My GitHub Page</h2>
            <p>This is the home section of my GitHub Page.</p>
        </div>

        <div id="projects" class="tab-content hidden">
            <ul>
                {% for post in site.posts %}
                    <li>
                        <a href="{{ post.url }}">{{ post.title }}</a> - {{ post.date | date: "%Y-%m-%d" }}
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    function showTab(tabId) {
        // Hide all tab content
        document.querySelectorAll('.tab-content').forEach(tab => tab.classList.add('hidden'));

        // Show the selected tab if it exists
        const activeTab = document.getElementById(tabId);
        if (activeTab) {
            activeTab.classList.remove('hidden');
        }

        // Update URL fragment dynamically
        history.pushState(null, null, `#${tabId}`);
    }

    // Check URL fragment on page load and show the correct tab
    if (window.location.hash) {
        const tabId = window.location.hash.substring(1); // Remove #
        showTab(tabId);
    }

    // Attach event listeners to tabs to update fragments
    document.querySelectorAll('.tab').forEach(tab => {
        tab.addEventListener('click', function (event) {
            const target = this.getAttribute('href').substring(1); // Get fragment ID
            event.preventDefault(); // Prevent default link behavior
            showTab(target);
        });
    });
});
</script>
