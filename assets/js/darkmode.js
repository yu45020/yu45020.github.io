document.addEventListener("DOMContentLoaded", function () {
    // Attach function to the window object to make it globally accessible
    window.toggleDarkMode = function () {
        document.body.classList.toggle("dark-mode");

        const button = document.getElementById("dark-mode-toggle");
        if (!button) {
            console.error("Dark mode button not found!");
            return;
        }

        if (document.body.classList.contains("dark-mode")) {
            localStorage.setItem("dark-mode", "enabled");
            button.innerHTML = "☀️ Light Mode";
        } else {
            localStorage.setItem("dark-mode", "disabled");
            button.innerHTML = "🌙 Dark Mode";
        }
    };

    // Ensure the dark mode setting is applied on page load
    const button = document.getElementById("dark-mode-toggle");
    if (!button) {
        console.error("Dark mode button not found!");
        return;
    }

    const userPreference = localStorage.getItem("dark-mode");
    if (userPreference === "enabled" || userPreference === null) {
        document.body.classList.add("dark-mode");
        button.innerHTML = "☀️ Light Mode";
    } else {
        button.innerHTML = "🌙 Dark Mode";
    }

    // Attach event listener to the button
    button.addEventListener("click", toggleDarkMode);
});
