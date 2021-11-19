(() => {
    let eqClick = document.querySelectorAll(".eq-click");
    for (let index = 0; index < eqClick.length; index++) {
        eqClick[index].style.display = "none";
    }
})();

let openEnquiry = () => {
    let eqClick = document.querySelectorAll(".eq-click");
    for (let index = 0; index < eqClick.length; index++) {
        eqClick[index].style.display == "none" ? eqClick[index].style.display = "table-row" : eqClick[index].style.display = "none";
    }

}