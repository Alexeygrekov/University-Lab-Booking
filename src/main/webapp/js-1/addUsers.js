function setInputError(inputElement, message) {
    inputElement.classList.add("form__input--error");
    inputElement.parentElement.querySelector(".form__input-error-message").textContent = message;
}

function clearInputError(inputElement) {
    inputElement.classList.remove("form__input--error");
    inputElement.parentElement.querySelector(".form__input-error-message").textContent = "";
}

// Listen for clicks on the back link
var backLinkClick = false;
const backLink = document.querySelector('#linkHomepage');
backLink.addEventListener('click', () => {
    backLinkClick = true;
});

// Create account input validation
document.addEventListener("DOMContentLoaded", () => {
    const newUserForm = document.querySelector("#newUser");
    const selectElement = document.querySelector('#status');

    var error = false;
    var formComplete = 0;
    var selectionComplete = 0;

    document.querySelectorAll(".form__input").forEach(inputElement => {

        inputElement.addEventListener("blur", e => {
            // Checks if first and last names are filled out
            if(e.target.id === "fName") {
                if (e.target.value.length <= 0){
                    setInputError(inputElement, "Required: First Name");
                    error = true;
                }
                else {
                    formComplete ++;
                }
            }
            if(e.target.id === "lName") {
                if (e.target.value.length <= 0){
                    setInputError(inputElement, "Required: Last Name");
                    error = true;
                }
                else {
                    formComplete ++;
                }
            }

            // Checks if signupEmail is valid
            if(e.target.id === "userEmail") {
                if (e.target.value.length > 0 && e.target.value.includes("@ucalgary.ca")) {
                    formComplete ++;
                }
                else {
                    setInputError(inputElement, "Required: University of Calgary Email");
                    error = true;
                }
            }

            // Checks if student ID number is valid
            if(e.target.id === "userID") {
                if (e.target.value.length < 6 || e.target.value.length > 6){
                    setInputError(inputElement, "Required: User ID#");
                    error = true;
                }
                else {
                    formComplete ++;
                }
            }

            // Checks if password is atleast 4 digits
            if(e.target.id === "userPassword") {
                if (e.target.value.length < 4) {
                    setInputError(inputElement, "Required: Temporary Password");
                    error = true;
                } 
                else {
                    formComplete ++;
                }
            }

        });

        selectElement.addEventListener("change", e => {
            if (e.target.value === "") {
                error = true;
            } 
            else {
                selectionComplete++;
            }
        });

        // Blocks submission if form is not filled out or error free
        newUserForm.addEventListener("submit", e => {
            if (error == true || formComplete < 5 || selectionComplete < 1){
                e.preventDefault();
            }
            else {
                newUserForm.reset();
            }
        });

            // Clear validation messages before leaving the page
        window.addEventListener('beforeunload', () => {
            document.querySelectorAll(".form__input--error").forEach(inputElement => {
                clearInputError(inputElement);
                error = false;
            });
        });

        inputElement.addEventListener("input", e => {
            clearInputError(inputElement);
            error = false;
        });
    });
});