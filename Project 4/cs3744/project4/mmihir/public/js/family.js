function adjustGrid() {
    "use strict";
    var w = window.innerWidth;
    var num = Math.floor(w/450);
    document.getElementById("grid-container").style.gridTemplateColumns = "8cm ".repeat(num);
}

window.onload = adjustGrid;
window.onresize = adjustGrid;