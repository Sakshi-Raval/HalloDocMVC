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

//back button

var backbtns = document.getElementsByClassName("backBtn");
for (var btn of backbtns) {
    console.log("sdhfj");
    btn.addEventListener('click', function () {
        history.back();
        console.log("oiuyo");
    });
}




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


function FilteredPartial(currentPartialName, currentStatus) {
    var SearchText = $('#searchInput').val();
    var districtSelect = $('#districtSelect').find(':selected').data('value');
    var selectedFilter = $('.active-filter').data('value');
    var dataToSend = {
        SearchValue: SearchText,
        districtSelect: districtSelect,
        selectedFilter: selectedFilter,
        currentPartialName: currentPartialName,
        currentStatus: currentStatus,
    }
    $.ajax({
        url: '/Admin/LoadPartialView' ,
        type: 'GET',
        traditional:true,
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
    currentStatus = [1];
    currentPartialName = "_NewStatePartial"
    FilteredPartial(currentPartialName, currentStatus);


    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus);
    });
    $('#districtSelect').on('change', function () {
        console.log("dfsuig");

        FilteredPartial(currentPartialName, currentStatus);

    });
    $('.filter-options').on('click', function () {
        $('.filter-options').removeClass('active-filter');
        $(this).addClass('active-filter');
        FilteredPartial(currentPartialName, currentStatus);

    });
   
}

function PendingStateLoad() {
    $('#stateSpan').text(" (Pending)");
    $('.states').removeClass('active');
    $('#pendingState').addClass('active');
    currentStatus = [2];
    currentPartialName = "_PendingStatePartial"
    FilteredPartial(currentPartialName, currentStatus);


    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus);
    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus);

    });
    $('.filter-options').on('click', function () {
        $('.filter-options').removeClass('active-filter');
        $(this).addClass('active-filter');
        FilteredPartial(currentPartialName, currentStatus);

    });
}
function ToCloseStateLoad() {
    $('#stateSpan').text(" (To Close)");
    $('.states').removeClass('active');
    $('#toCloseState').addClass('active');
    currentStatus = [3,7,8];
    currentPartialName = "_ToCloseStatePartial"
    FilteredPartial(currentPartialName, currentStatus);


    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus);
    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus);

    });
    $('.filter-options').on('click', function () {
        $('.filter-options').removeClass('active-filter');
        $(this).addClass('active-filter');
        FilteredPartial(currentPartialName, currentStatus);

    });
}
function ActiveStateLoad() {
    $('#stateSpan').text(" (Active)");
    $('.states').removeClass('active');
    $('#activeState').addClass('active');
    currentStatus = [4, 5];
    currentPartialName = "_ActiveStatePartial"
    FilteredPartial(currentPartialName, currentStatus);


    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus);
    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus);

    });
    $('.filter-options').on('click', function () {
        $('.filter-options').removeClass('active-filter');
        $(this).addClass('active-filter');
        FilteredPartial(currentPartialName, currentStatus);

    });
}
function ConcludeStateLoad() {
    $('#stateSpan').text(" (Active)");
    $('.states').removeClass('active');
    $('#concludeState').addClass('active');
    currentStatus = [6];
    currentPartialName = "_ConcludeStatePartial"
    FilteredPartial(currentPartialName, currentStatus);


    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus);
    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus);

    });
    $('.filter-options').on('click', function () {
        $('.filter-options').removeClass('active-filter');
        $(this).addClass('active-filter');
        FilteredPartial(currentPartialName, currentStatus);

    });
}
function UnpaidStateLoad() {
    $('#stateSpan').text(" (Active)");
    $('.states').removeClass('active');
    $('#unpaidState').addClass('active');
    currentStatus = [9];
    currentPartialName = "_UnpaidStatePartial"
    FilteredPartial(currentPartialName, currentStatus);


    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus);
    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus);

    });
    $('.filter-options').on('click', function () {
        $('.filter-options').removeClass('active-filter');
        $(this).addClass('active-filter');
        FilteredPartial(currentPartialName, currentStatus);

    });
}

//function PartialTab(partialView,requestid) {
//    $.ajax({
//        url: '/Admin/' + partialView,
//        type: 'GET',
//        data: { requestid: requestid },
//        success: function (response) {
//            $('#home').html(response);
//        },
//        error: function (xhr, status, error) {
//            console.error(xhr.responseText);
//        }
//    });
//}

function populateCancelDropdown() {
    $.ajax({
        url: '/Admin/CaseTagResults',
        type: 'GET',
        success: function (data) {
            var dropdownData = data;
            console.log(dropdownData);
            var dropdown = $('#reasons');
            dropdown.empty();
            dropdown.append($('<option>').text('--').val(''));
            dropdownData.forEach(function (item) {
                dropdown.append($('<option>').text(item.name).val(item.casetagid));

            });
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}

function populateRegionDropdown() {
    $.ajax({
        url: '/Admin/RegionResults',
        type: 'GET',
        success: function (data) {
            var dropdownData = data;
            console.log(dropdownData);
            var dropdown = $('#regions');
            dropdown.empty();
            dropdown.append($('<option>').text('--').val(''));
            dropdownData.forEach(function (item) {
                dropdown.append($('<option>').text(item.name).val(item.regionid));

            });
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}

function populatePhysicianDropdown(regionid) {
    $.ajax({
        url: '/Admin/PhysicianResults',
        type: 'GET',
        data: {regionid : regionid},
        success: function (data) {
            var dropdownData = data;
            console.log(dropdownData);
            var dropdown = $('#physician');
            dropdown.empty();
            dropdown.append($('<option>').text('--').val(''));
            dropdownData.forEach(function (item) {
                dropdown.append($('<option>').text(item.firstname+" "+item.lastname).val(item.physicianid));

            });
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}

function openModal(btn) {
    console.log("Button clicked");
    const myModal = document.getElementById("cancelCaseModal");
    var bsModal = new bootstrap.Modal(myModal);
    bsModal.show();

    const requestid = btn.getAttribute('data-requestid');
    document.getElementById('requestid').value = requestid;
    const name = btn.getAttribute('data-name');
    document.getElementById('nameModal').textContent = name;
    populateCancelDropdown(); 
}

function assignCaseModal(btn) {
    console.log("Button clicked");

    const myModal = document.getElementById("assignCaseModal");
    var bsModal = new bootstrap.Modal(myModal);
    bsModal.show();

    const requestId = btn.getAttribute('data-requestId');
    document.getElementById('requestId').value = requestId;
    populateRegionDropdown();
}
function blockCaseModal(btn) {
    console.log("Button clicked");

    const myModal = document.getElementById("blockCaseModal");
    var bsModal = new bootstrap.Modal(myModal);
    bsModal.show();

    const requestID = btn.getAttribute('data-requestID');
    document.getElementById('requestID').value = requestID;
    const name = btn.getAttribute('data-Name');
    document.getElementById('NameModal').textContent = name;
}