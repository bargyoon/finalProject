(() => {
	
	let catList = document.getElementById("cat-list");
	let dogList = document.getElementById("dog-list");
	let emptyList = document.getElementById("empty-list");
	let regLog = document.getElementById("reg-log");
	
	checkEmpty = (firstList,secList) => {
	    if(firstList.childNodes.length < 1){
			emptyList.style.display = 'flex';
			firstList.style.display = 'none';
		} else {
			emptyList.style.display = 'none';
			firstList.style.display = 'flex';
		}
		secList.style.display = 'none';
	}
	
	isChecked = () => {
		if(regLog.checked){
			checkEmpty(catList, dogList);
		} else {
			checkEmpty(dogList, catList);
		}
	}
	
	sort = (category, option) => {
		let cg = category;
		if(!regLog.checked){
			location.href = "/market/shop/prd-list?category="+cg+"&option="+option;
		} else {
			location.href = "/market/shop/prd-list?category="+cg+"&option="+option+"&check=true";
		}
	}
	
	isChecked();
	
})();