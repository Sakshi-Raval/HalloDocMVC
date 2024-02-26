// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.


//International phone number
document.write('<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/intl-tel-input@16.0.3/build/css/intlTelInput.css">');
var input = document.querySelectorAll(".phone");
input.forEach(function (inp) {
    var iti = window.intlTelInput(inp, {
        separateDialCode: false,
        fixDropdownWidth: true,
        utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
    });
    window.iti = iti;
    var errorMsgId = inp.getAttribute("data-error-msg-id");
    var errorMsg = document.getElementById(errorMsgId);
    var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];
    const reset = () => {
        inp.classList.remove("error");
        errorMsg.textContent = "";
        errorMsg.classList.add("hide");
    }

    inp.addEventListener('blur', () => {
        reset();
        if (inp.value.trim()) {
            if (!iti.isValidNumber()) {
                inp.classList.add("error");
                const errorCode = iti.getValidationError();
                errorMsg.textContent = errorMap[errorCode] || "Invalid number";
                errorMsg.classList.remove("hide");
            }
        }
    });
    inp.addEventListener('change', reset);
    inp.addEventListener('keyup', reset);
});


//Dark Mode

const darkBtn = document.getElementById("darkBtn");
const element = document.body;
let darkMode = localStorage.getItem("dark-mode");

const enableDarkMode = () => {
    element.classList.add("dark-theme");
    localStorage.setItem("dark-mode", "enabled");
    //var tables = document.getElementsByClassName('.table');
    //forEach(table in tables)
    //{
    //    table.classList.add("table-dark");
    //}
};

const disableDarkMode = () => {
    element.classList.remove("dark-theme");
    localStorage.setItem("dark-mode", "disabled");
    //var tables = document.getElementsByClassName('.table');
    //forEach(table in tables)
    //{
    //    table.classList.remove("table-dark");
    //}
};

if (darkMode == "enabled") {
    enableDarkMode();
}//set state of darkMode on page load

darkBtn.addEventListener("click", (e) => {
    darkMode = localStorage.getItem("dark-mode");   //update darkMode when clicked
    if (darkMode == "disabled") {
        enableDarkMode();
    }
    else {
        disableDarkMode();
    }
                
});



//Today's date as default
var date = new Date();

var day = date.getDate();
var month = date.getMonth() + 1;
var year = date.getFullYear();

if (month < 10) month = "0" + month;
if (day < 10) day = "0" + day;

var today = year + "-" + month + "-" + day;
document.getElementById("dob").value = today;

//File upload
var input = document.getElementById("fileUpload");

if (input) {
    input.addEventListener('change', showFileName);
}
function showFileName() {
    //var file_input = event.srcElement;
    //var fileName = file_input.files[0].name;
    //infoArea.textContent = fileName;
    var infoArea = document.getElementById("infoArea");
    var fileNames = '';
    var files = event.target.files;
    for (var i = 0; i < files.length; i++) {
        fileNames += files[i].name+', ';
    }
    fileNames = fileNames.slice(0, -2);
    infoArea.textContent = fileNames;
}

function showpass() {
    var password = document.getElementById('passwordLogin');
    if (password.getAttribute("type") == "password") {
        password.setAttribute("type", "text");
    }
    else {
        password.setAttribute("type", "password");
    }
    
}

//birthday validation
var birthdateInput = document.getElementById('dob');
var birthdateError = document.getElementById('dobSpan');
birthdateInput.addEventListener('change', function () {
    var selectedDate = new Date(birthdateInput.value);
    var currentDate = new Date();
    if (selectedDate > currentDate) {
        birthdateError.textContent = "Birthdate cannot be in future";
    }
    else {
        birthdateError.textContent = "";

    }
});


//admin dashboard
function LoadPartialView(partialName) {
    var SearchText = $('#searchInput').val();
    var districtSelect = $('#districtSelect').find(':selected').data('value');
    var selectedFilter = $('.active-filter').data('value');
    var dataToSend = {
        SearchValue: SearchText,
        districtSelect: districtSelect,
        selectedFilter: selectedFilter,
    }
    $.ajax({
        url: '/Admin/' + partialName,
        type: 'GET',
        data: dataToSend,
        success: function (response) {
            $('#partialContainer').html(response);
        },
        error: function (xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}

function NewStateLoad() {
    $('#stateSpan').text(" (New)");
    $('.states').removeClass('active');
    $('#newState').addClass('active');
    LoadPartialView("NewStatePartial");
    $('#searchInput').on('input', function () {
        LoadPartialView("NewStatePartial");
    });
    $('#districtSelect').on('change', function () {
        LoadPartialView("NewStatePartial");
    });
    $('.filter-options').on('click', function () {
        $('.filter-options').removeClass('active-filter');
        $(this).addClass('active-filter');
        LoadPartialView("NewStatePartial");
    });
}

function PendingStateLoad() {

    $('#stateSpan').text(" (Pending)");
    $('.states').removeClass('active');
    $('#pendingState').addClass('active');
    LoadPartialView("PendingStatePartial");
    $('#searchInput').on('input', function () {
        LoadPartialView("PendingStatePartial");
    });
    $('#districtSelect').on('change', function () {
        LoadPartialView("PendingStatePartial");
    });
    $('.filter-options').on('click', function () {
        LoadPartialView("PendingStatePartial");
    });
}

function PartialTab(partialView,requestid) {
    $.ajax({
        url: '/Admin/' + partialView,
        type: 'GET',
        data: { requestid: requestid },
        success: function (response) {
            $('#home').html(response);
        },
        error: function (xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}