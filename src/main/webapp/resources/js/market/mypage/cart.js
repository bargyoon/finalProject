(() => {

/* checkbox 설정 */
$(".chk_all").click(function(){
 var chk = $(".chk_all").prop("checked");
 if(chk) {
  $("input:checkbox[name='cartIdx']").prop("checked", true);
 } else {
  $("input:checkbox[name='cartIdx']").prop("checked", false);
 }
});
$("input:checkbox[name='cartIdx']").click(function(){
	  $(".chk_all").prop("checked", false);
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

//상품 개수 증감 버튼 ****작업중
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


    $("#check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp88593867'); //가맹점 식별코드

        IMP.request_pay({
            pg: 'html5_inicis',       
            pay_method: 'card',           
            merchant_uid: 'merchant_' + new Date().getTime(),          
            name: '상품이름(테스트)',//결제창에서 보여질 이름
            amount: 10,  //가격 
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',
            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) { //callback
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });

})();
    