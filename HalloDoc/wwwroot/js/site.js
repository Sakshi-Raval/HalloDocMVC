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
});

//Dark Mode

const darkBtn = document.getElementById("darkBtn");
const element = document.body;
let darkMode = localStorage.getItem("dark-mode");

const enableDarkMode = () => {
    element.classList.add("dark-theme");
    localStorage.setItem("dark-mode", "enabled");
};

const disableDarkMode = () => {
    element.classList.remove("dark-theme");
    localStorage.setItem("dark-mode", "disabled");
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
var infoArea = document.getElementById("infoArea");

input.addEventListener('change', showFileName);

function showFileName() {
    //var file_input = event.srcElement;
    //var fileName = file_input.files[0].name;
    //infoArea.textContent = fileName;
    var fileNames = '';
    var files = event.target.files;
    for (var i = 0; i < files.length; i++) {
        fileNames += files[i].name+', ';
    }
    fileNames = fileNames.slice(0, -2);
    infoArea.textContent = fileNames;
}
