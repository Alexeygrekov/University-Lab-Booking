function selectDate(){

    // Get the input value of the date box
    const inputDate = new Date(document.getElementById('dateInput').value);
    var utcDate = new Date(inputDate.getTime() + inputDate.getTimezoneOffset() * 60000);

    // Get today's date
    const currentDate = new Date(Date.now());

    // Get date number only
    const inputDay = utcDate.getDate();
    const currentDay = currentDate.getDate();

    // Check if the input date is at least one day in advance from today's date
    // !! NEEDS MORE VALIDATION FOR DATES FURTHER FROM TODAY
    // !! SET MAX DAYS THAT YOU CAN BOOK IN ADVANCE
    if ((inputDay - currentDay) >= 1||(inputDay - currentDay) <= -27) {
        document.getElementById('times').classList.remove('form--hidden');
        return true;
    } 
    else {
        alert("Please select a date at least 1 day in advance from today");
    }
}

function disableDate(){
    document.getElementById('dateInput').disabled = true;
}

function backToSelectDate() {
    // reset date
    const inputDate = document.getElementById('dateInput');
    inputDate.disabled = false;
    inputDate.value = '';

    // reset the checkboxes to unchecked
    const checkTime = document.querySelectorAll('#timesAvail input[type=checkbox]');
    checkTime.forEach((checkbox) => {
        checkbox.checked = false;
        checkbox.disabled = false;
    });

    const checkLab = document.querySelectorAll('#labsAvail input[type=checkbox]');
    checkLab.forEach((checkbox) => {
        checkbox.checked = false;
        checkbox.disabled = false;
    });

    const checkBooking = document.querySelectorAll('#bookingsAvail input[type=checkbox]');
    checkBooking.forEach((checkbox) => {
        checkbox.checked = false;
        checkbox.disabled = false;
    });

    // hide the times available section
    const selectTimeSection = document.getElementById('times');
    selectTimeSection.classList.add('form--hidden');
    
    // hide the select lab section
    const selectLabSection = document.getElementById('labs');
    selectLabSection.classList.add('form--hidden');

    // hide the select booking section
    const selectBookingSection = document.getElementById('bookings');
    selectBookingSection.classList.add('form--hidden');
}

function selectTime() {
    var checkboxes = document.querySelectorAll('#timesAvail input[type="checkbox"]:checked');
    if (checkboxes.length === 1) {
      document.getElementById('labs').classList.remove('form--hidden');
      return true;
    } 
    else {
      alert('Please select only 1 time slot');
    }
}

function backToSelectTime() {
    // reset the checkboxes to unchecked
    const checkTime = document.querySelectorAll('#timesAvail input[type=checkbox]');
    checkTime.forEach((checkbox) => {
        checkbox.checked = false;
        checkbox.disabled = false;
    });

    const checkLab = document.querySelectorAll('#labsAvail input[type=checkbox]');
    checkLab.forEach((checkbox) => {
        checkbox.checked = false;
        checkbox.disabled = false;
    });

    const checkBooking = document.querySelectorAll('#bookingsAvail input[type=checkbox]');
    checkBooking.forEach((checkbox) => {
        checkbox.checked = false;
        checkbox.disabled = false;
    });

    // hide the select lab section
    const selectLabSection = document.getElementById('labs');
    selectLabSection.classList.add('form--hidden');

    // hide the select booking section
    const selectBookingSection = document.getElementById('bookings');
    selectBookingSection.classList.add('form--hidden');
}

function selectLab() {
    var checkboxes = document.querySelectorAll('#labsAvail input[type="checkbox"]:checked');
    if (checkboxes.length === 1) {
      document.getElementById('bookings').classList.remove('form--hidden');
      return true;
    } 
    else {
      alert('Please select only one lab.');
    }
}

function backToSelectLab() {
    // reset the checkboxes to unchecked
    const checkLab = document.querySelectorAll('#labsAvail input[type=checkbox]');
    checkLab.forEach((checkbox) => {
        checkbox.checked = false;
        checkbox.disabled = false;
    });

    const checkBooking = document.querySelectorAll('#bookingsAvail input[type=checkbox]');
    checkBooking.forEach((checkbox) => {
        checkbox.checked = false;
        checkbox.disabled = false;
    });

    // hide the bookings available section
    const selectBookingSection = document.getElementById('bookings');
    selectBookingSection.classList.add('form--hidden');
}

function selectBooking() {
    var checkboxes = document.querySelectorAll('#bookingsAvail input[type="checkbox"]:checked');
    if (checkboxes.length === 1) {
      return true;
    } 
    else {
      alert('Please select only one booking.');
    }
}

document.addEventListener("DOMContentLoaded", () => {

    document.querySelector("#selectDate").addEventListener("click", e => {
        e.preventDefault();
        if (selectDate() == true){
            disableDate();
        }
    });

    const backToSelectDateBtn = document.getElementById('backToSelectDate');
    backToSelectDateBtn.addEventListener('click', backToSelectDate);

    document.querySelector("#selectTime").addEventListener("click", e => {
        e.preventDefault();
        if (selectTime() == true){
            const checkboxes = document.querySelectorAll('#timesAvail input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.disabled = true;
            });
        }
    });

    const backToSelectTimeBtn = document.getElementById('backToSelectTime');
    backToSelectTimeBtn.addEventListener('click', backToSelectTime);

    document.querySelector("#selectLab").addEventListener("click", e => {
        e.preventDefault();
        if (selectLab() == true){
            const checkboxes = document.querySelectorAll('#labsAvail input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.disabled = true;
            });
        }
    });

    const backToSelectLabBtn = document.getElementById('backToSelectLab');
    backToSelectLabBtn.addEventListener('click', backToSelectLab);

    const selectBookingBtn = document.querySelector("#selectBooking");
    document.querySelector("#selectBooking").addEventListener("click", e=> {
        if(selectBooking() == true){
            selectBookingBtn.formaction = "../actions/chooseItems.html";
        }
        else{
            e.preventDefault();
        }
    });

});