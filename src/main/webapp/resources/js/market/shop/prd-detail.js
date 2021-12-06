(() => {
	
    const prdOptionDivs = document.querySelectorAll(".selected-prd");
    for (let i = 0; i < prdOptionDivs.length; i++) {
        prdOptionDivs[i].style.display = "none";
    }
    	
	prevBtn = (prdIdx, curPage, option) => {
		if(curPage == 1){
			alert("첫번째 페이지 입니다.")
			return;
		}
		let prevPage = curPage - 1;
		pageBtn(prdIdx, option, prevPage);
	}
	
	nextBtn = (prdIdx, curPage, blockEnd, option) => {
		if(curPage == blockEnd){
			alert("마지막 페이지 입니다.")
			return;
		}
		let nextPage = curPage + 1;
		pageBtn(prdIdx, option, nextPage);
	}
	
	pageBtn = (prdIdx, option, page) => {
		location.href = "/market/shop/prd-detail?pn="+prdIdx+"&option="+option+"&page="+page;
	}
	
	changeOption = (prdIdx, option) => {
		location.href = "/market/shop/prd-detail?pn="+prdIdx+"&option="+option;
	}
	
	prevBtnQna = (prdIdx, curPage) => {
		if(curPage == 1){
			alert("첫번째 페이지 입니다.")
			return;
		}
		let prevPage = curPage - 1;
		pageBtn(prdIdx, prevPage);
	}
	
	nextBtnQna = (prdIdx, curPage, blockEnd) => {
		if(curPage == blockEnd){
			alert("마지막 페이지 입니다.")
			return;
		}
		let nextPage = curPage + 1;
		pageBtn(prdIdx, nextPage);
	}
	
	pageBtnQna = (prdIdx, page) => {
		location.href = "/market/shop/prd-detail?pn="+prdIdx+"&pageQna="+page;
	}

	focusReview = () => {
	    document.getElementById("focus-r").focus({preventScroll:false});
	}
	
	focusQnA = () => {
	    document.getElementById("focus-q").focus({preventScroll:false});
	}
	
	addOption = (optionValue) => {
		if(optionValue == "null"){
			alert("품절 상품 입니다.");
			return;
		}
		
	    if(optionValue != "" && checkOptionExists(optionValue)){
		
			fetch("/market/shop/prd-option?dtIdx=" + optionValue)
			.then(response => {
				if(response.ok){
					return response.json()
				}else{
					throw new Error(response.status);
				}
			})
			.then(data => {
				let dtIdxArr = document.getElementsByName("dtIdxs");
				resetDiscount();
		        addTotalPrice("+", data.price);
		        
				for (let i = 0; i < dtIdxArr.length; i++) {
					if(dtIdxArr[i].value == optionValue){
						dtIdxArr[i].checked = true;
					}
				}
		
		        let baseDiv = document.querySelector(".option-form");
		        let div = document.createElement("div");
		        div.classList.add("prd-option", "p-3", "mt-3", "selected-prd");
		        div.id = optionValue;
		        
		        let div2 = document.createElement("div");
		        div2.classList.add("d-flex", "justify-content-between");
		        let pTag = document.createElement("p");
		        let pTag2 = document.createElement("p");
		        pTag.innerText = data.poName;
		        pTag2.innerHTML = "<i class='fas fa-times'></i>";
		
		        pTag2.addEventListener("click", ()=>{
		            minusTotalPrice(input.defaultValue, data.price);
		            resetDiscount();
		            for (let i = 0; i < dtIdxArr.length; i++) {
						if(dtIdxArr[i].value == optionValue){
							dtIdxArr[i].checked = false;
						}
					}
		            document.getElementById(optionValue).remove();
		        })
		        
		        let div3 = document.createElement("div");
		        div3.classList.add("d-flex", "justify-content-between");
		
		        let div4 = document.createElement("div");
		        div4.classList.add("prd-amount");
		
		        let btnPlus = document.createElement("button");
		        let btnMinus = document.createElement("button");
		        let input = document.createElement("input");
		        input.defaultValue = 1;
		        input.id = optionValue + "-cnt";
		        input.type = "text";
		        input.readOnly = "readonly";
		        btnPlus.innerText = "+1";
		        btnPlus.type = "button";
		        btnMinus.innerText = "-1";
		        btnMinus.type = "button";
		
		        let spanTag = document.createElement("span");
		        spanTag.innerText = data.price + " 원";
		        spanTag.id = optionValue + "-price";
		
		        btnPlus.addEventListener("click", (e) => {
		            input.defaultValue++;
		            calPrice(optionValue, input.defaultValue, data.price);
		            addTotalPrice("+", data.price);
		            resetDiscount();
		        })
		        btnMinus.addEventListener("click", (e) => {
		            if(input.defaultValue > 1){
		                input.defaultValue--;
		                calPrice(optionValue, input.defaultValue, data.price);
		                addTotalPrice("-", data.price)
		                resetDiscount();
		            }
		        })
		
		        div4.appendChild(btnPlus);
		        div4.appendChild(input);
		        div4.appendChild(btnMinus);
		
		        div3.appendChild(div4);
		        div3.appendChild(spanTag);
		        
		        div2.appendChild(pTag);
		        div2.appendChild(pTag2);
		        div.appendChild(div2);
		        div.appendChild(div3);
		        baseDiv.appendChild(div);
			})
			.catch(error => { 
				throw new Error(response.status);
			})
	    }
	}
	
	calPrice = (option, prdCnt, price) => {
	    let prdPerPrice = price;
	    let prdPrice = prdCnt * prdPerPrice;
	    let prdPriceStr = prdPrice.toLocaleString();
	    document.getElementById(option+"-price").innerText = prdPriceStr + " 원";
	}
	
	checkOptionExists = (optionValue) => {
	    if(document.getElementById(optionValue) != null){
	        alert("이미 선택한 옵션입니다.");
	        return false;
	    }
	    return true;
	}
	
	addTotalPrice = (method, price) => {
	    let hiddenPrice = Number(document.getElementById("total-price-hidden").value);
	    let totalPrice = document.getElementById("prd-total-price");
	    let revisePrice = "";
    	let hiddenSmAvail = document.getElementById("sm-available-hidden");
    	let smAvali = document.getElementById("sm-available");
	
	    if(method == "+"){
	        document.getElementById("total-price-hidden").value = hiddenPrice + price;
        	hiddenSmAvail.value = document.getElementById("total-price-hidden").value * 0.05;
        	changeTotal(document.getElementById("sm-value-hidden").value);
        	smAvali.value = Number(document.getElementById("sm-available-hidden").value).toLocaleString() + "원";
	    } else {
	        document.getElementById("total-price-hidden").value = hiddenPrice - price;
        	hiddenSmAvail.value = document.getElementById("total-price-hidden").value * 0.05;
        	smAvali.value = Number(document.getElementById("sm-available-hidden").value).toLocaleString() + "원";
        	changeTotal(document.getElementById("sm-value-hidden").value);
	    }
	}
	
	
	minusTotalPrice = (prdCnt, price) => {
	    let minusPrice = prdCnt * price;
	    addTotalPrice("-", minusPrice);
	}
	
	
	useCoupon = (userIdx) => {
		if(userIdx == ''){
			alert("로그인이 필요합니다.");
			return;
		}
		
		if(document.getElementById("total-price-hidden").value == 0){
			alert("상품의 옵션을 먼저 선택해주세요.")
			return;
		}
		
		window.open("/market/shop/choice-coupon","couponPopup", "width=1300,height=500,left=100,top=0");
	}
	
	
	applySm = () => {
	    let hiddenPrice = Number(document.getElementById("total-price-hidden").value);
	    let inputVal = Number(document.getElementById("sm-value").value);
	    if(checkSm()){
	        document.getElementById("sm-value-hidden").value = inputVal;
	        changeTotal(inputVal);
	    } else {
	        document.getElementById("sm-value-hidden").value = null;
	    }
	}
	
	changeTotal = (money) => {
		let cpAmount = Number(document.getElementById('cp-amount-hidden').value);
		let hiddenPrice = Number(document.getElementById("total-price-hidden").value);
	    document.getElementById("prd-total-price").value = (hiddenPrice - money - cpAmount).toLocaleString() + " 원";
	}
	
	checkSm = () => {
	    let limitSm = Number(document.getElementById("sm-available-hidden").value);
	    let havaSm = Number(document.getElementById("have-sm-hidden").value);
	    let inputVal = document.getElementById("sm-value").value;
	
		if(document.getElementById("total-price-hidden").value == 0){
			alert("상품의 옵션을 먼저 선택해주세요.");
	        document.getElementById("sm-value").value = null;
	        changeTotal(0);
			return false;
		} else if(inputVal > havaSm){
	        alert("보유하신 적립금을 초과하였습니다.");
	        document.getElementById("sm-value").value = null;
	        changeTotal(0);
	        return false;
	    } else if(inputVal > limitSm) {
	        alert("사용 가능한 적립금을 초과하였습니다.");
	        document.getElementById("sm-value").value = Number(document.getElementById("sm-available-hidden").value);
	        changeTotal(limitSm);
	        return false;
	    }
	
	    return true;
	}

	resetDiscount = () => {
		let smAvailHidden = document.getElementById("sm-available-hidden");
		let smValHidden = document.getElementById("sm-value-hidden");
		
		document.getElementById("cp-amount-hidden").value = 0;
		document.getElementById("uc-idx").value = 0;
		document.getElementById("cp-amount").innerHTML = "버튼을 눌러 쿠폰을 적용하세요.";
		
		if(Number(smAvailHidden.value) < Number(smValHidden.value)){
			document.getElementById("sm-value").value = smAvailHidden.value;
			smValHidden.value = smAvailHidden.value;
			changeTotal(smAvailHidden.value);
		}
	}
	
	changeImgSize = (imgDiv) => {
	    let img = document.createElement("img");
	    img.src = imgDiv.firstElementChild.src;
	    if(document.querySelector(".extend-img-area").hasChildNodes){
	        document.querySelector(".extend-img-area").removeChild(document.querySelector(".extend-img-area").firstChild);
	    }
	    document.querySelector(".extend-img-area").append(img);
	}
	
	openEnquiry = (tr) => {
	    let contextId = tr.id + "-context";
	    let answerId = tr.id + "-answer";
	    document.getElementById(contextId).style.display == "none" 
	        ? document.getElementById(contextId).style.display = "table-row" : document.getElementById(contextId).style.display = "none";
	    document.getElementById(answerId).style.display == "none" 
	        ? document.getElementById(answerId).style.display = "table-row" : document.getElementById(answerId).style.display = "none";
	}
	
	makeOrdNo = () => {
	    let date = new Date();
	    let year = String(date.getFullYear());
	    let month = date.getMonth()+1;
	    month = month < 10 ? '0' + month : month;
	    let day = date.getDate();
	    day = day < 10 ? '0' + day : day;
	    let ranNum = Math.floor(Math.random() * 999999);
	    
	    return year+month+day+ranNum;
	}
	
	requestPay = (prdIdx, userIdx) => {
		    
    	var IMP = window.IMP;
    	IMP.init("imp96539619");

		let dtIdxArr = document.getElementsByName("dtIdxs");
		let smAmount = document.getElementById('sm-value').value;
		let ucIdx = document.getElementById('uc-idx').value;
		let cpAmount = document.getElementById('cp-amount-hidden').value;
		let total = document.getElementById('total-price-hidden').value;
		let prdName = document.getElementById('prd-name').value;
		
		let ordNo = makeOrdNo();
		let orderInfos = [];
		
		for(let i = 0; i < dtIdxArr.length; i++){
			if(dtIdxArr[i].checked){
				orderInfos.push({
					orderNum : Number(ordNo),
					userIdx : userIdx,
					proIdx : prdIdx,
					dtIdx : dtIdxArr[i].value,
					orderCnt : document.getElementById(dtIdxArr[i].value + "-cnt").value,
					saveMoney : smAmount,
					ucIdx : ucIdx,
					cpSaveMoney : cpAmount,
					paymentAmount : total - cpAmount - smAmount
				})
			}
		}
		
		fetch("/market/shop/check-stock", {
			method : "POST",
			body : JSON.stringify(orderInfos),
			headers:{
				"Content-type": "application/json;"
			}
		})
		.then(response => {
			if(response.ok){
				return response.json()
			} else {
				alert("로그인이 필요합니다.");
				throw new Error(response.status);
			}
		})
		.then(memberInfo => {
			if(memberInfo.userName == "disavailable"){
				alert("상품의 재고가 부족합니다.");
			} else {
	    		IMP.request_pay({ // param
			        pg : 'html5_inicis',
			        merchant_uid: ordNo, // 상점에서 관리하는 주문 번호
			        name : prdName,
			        amount : total - cpAmount - smAmount,
			        buyer_email : memberInfo.email,
			        buyer_name : memberInfo.userName,
			        buyer_tel : memberInfo.password,
			        buyer_addr : memberInfo.address
			    }, (rsp) => { // callback
			    	if(rsp.success){
						jQuery.ajax({
							url: "/market/shop/iamport-certification/" + rsp.imp_uid, //cross-domain error가 발생하지 않도록 주의해주세요
							type: 'GET'
						})
						.done(data => {
							if (rsp.paid_amount == data.response.amount) {
								fetch("/market/shop/regist-order", {
									method : "POST",
									headers:{
										"Content-type": "application/json;"
									},
									body : JSON.stringify(orderInfos)
								})
								.then(response => {
									if(response.ok){
										var msg = '결제가 완료되었습니다.';
									    msg += '\n고유ID : ' + rsp.imp_uid;
									    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
									    msg += '\결제 금액 : ' + rsp.paid_amount;
									    msg += '카드 승인번호 : ' + rsp.apply_num;
						        		alert(msg);
									} else {
										jQuery.ajax({
											url: "/market/shop/get-access-token",
											type : "GET",
										})
										.done(data => {
											jQuery.ajax({
												url : "https://final-cors.herokuapp.com/https://api.iamport.kr/payments/cancel",
												method: "POST",
												headers: {
													"Content-type": "application/json",
													"Authorization": data.response.token
												},
												data: JSON.stringify({
												   	imp_uid: rsp.imp_uid, //환불 uid
												    reason: "테스트 결제 환불", // 환불사유
												}),
									    	})
									    	.done(data => {
												alert("결제에 실패하여 자동취소처리 하였습니다.");
											})
											.catch(error => {
												throw new Error(response.status);
											})
										})
									}
								});
							} else {
								jQuery.ajax({
									url: "/market/shop/get-access-token",
									type : "GET",
								})
								.done(data => {
									jQuery.ajax({
										url : "https://cors-anywhere.herokuapp.com/https://api.iamport.kr/payments/cancel",
										method: "POST",
										headers: {
											"Content-type": "application/json",
											"Authorization": data.response.token
										},
										data: JSON.stringify({
											imp_uid: rsp.imp_uid, //환불 uid
											reason: "테스트 결제 환불", // 환불사유
										}),
									})
									.done(data => {
										alert("결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.");
									})
									.catch(error => {
										throw new Error(response.status);
									})
								})
							}
						});
					} else {
						var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        
				        alert(msg);
					}
	    		})
			}
		})
	
	}

	checkLike = (rvIdx) => {
		console.dir(rvIdx);
		let likeRvIdx = document.getElementById("like-" + rvIdx);
		
		fetch("/market/shop/update-like/" + rvIdx, {
			method : "GET"
		})
		.then(response => {
			if(response.ok){
				return response.text();
			} else {
				alert("로그인이 필요합니다.");
				return;
			}
		})
		.then(text => {
			if(text == "insert"){
				document.getElementById("like-" + rvIdx).value = Number(likeRvIdx.value) + 1; 
			} else if(text == "delete"){
				document.getElementById("like-" + rvIdx).value = Number(likeRvIdx.value) - 1; 
			}
		})
		.catch(error => {
			throw new Error(response.status);
		})
		
	}
	
	if(window.location.href.indexOf("pageQna") != -1){
		focusQnA();
	} else if (window.location.href.indexOf("option") != -1 || window.location.href.indexOf("page") != -1){
		focusReview();
	}
	
	
	registCart = (prdIdx, userIdx) => {
		if(userIdx == ''){
			alert("로그인이 필요합니다.");
			return;
		}
		
		if(document.getElementById("total-price-hidden").value == 0){
			alert("상품의 옵션을 먼저 선택해주세요.")
			return;
		}
		
		let dtIdxArr = document.getElementsByName("dtIdxs");
		let cartInfos = [];
		
		for(let i = 0; i < dtIdxArr.length; i++){
			if(dtIdxArr[i].checked){
				cartInfos.push({
					userIdx : userIdx,
					prdIdx : prdIdx,
					count : document.getElementById(dtIdxArr[i].value + "-cnt").value,
					dtIdx : dtIdxArr[i].value
				})
			}
		}
		
		fetch("/market/shop/regist-cart", {
			method : "POST",
			body : JSON.stringify(cartInfos),
			headers:{
				"Content-type": "application/json;"
			}
		})
		.then(response => {
			if(response.ok){
				return response.text();
			} else {
				alert("장바구니에 등록하지 못하였습니다.");
			}
		})
		.then(text => {
			if(text == "available"){
				alert("장바구니에 등록하였습니다.");
			} else {
				alert("장바구니에 이미 있는 항목이 포함되어있습니다.");
			}
		})
		.catch(error => {
			throw new Error(response.status);
		})
		
	}
	
	
})();