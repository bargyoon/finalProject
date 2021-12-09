selectCoupon = (type, salePer, couponIdx) => {
	if(Number(type) == 1){
		let hiddenPrice = Number(opener.document.getElementById("total-price-hidden").value);
		let totalPrice = opener.document.getElementById("prd-total-price");
		let cpAmountHidden = opener.document.getElementById("cp-amount-hidden");
		let revisePrice = "";
		let smVal = Number(opener.document.getElementById("sm-value-hidden").value);
		
		cpAmountHidden.value = hiddenPrice * (salePer/100)
		revisePrice = ((hiddenPrice - smVal) - (hiddenPrice * (salePer/100))).toLocaleString();
		totalPrice.value = revisePrice + " 원";
		opener.document.getElementById("uc-idx").value = couponIdx;
		opener.document.getElementById("cp-amount").innerText = "-"+(hiddenPrice * (salePer/100)).toLocaleString()+" 원";
		close();
	} else {
		opener.document.getElementById("cp-idx-hidden").value = couponIdx;
		opener.document.getElementById("cp-hidden").value = salePer;
		window.opener.calAmount();
		close();
	}
}