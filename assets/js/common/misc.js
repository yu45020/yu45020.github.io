document.addEventListener('DOMContentLoaded', () => {
  // Theme switcher
  const themeToggle = document.getElementById('theme-toggle');
  if (!themeToggle) {
    return;
  }

  const userPreference = localStorage.getItem('theme_mode');
  if (userPreference) {
    // set the theme to the user preference
    if (userPreference !== Theme.visualState) {
      Theme.flip();
    }
  }

  themeToggle.addEventListener('click', () => {
    Theme.flip();
    localStorage.setItem('theme_mode', Theme.visualState);
  });
  // wrap subtitle text in span
  var titleElement = document.getElementById("processed-title");
  if (titleElement) {
    titleElement.innerHTML = titleElement.innerHTML.replace(/([0-9])/g, '<span class="digit">$1</span>');
  }
});

