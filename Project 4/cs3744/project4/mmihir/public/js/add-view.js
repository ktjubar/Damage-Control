function adjustLayout() {
    "use strict";
    var w = window.innerWidth;
    var h = window.innerHeight;
    if (w >= h) { //Regular desktop widescreen
        document.getElementById("picture-container").style.float = "left";
        document.getElementById("info-container").style.float = "right";
        document.getElementById("picture-container").style.width = "35%";
        document.getElementById("info-container").style.width = "55%";
    } else { //Mobile or vertical bias window
        document.getElementById("picture-container").style.float = "none";
        document.getElementById("info-container").style.float = "none";
        document.getElementById("picture-container").style.width = "80%";
        document.getElementById("info-container").style.width = "80%";
    }
}

window.onload = adjustLayout;
window.onresize = adjustLayout;