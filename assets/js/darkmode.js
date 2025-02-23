function toggleDarkMode() {
    document.body.classList.toggle("dark-mode");

    // Check if dark mode is active and update button text
    const button = document.getElementById("dark-mode-toggle");
    if (document.body.classList.contains("dark-mode")) {
        localStorage.setItem("dark-mode", "enabled");
        button.innerHTML = "☀️ Light Mode";
    } else {
        localStorage.setItem("dark-mode", "disabled");
        button.innerHTML = "🌙 Dark Mode";
    }
}

// Apply dark mode **by default** unless explicitly disabled
window.onload = function () {
    const button = document.getElementById("dark-mode-toggle");
    
    // If no preference is stored, default to dark mode
    if (localStorage.getItem("dark-mode") !== "disabled") {
        document.body.classList.add("dark-mode");
        button.innerHTML = "☀️ Light Mode";
    } else {
        button.innerHTML = "🌙 Dark Mode";
    }
};

// Apply dark mode if previously enabled and update button text
window.onload = function () {
    const button = document.getElementById("dark-mode-toggle");
    const userPreference = localStorage.getItem("dark-mode");
    if (userPreference === "enabled" || userPreference === null) {
        // If no preference is set (first-time visitor), default to dark mode
        document.body.classList.add("dark-mode");
        button.innerHTML = "☀️ Light Mode";
    } else {
        // User previously chose light mode
        button.innerHTML = "🌙 Dark Mode";
    }
};
