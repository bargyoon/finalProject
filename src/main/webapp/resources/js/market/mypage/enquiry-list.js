(() => {
    let eqClick = document.querySelectorAll(".eq-click");
    console.dir(eqClick);
    for (let index = 0; index < eqClick.length; index++) {
	console.dir(index);
        eqClick[index].style.display = "none";
    }
})();

let openEnquiry = () => {
    let eqClick = document.querySelectorAll(".eq-click");
    console.dir(eqClick)
    for (let index = 0; index < eqClick.length; index++) {
	console.dir(index);
        eqClick[index].style.display == "none" ? eqClick[index].style.display = "table-row" : eqClick[index].style.display = "none";
    }

}