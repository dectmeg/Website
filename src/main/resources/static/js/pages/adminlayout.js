document.addEventListener("DOMContentLoaded", () => {

        function setActiveNavItem() {
            const navigationLinks = $('.nav a.nav-link');

            const currentURL = window.location.pathname;

            // Loop through each navigation link and check if it matches the current URL
            navigationLinks.each(function () {
                const linkURL = $(this).attr('href');
                if (linkURL === currentURL) {
                    $(this).addClass('active');
                } else {
                    $(this).removeClass('active');
                }
            });
        }
        setActiveNavItem();
    });

document.getElementById('signout-link').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById('logout-form').submit();
});
