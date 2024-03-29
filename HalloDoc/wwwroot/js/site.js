﻿// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
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
//var date = new Date();

//var day = date.getDate();
//var month = date.getMonth() + 1;
//var year = date.getFullYear();

//if (month < 10) month = "0" + month;
//if (day < 10) day = "0" + day;

//var today = year + "-" + month + "-" + day;
//document.getElementById("dob").value = today;

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


function setLocalStorageDetails(currentPartialName, currentStatus, pagesize, currentpage) {
    localStorage.setItem("currentPartialName", currentPartialName);
    localStorage.setItem("currentStatus", currentStatus);
    localStorage.setItem("pagesize", pagesize);
    localStorage.setItem("currentpage", currentpage);
}
function retrieveStorageDetails() {
    var storedCurrentPartialName = localStorage.getItem("currentPartialName");
    var storedCurrentStatus = localStorage.getItem("currentStatus");
    var storedPagesize = localStorage.getItem("pagesize");
    var storedCurrentpage = localStorage.getItem("currentpage");

    if (storedCurrentPartialName && storedCurrentStatus ) {
        currentPartialName = storedCurrentPartialName;
        currentStatus = storedCurrentStatus;
        pagesize = parseInt(storedPagesize);
        currentpage = parseInt(storedCurrentpage);
    }
}

function updateCheckedValues() {
    var checkedValues = [];
    $(".filter-options:checked").not("#allCheck").each(function () {
        checkedValues.push($(this).val());
    });
    console.log(checkedValues);
    return checkedValues;
}


var pagesize = 5;
var currentpage = 1;
var currentStatus = [1];
var currentPartialName = "_NewStatePartial";
//setLocalStorageDetails(currentPartialName, currentStatus, pagesize, currentpage);
//console.log("initialising");

function FilteredPartial(currentPartialName, currentStatus,pagesize,currentpage) {
      $.get("/Admin/CheckSession", function (response) {
/*        retrieveStorageDetails();*/
        if (response.sessionExists) {
            var SearchText = $('#searchInput').val();
            var districtSelect = $('#districtSelect').find(':selected').data('value');
            var checkedValues = [];
            // Iterate over checked checkboxes
            $(".filter-options:checked").not("#allCheck").each(function () {
                checkedValues.push($(this).val());
            });

            // If "All" checkbox is checked, empty the checkedValues array
            if ($("#allCheck").prop("checked")) {
                checkedValues = [];
            }
            else {
                $(".filter-options:checked").each(function () {
                    checkedValues.push($(this).val());
                });
            }

            // Perform table filtering based on checkedValues
            // Implement your table filtering logic here

            // For example, you can log the checked values
            console.log("Checked values:", checkedValues);
            // Print the array of checked values
            console.log("Checked values:", checkedValues);


            var dataToSend = {
                SearchValue: SearchText,
                districtSelect: districtSelect,
                checkedFilter: checkedValues,
                currentPartialName: currentPartialName,
                currentStatus: currentStatus,
                pagesize: pagesize,
                currentpage: currentpage,
            }
            $.ajax({
                url: '/Admin/LoadPartialView',
                type: 'GET',
                traditional: true,
                data: dataToSend,
                success: function (response) {
                    $('#partialContainer').html(response);
                    setLocalStorageDetails(currentPartialName, currentStatus, pagesize, currentpage);

                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }
        else {
            window.location.href = "/Login/Login";
        }
    })
    
}

function NewStateLoad() {
    $('#stateSpan').text(" (New)");
    $('.states').removeClass('active');
    $('#newState').addClass('active');
    currentStatus = [1];
    currentPartialName = "_NewStatePartial";
    currentpage = 1;
    FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);


    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
    });
    $('#districtSelect').on('change', function () {
        console.log("dfsuig");

        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
    });
    $('.filter-options').on('click', function () {
        var anyChecked = $(".filter-options").is(":checked");

        // If any other checkbox is checked, uncheck #allCheck
        if (anyChecked) {
            $("#allCheck").prop("checked", false);
            $(".filter-btn:active").addClass("active-filter-btn");
        }
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
    });
    $("#allCheck").on('click', function () {
        // If #allCheck is checked, uncheck all other checkboxes
        if ($(this).is(":checked")) {
            $(".filter-options").prop("checked", false);
            $(".filter-btn-all").addClass("active-filter-btn");
            FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
        }
    });
    
}

