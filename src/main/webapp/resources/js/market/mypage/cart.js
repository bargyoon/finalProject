(() => {

testConsole = () => {
	console.dir(Number(document.getElementById("sm-price").value));
	
}

/* checkbox 설정 */
$(".chk_all").click(function(){
	var chk = $(".chk_all").prop("checked");
	if(chk) {
		$("input:checkbox[name='cartIdx']").prop("checked", true);
	} else {
		$("input:checkbox[name='cartIdx']").prop("checked", false);
	}
	calAmount();
});

$("input:checkbox[name='cartIdx']").click(function(){
	$(".chk_all").prop("checked", false);
	calAmount();
});

/* selectbox 상품개별삭제 */
function selectDelete() {
	 var url = "cart/selectDelete";
	 var selectedArr = new Array();
	 var cartIdx = document.getElementsByName("cartIdx"); //

	  for (var i = 0; i < cartIdx.length; i++) {
	   if (cartIdx[i].checked == true) {
		   selectedArr.push(cartIdx[i].value);
	   }
	  }
	
	 if (selectedArr.length == 0) {
		 alert("삭제하실 항목을 적어도 하나는 체크해 주세요.");
	 } else {
	  	$.ajax({
	  		url : url,
	  		type : 'POST',
	  		traditional : true,
	  		data : {
	  			selectedArr : selectedArr
	  		},
	  		success : function(jdata){
	  			if(jdata = 1){
	  				location.replace("cart")
	  			}else{
	  				alert("삭제 실패");
	  			}
	  		}
	  	});
	 }
	}

	//상품 삭제 버튼
	deleteCart = (cartIdx) => {
		fetch("cart/delete/" + cartIdx , {
			method : "GET"
		})
		.then(response => {
			if(response.ok){
				alert("삭제하였습니다.");
				location.reload();
			} else {
				alert("장바구니에 해당 상품이 존재하지 않습니다.");
				location.reload();
			}
		})
	} 

	//모두 삭제
	deleteAll = () => {
		fetch("cart/deleteAll" , {
			method : "GET"
		})
		.then(response => {
			if(response.ok){
				alert("삭제하였습니다.");
				location.reload();
			} else {
				location.reload();
			}
		})
	}

//장바구니 변경 ***
/* function updateCart(){
	var cartIdx = document.getElementsByName("count");
	var cartIdx = document.getElementsByName("cartIdx");
	console.dir("count : " + count);
	console.dir("cartIdx : " + cartIdx);
	form.action = "cart/update?count="+count"&cartIdx="cartIdx;
	form.submit();
} */

//상품 개수 증감 버튼
	changeCnt = (type, cartIdx) => {
		let cnt = document.getElementById('cnt-' + cartIdx);
		
		if(type == '+'){
			cnt.value = Number(cnt.value) + 1;	
		} else {
			if(cnt.value == 1){
				alert("상품의 수량은 최소 1개 입니다.");
				return;
			}
			cnt.value = Number(cnt.value) - 1;	
		}
	}

	updateCnt = (cartIdx, dtIdx) => {
		let prdCnt = document.getElementById("cnt-" + cartIdx);
		fetch("cart/check-stock", {
			method : "POST",
			headers:{
				"Content-type": "application/json;"
			},
			body : JSON.stringify({
				prdCnt : Number(prdCnt.value),
				dtIdx : Number(dtIdx),
				cartIdx : Number(cartIdx)
			})
		})
		.then(response => {
			if(response.ok){
				return response.text();
			}
		})
		.then(text => {
			if(text == "available"){
				alert("변경되었습니다.");
				location.reload();
			} else {
				alert("재고가 부족합니다.");
				location.reload();
			}
		})
		.catch(error => {
			throw new Error(response.status);
		})
	}

	useCoupon = (userIdx) => {
		if(userIdx == ''){
			alert("로그인이 필요합니다.");
			return;
		}
		
		if(document.getElementById("last-price-hidden").value == 0){
			alert("상품의 옵션을 먼저 선택해주세요.")
			return;
		}

		let res = window.open("/market/shop/choice-coupon?type=2","couponPopup", "width=1300,height=500,left=100,top=0");
	}


})();
    