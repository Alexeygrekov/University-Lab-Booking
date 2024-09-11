function setFormMessage(message) {
    const messageElement = document.querySelector(".form__message");
    messageElement.innerHTML = message;
}

function setInputError(inputElement, message) {
    inputElement.classList.add("form__input--error");
    inputElement.parentElement.querySelector(".form__input-error-message").textContent = message;
}

function clearInputError(inputElement) {
    inputElement.classList.remove("form__input--error");
    inputElement.parentElement.querySelector(".form__input-error-message").textContent = "";
}

function selectResources() {
    document.getElementById('resource').classList.remove('form--hidden');
    document.getElementById('equip').classList.add('form--hidden');
}

function selectEquipment(){
    document.getElementById('resource').classList.add('form--hidden');
    document.getElementById('equip').classList.remove('form--hidden');
}

document.addEventListener("DOMContentLoaded", () => {

    const searchInput = document.getElementById('search');
    const searchBtn = document.getElementById('searchButton');
    const addForm = document.querySelector("#addItems");

    searchBtn.addEventListener('click', () => {
        searchInput.value = '';
    });

    document.querySelector("#selectEquip").addEventListener("click", e => {
        e.preventDefault();
        selectEquipment();
    });

    document.querySelector("#selectResource").addEventListener("click", e => {
        e.preventDefault();
        selectResources();
    });

    setFormMessage("** Quantities are assumed to match the standard unit for the given resource **");

    // Service validation
    var formComplete = 0;
    document.querySelectorAll(".form__input").forEach(inputElement => {

        var error = false;
        inputElement.addEventListener("blur", e => {

            if(e.target.id === "id") {
                if (e.target.value.length <= 0 || isNaN(e.target.value)) {
                    setInputError(inputElement, "Please enter a valid resource or equipment ID number");
                    error = true;
                }
                else {
                    formComplete++;
                }
            }

            if(e.target.id === "quant") {
                if (e.target.value.length <= 0 || isNaN(e.target.value)) {
                    setInputError(inputElement, "Please indicate the quantity needed");
                    error = true;
                }
                else {
                    formComplete++;
                }
            }
        });

        // Blocks submission if form is not filled out or error free
        addForm.addEventListener("submit", e => {
            if (error == true || formComplete < 2){
                e.preventDefault();
            }
        });

        inputElement.addEventListener("input", e => {
            clearInputError(inputElement);
            error = false;
        });
    });

    // Add event listener for "Complete Booking" button
    const finishBtn = document.getElementById('finishBook');
    finishBtn.addEventListener('click', () => {
        // Redirect user to homepage
        window.location.href = "general.jsp";
    });
});