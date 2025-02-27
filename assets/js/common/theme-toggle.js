document.addEventListener('DOMContentLoaded', () => {
    const themeToggle = document.getElementById('theme-toggle');
    if (!themeToggle){
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
});
