// Function to check captcha validity
const checkCaptcha = () => {
    const captcha = document.getElementById("captcha");
    const hiddenCaptcha = document.getElementById("hiddenCaptcha");

    if (captcha.value !== hiddenCaptcha.value) {
        captcha.value = "";

        // Use jquery-confirm for displaying error message
        $.confirm({
            title: 'Error!',
            content: 'Captcha Does Not Match!',
            type: 'red',
            buttons: {
                OK: {
                    text: 'OK',
                    btnClass: 'btn-red',
                    action: function () {}
                }
            }
        });

        return false; // Return false to prevent form submission
    }

    return true; // Captcha matches, allow form submission
};

// Function to reload captcha
const reloadCaptcha = () => {
    const realCaptcha = document.getElementById("realCaptcha");
    const hiddenCaptcha = document.getElementById("hiddenCaptcha");

    $.ajax({
        url: "/refresh-captcha",
        method: "GET",
        dataType: "json",
    })
    .done(function(response) {
        hiddenCaptcha.value = response.hiddenCaptcha;
        realCaptcha.src = "data:image/jpg;base64," + response.realCaptcha;
    })
    .fail(function() {
        alert("Something went wrong.");
    });
};

// Wait for the document to be fully loaded
$(document).ready(function() {

    console.log(jQuery().jquery);

    // Bind reloadCaptcha function to click event of reloadCaptchaBtn
    $("#reloadCaptchaBtn").on("click", function(event) {
        event.preventDefault(); // Prevent default link behavior
        reloadCaptcha(); // Call reloadCaptcha function
    });

    // Add submit event listener for loginForm
    $("#loginForm").on("submit", function(event) {
        // Prevent default form submission
        event.preventDefault();

        // Check captcha validity before submitting the form
        if (checkCaptcha()) {
            // Hash the password before submitting the form (if needed)
            const passwordField = document.getElementById('pwd');
            const password = passwordField.value;
            const hashedPassword = CryptoJS.SHA256(password).toString();
            passwordField.value = hashedPassword;

            // Submit the form
            this.submit();
        }
    });
});
