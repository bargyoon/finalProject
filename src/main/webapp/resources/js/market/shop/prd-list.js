(() => {
	
	let prdList = document.getElementById("prd-list");
	let emptyList = document.getElementById("empty-list");
	let regLog = document.getElementById("reg-log");
	let pagination = document.getElementById("pagination");
	
	checkEmpty = (prdList) => {
	    if(prdList.childNodes.length < 2){
			emptyList.style.display = 'flex';
			prdList.style.display = 'none';
			pagination.style.display = 'none';
		}
	}
	
	isChecked = (category) => {
		if(!regLog.checked){
			location.href = "/market/shop/prd-list?category="+category;
		} else {
			location.href = "/market/shop/prd-list?category="+category+"&check=true";
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
	
	checkEmpty(prdList);
	
	
	prevBtn = (category, curPage, option) => {
		if(curPage == 1){
			alert("첫번째 페이지 입니다.")
			return;
		}
		
		let prevPage = curPage - 1;

		pageBtn(category, option, prevPage);
		
	}
	
	nextBtn = (category, curPage, blockEnd, option) => {
		if(curPage == blockEnd){
			alert("마지막 페이지 입니다.")
			return;
		}
		
		let nextPage = curPage + 1;
		
		pageBtn(category, option, nextPage);
		
	}
	
	
	pageBtn = (category, option, page) => {
		if(!regLog.checked){
			location.href = "/market/shop/prd-list?category="+category+"&option="+option+"&page="+page;
		} else {
			location.href = "/market/shop/prd-list?category="+category+"&option="+option+"&check=true&page="+page;
		}
	}
	
})();