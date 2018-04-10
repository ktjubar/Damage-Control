function checkInput() {
    "use strict";
    var firstname = document.getElementById("first").value;
    var lastname = document.getElementById("last").value;
    if (firstname.trim() == '') {
        alert("You must input a first name");
        return;
    } else if (lastname.trim() == '') {
        alert("You must input a last name");
        return;
    } else {
        window.location = "family.html";
    }
}