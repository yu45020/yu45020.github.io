document.addEventListener("DOMContentLoaded", function () {
    const button = document.getElementById("dark-mode-toggle");

    if (!button) {
        console.error("Dark mode button not found!");
        return;
    }

    function toggleDarkMode() {
        document.body.classList.toggle("dark-mode");

        if (document.body.classList.contains("dark-mode")) {
            localStorage.setItem("dark-mode", "enabled");
            button.innerHTML = "☀️ Light Mode";
        } else {
            localStorage.setItem("dark-mode", "disabled");
            button.innerHTML = "🌙 Dark Mode";
        }
    }

    // Check stored preference or default to dark mode
    const userPreference = localStorage.getItem("dark-mode");

    if (userPreference === "enabled" || userPreference === null) {
        document.body.classList.add("dark-mode");
        button.innerHTML = "☀️ Light Mode";
    } else {
        button.innerHTML = "🌙 Dark Mode";
    }

    // Attach click event listener
    button.addEventListener("click", toggleDarkMode);
});
