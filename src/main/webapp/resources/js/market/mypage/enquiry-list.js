(() => {
    let eqClicks = document.querySelectorAll(".eq-click");
    console.dir(eqClicks);
    for (let index = 0; index < eqClicks.length; index++) {
	console.dir(index);
        eqClicks[index].style.display = "none";
    }
})();

let openEnquiry = (num) => {
    let eqClick = document.querySelectorAll("#eq-click-" + num);
    console.dir("eqClick :" + eqClick)
    for (let index = 0; index < eqClick.length; index++) {
	console.dir(index);
        eqClick[index].style.display == "none" ? eqClick[index].style.display = "table-row" : eqClick[index].style.display = "none";
    }

}