document.addEventListener("DOMContentLoaded", function () {
    const button = document.getElementById("dark-mode-toggle");
    if (!button) {
        console.error("Dark mode button not found!");
        return;
    }

    // Ensure the dark mode setting is applied on page load
    const userPreference = localStorage.getItem("dark-mode");

    if (userPreference === "enabled") {
        document.body.classList.add("dark-mode");
        button.innerHTML = "☀️ Light Mode";
    } else {
        document.body.classList.remove("dark-mode");
        button.innerHTML = "🌙 Dark Mode";
    }

    // Attach event listener using an anonymous function
    button.addEventListener("click", function () {
        document.body.classList.toggle("dark-mode");

        if (document.body.classList.contains("dark-mode")) {
            localStorage.setItem("dark-mode", "enabled");
            button.innerHTML = "☀️ Light Mode";
        } else {
            localStorage.setItem("dark-mode", "disabled");
            button.innerHTML = "🌙 Dark Mode";
        }
    });
});
