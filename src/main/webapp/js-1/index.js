function setFormMessage(formElement, type, message) {
    const messageElement = formElement.querySelector(".form__message");

    messageElement.textContent = message;
    messageElement.classList.remove("form__message--success", "form__messaage--error");
    messageElement.classList.add('form__message--${type}');
}

function setInputError(inputElement, message) {
    inputElement.classList.add("form__input--error");
    inputElement.parentElement.querySelector(".form__input-error-message").textContent = message;
}

function clearInputError(inputElement) {
    inputElement.classList.remove("form__input--error");
    inputElement.parentElement.querySelector(".form__input-error-message").textContent = "";
}

function validateEmail(inputText) {
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(inputText.value.match(mailformat)) {
        return true;
    }
    else {
        return false;
    }
}

document.addEventListener("DOMContentLoaded", () => {
    const loginForm = document.querySelector("#login");
    const createAccountForm = document.querySelector("#createAccount");
    const forgotPasswordForm = document.querySelector("#forgotPassword");


    // Toggles login and create account forms
    document.querySelector("#linkCreateAccount").addEventListener("click", e => {
        e.preventDefault();
        loginForm.classList.add("form--hidden");
        createAccountForm.classList.remove("form--hidden");
    });
    document.querySelector("#linkLogin").addEventListener("click", e => {
        e.preventDefault();
        loginForm.classList.remove("form--hidden");
        createAccountForm.classList.add("form--hidden");
    });


    // Toggles login and forgot password forms
    document.querySelector("#linkForgotPassword").addEventListener("click", e => {
        e.preventDefault();
        loginForm.classList.add("form--hidden");
        forgotPasswordForm.classList.remove("form--hidden");
    });
    document.querySelector("#linkLogin").addEventListener("click", e => {
        e.preventDefault();
        loginForm.classList.remove("form--hidden");
        forgotPasswordForm.classList.add("form--hidden");
    });


    // Login submission
    loginForm.addEventListener("submit", e => {
        //e.preventDefault();

        // ADD!! Perform AJAX/Fetch login

        //setFormMessage(loginForm, "error", "Invalid Email or Password");
    });


    // Forgot password submission
    forgotPasswordForm.addEventListener("submit", e => {
        e.preventDefault();
        
        // ADD!! Determine if email is found in system

    });


    // Create account input validation
    var formComplete = 0;
    document.querySelectorAll(".form__input").forEach(inputElement => {
        var error = false;

        inputElement.addEventListener("blur", e => {

            if(e.target.id === "firstName") {
                if (e.target.value.length <= 0){
                    setInputError(inputElement, "Please enter your first name");
                    error = true;
                }
                else {
                    formComplete ++;
                }
            }

            if(e.target.id === "lastName") {
                if (e.target.value.length <= 0){
                    setInputError(inputElement, "Please enter your last name");
                    error = true;
                }
                else {
                    formComplete ++;
                }
            }

            // Checks if signupEmail is valid
            if(e.target.id === "signupEmail") {
                if (e.target.value.length > 0 && e.target.value.includes("@ucalgary.ca")) {
                    formComplete ++;
                }
                else {
                    setInputError(inputElement, "Email is invalid. Must be a University of Calgary email");
                    error = true;
                }
            }

            if(e.target.id === "studentID") {
                if (e.target.value.length < 6 || e.target.value.length > 6){
                    setInputError(inputElement, "Please enter your 6-digit student ID number");
                    error = true;
                }
                else {
                    formComplete ++;
                }
            }

            // Checks if password >= 8 characters
            if(e.target.id === "signupPassword1") {
                if (e.target.value.length < 4){
                    setInputError(inputElement, "Password must be at least 4 characters in length");
                    error = true;
                }
                else {
                    formComplete ++;
                }
            }

            if(e.target.id === "signupPassword2") {
                if (e.target.value.length < 4){
                    setInputError(inputElement, "Password must be at least 4 characters in length");
                    error = true;
                }
                else {
                    formComplete ++;
                }
            }

            // ADD!! Checks if password and re-entered password are equal

            // Blocks submission if form is not filled out or error free
            createAccountForm.addEventListener("submit", e => {
                if (error == true || formComplete < 5){
                    e.preventDefault();
                }
            });
        });

        inputElement.addEventListener("input", e => {
            clearInputError(inputElement);
            error = false;
        });
    });

});