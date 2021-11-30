(() => {
    const prdOptionDivs = document.querySelectorAll(".selected-prd");
    for (let i = 0; i < prdOptionDivs.length; i++) {
        prdOptionDivs[i].style.display = "none";
    }

    let eqClick = document.querySelectorAll(".eq-click");
    for (let index = 0; index < eqClick.length; index++) {
        eqClick[index].style.display = "none";
    }
    
    var IMP = window.IMP;
    IMP.init("imp96539619");

	focusReview = () => {
	    document.getElementById("focus-r").focus({preventScroll:false});
	}
	
	focusQnA = () => {
	    document.getElementById("focus-q").focus({preventScroll:false});
	}
	
	addOption = (optionValue) => {
		console.dir(optionValue);
	    if(optionValue != "" && checkOptionExists(optionValue)){
		
			fetch("/market/shop/prd-option?dtIdx=" + optionValue)
			.then(response => {
				console.dir(response);
				if(response.ok){
					return response.json()
				}else{
					throw new Error(response.status);
				}
			})
			.then(data => {
				console.dir(data);
		        addTotalPrice("+", data.price);
		
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
		        input.name = optionValue + "-cnt";
		        input.type = "text";
		        input.readOnly = "readonly";
		        btnPlus.innerText = "+1";
		        btnMinus.innerText = "-1";
		
		        let spanTag = document.createElement("span");
		        spanTag.innerText = data.price + " 원";
		        spanTag.id = optionValue + "-price";
		
		        btnPlus.addEventListener("click", (e) => {
		            input.defaultValue++;
		            calPrice(optionValue, input.defaultValue, data.price);
		            addTotalPrice("+", data.price)
		        })
		        btnMinus.addEventListener("click", (e) => {
		            if(input.defaultValue > 1){
		                input.defaultValue--;
		                calPrice(optionValue, input.defaultValue, data.price);
		                addTotalPrice("-", data.price)
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
				console.dir(error);
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
	
	    if(method == "+"){
	        document.getElementById("total-price-hidden").value = hiddenPrice + price;
	        revisePrice = Number(document.getElementById("total-price-hidden").value).toLocaleString();
	        totalPrice.value = revisePrice + " 원";
	    } else {
	        document.getElementById("total-price-hidden").value = hiddenPrice - price;
	        revisePrice = Number(document.getElementById("total-price-hidden").value).toLocaleString();
	        totalPrice.value = revisePrice + " 원";
	    }
	}
	
	
	minusTotalPrice = (prdCnt, price) => {
	    let minusPrice = prdCnt * price;
	    addTotalPrice("-", minusPrice);
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
	    let day = date.getDate();
	    let ranNum = Math.floor(Math.random() * 9999999);
	    
	    return year+month+day+ranNum;
	}
	
	requestPay = (prdIdx) => {
	
		
	
/*	    let ordNo = makeOrdNo();
	
	    IMP.request_pay({ // param
	        pg : 'html5_inicis',
	        pay_method : 'card',
	        merchant_uid: ordNo, // 상점에서 관리하는 주문 번호
	        name : '주문명:결제테스트',
	        amount : 1000,
	        buyer_email : 'iamport@siot.do',
	        buyer_name : '구매자이름',
	        buyer_tel : '010-1234-5678',
	        buyer_addr : '서울특별시 강남구 삼성동',
	        buyer_postcode : '123-456'
	    }, (rsp) => { // callback
	        if ( rsp.success ) {
	            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	            jQuery.ajax({
	                url: "/market/shop/buy-test", //cross-domain error가 발생하지 않도록 주의해주세요
	                type: 'POST',
	                contentType: 'application/json',
	                data: JSON.stringify({
	                    orderIdx : ordNo,
		    			paymentAmount : 1000,
		    			paymentMethod : 'card',
		    			userIdx : 1234,
		    			
	                    //기타 필요한 데이터가 있으면 추가 전달
	                })
	            }).done(function(data) {
	                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                if ( everythings_fine ) {
	                    var msg = '결제가 완료되었습니다.';
	                    msg += '\n고유ID : ' + rsp.imp_uid;
	                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                    msg += '\결제 금액 : ' + rsp.paid_amount;
	                    msg += '카드 승인번호 : ' + rsp.apply_num;
	                    
	                    alert(msg);
	                } else {
	                    //[3] 아직 제대로 결제가 되지 않았습니다.
	                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                }
	            });
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            
	            alert(msg);
	        }
	    });*/
	
	}
	
})();