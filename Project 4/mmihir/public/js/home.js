function checkInput() {
    "use strict";
    var firstname = document.getElementById("first").value,
        lastname = document.getElementById("middle").value,
        middlename = document.getElementById("last").value,
        birth = document.getElementById("dob").value,
        numIn = 0;
    if (firstname.trim() != '') {
        numIn = numIn + 1;
    }
    if (lastname.trim() != '') {
        numIn = numIn + 1;
    }
    if (middlename.trim() != '') {
        numIn = numIn + 1;
    }
    if (birth.trim() != '') {
        numIn = numIn + 1;
    }

    if (numIn < 2) {
        alert("You must input at least 2 fields");
    } else {
        window.location = "family.html";
    }
}

function adjustView() {
    var w = window.innerWidth;
    if (w < 800) {
        document.getElementById("col1").style.display = "block";
        document.getElementById("col2").style.display = "block";
        document.getElementById("col3").style.display = "block";
        document.getElementById("col1").style.width = "95%";
        document.getElementById("col2").style.width = "95%";
        document.getElementById("col3").style.width = "95%";
    } else {
        document.getElementById("col1").style.display = "inline-block";
        document.getElementById("col2").style.display = "inline-block";
        document.getElementById("col3").style.display = "inline-block";
        document.getElementById("col1").style.width = "30%";
        document.getElementById("col2").style.width = "30%";
        document.getElementById("col3").style.width = "30%";
    }
}

window.onresize = adjustView;
window.onload = adjustView;