function PendingStateLoad() {
    $('#stateSpan').text(" (Pending)");
    $('.states').removeClass('active');
    $('#pendingState').addClass('active');
    currentStatus = [2];
    currentPartialName = "_PendingStatePartial";
    currentpage = 1;
    FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);



    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);

    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);


    });
    $('.filter-options').on('click', function () {
        var anyChecked = $(".filter-options").is(":checked");

        // If any other checkbox is checked, uncheck #allCheck
        if (anyChecked) {
            $("#allCheck").prop("checked", false);
        }
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
    });
    $("#allCheck").on('click', function () {
        // If #allCheck is checked, uncheck all other checkboxes
        if ($(this).is(":checked")) {
            $(".filter-options").prop("checked", false);
            FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
        }
    });
}
function ToCloseStateLoad() {
    $('#stateSpan').text(" (To Close)");
    $('.states').removeClass('active');
    $('#toCloseState').addClass('active');
    currentStatus = [3,7,8];
    currentPartialName = "_ToCloseStatePartial";
    currentpage = 1;
    FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);



    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);

    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);


    });
    $('.filter-options').on('click', function () {
        var anyChecked = $(".filter-options").is(":checked");

        // If any other checkbox is checked, uncheck #allCheck
        if (anyChecked) {
            $("#allCheck").prop("checked", false);
        }
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
    });
    $("#allCheck").on('click', function () {
        // If #allCheck is checked, uncheck all other checkboxes
        if ($(this).is(":checked")) {
            $(".filter-options").prop("checked", false);
            FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
        }
    });
}
function ActiveStateLoad() {
    $('#stateSpan').text(" (Active)");
    $('.states').removeClass('active');
    $('#activeState').addClass('active');
    currentStatus = [4, 5];
    currentPartialName = "_ActiveStatePartial";
    currentpage = 1;
    FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);



    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);

    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);


    });
    $('.filter-options').on('click', function () {
        var anyChecked = $(".filter-options").is(":checked");

        // If any other checkbox is checked, uncheck #allCheck
        if (anyChecked) {
            $("#allCheck").prop("checked", false);
        }
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
    });
    $("#allCheck").on('click', function () {
        // If #allCheck is checked, uncheck all other checkboxes
        if ($(this).is(":checked")) {
            $(".filter-options").prop("checked", false);
            FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
        }
    });
}
function ConcludeStateLoad() {
    $('#stateSpan').text(" (Active)");
    $('.states').removeClass('active');
    $('#concludeState').addClass('active');
    currentStatus = [6];
    currentPartialName = "_ConcludeStatePartial";
    currentpage = 1;
    FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);



    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);

    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);


    });
    $('.filter-options').on('click', function () {
        var anyChecked = $(".filter-options").is(":checked");

        // If any other checkbox is checked, uncheck #allCheck
        if (anyChecked) {
            $("#allCheck").prop("checked", false);
        }
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
    });
    $("#allCheck").on('click', function () {
        // If #allCheck is checked, uncheck all other checkboxes
        if ($(this).is(":checked")) {
            $(".filter-options").prop("checked", false);
            FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
        }
    });
}
function UnpaidStateLoad() {
    $('#stateSpan').text(" (Active)");
    $('.states').removeClass('active');
    $('#unpaidState').addClass('active');
    currentStatus = [9];
    currentPartialName = "_UnpaidStatePartial";
    currentpage = 1;
    FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);



    $('#searchInput').on('input', function () {
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);

    });
    $('#districtSelect').on('change', function () {


        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);


    });
    $('.filter-options').on('click', function () {
        var anyChecked = $(".filter-options").is(":checked");

        // If any other checkbox is checked, uncheck #allCheck
        if (anyChecked) {
            $("#allCheck").prop("checked", false);
        }
        FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
    });
    $("#allCheck").on('click', function () {
        // If #allCheck is checked, uncheck all other checkboxes
        if ($(this).is(":checked")) {
            $(".filter-options").prop("checked", false);
            FilteredPartial(currentPartialName, currentStatus, pagesize, currentpage);
        }
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
            var dropdown = $('.regions');
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

function populateRoleDropdown() {
    $.ajax({
        url: '/Admin/RoleResults',
        type: 'GET',
        success: function (data) {
            var dropdownData = data;
            console.log(dropdownData);
            var dropdown = $('.roles');
            dropdown.empty();
            dropdown.append($('<option>').text('--').val(''));
            dropdownData.forEach(function (item) {
                dropdown.append($('<option>').text(item.name).val(item.roleid));

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
            var dropdown = $('.physician');
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
function transferCaseModal(btn) {
    console.log("Button clicked");

    const myModal = document.getElementById("transferCaseModal");
    var bsModal = new bootstrap.Modal(myModal);
    bsModal.show();

    const requestID = btn.getAttribute('data-RequestID');
    const physicianId = btn.getAttribute('data-physicianid');
    document.getElementById('RequestID').value = requestID;
    document.getElementById('physicianId').value = physicianId;
    populateRegionDropdown();
}

function clearCaseModal(btn) {
    console.log("Button clicked");

    const myModal = document.getElementById("clearCaseModal");
    var bsModal = new bootstrap.Modal(myModal);
    bsModal.show();

    const requestID = btn.getAttribute('data-Requestid');
    document.getElementById('Requestid').value = requestID;
}

function sendAgreementModal(btn) {
    console.log("Button clicked");

    const myModal = document.getElementById("sendAgreementModal");
    var bsModal = new bootstrap.Modal(myModal);
    bsModal.show();

    const requestID = btn.getAttribute('data-RequestId');
    document.getElementById('RequestId').value = requestID;

    const phone = btn.getAttribute('data-phone');
    document.getElementById('phone').value = phone;

    const email = btn.getAttribute('data-email');
    document.getElementById('email').value = email;
}

function sendLinkModal() {
    console.log("Button clicked");
    const myModal = document.getElementById("sendLinkModal");
    var bsModal = new bootstrap.Modal(myModal);
    bsModal.show();

}
function ExportToExcel() {
    //var dataToSend = {};
    $.ajax({
        url: '/Admin/ExportToExcel',
        type: 'POST',
        success: function (data) {
        
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}
function createProviderPartialLoad() {
    $('#providers').empty();
    $('#providers').load('/Admin/CreateProviderPartial');
}
function CreateRolePartialLoad() {

    $('#access').load('/Admin/CreateRolePartial');
}

function backToProvider() {
    $('#providerOption').addClass('selectedOption');
    $('#schedulingOption').removeClass('selectedOption');
    $('#providers').load('/Admin/ProviderMenuPartial');
}