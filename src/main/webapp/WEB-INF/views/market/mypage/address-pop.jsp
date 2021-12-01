<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/market/mypage-head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
            div#wrapper {
                width : 1000px;
                height : 300px;
                margin : 0 auto;
                text-align: center;
            }
</style>      
</head>
<body style="background-color: floralwhite;">
	<div id="pop_wrap">
			<div id="pop_header">
				
			</div>	
		
		<div id="addressList-wrapper">
			<div id="pop_content">
				<div class="pop_title">
				<img src="/resources/img/logo2.png" style="width: 90px;">
					<h2>배송지 정보 입력</h2>
				</div>
			
			<table class="address_info">
			<tbody>
				<tr>
					<td class="address_name_td">
						<span>
							<label for="addressName">배송지명</label>
							<input type="text" id="addressName" class="ip_text" maxlength="150">
							<input type="hidden" id="hash" class="ip_text">
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span class="zip_span" style="width: 64px">
							<label for="zipCode" class="">우편번호</label>
							<input type="text" id="zipCode" class="ip_text">							
						</span>
						<input type="button" onclick="execPostcode()" value="우편번호 찾기"><br>
						<p class="address_detail">
							<span class="address_info">
								<label for="sample6_address" class="address_content">배송지 주소</label>
								<input type="text" id="address" placeholder="주소" class="ip_text" readonly="readonly">
								<input type="hidden" id="roadNameAddressYn">
							</span>
						</p>
						<p class="address_detail">
							<span style="width: 338px">
									<label for="address2" class="add_detail">상세 주소</label>
									<input type="text" id="address2" placeholder="상세주소" class="ip_text" maxlength="100">
							</span>
						</p>
					</td>
				</tr>
			</tbody>
			</table>
			<div class="address_notice">
				<p><i class="fas fa-check"></i> 입력/수정하신 배송지는 배송지 목록에 저장됩니다.</p>
			</div>
			<div class="address_pop_btn">
				<input type="button" onclick="window.close();" value="닫기">
				<input type="button" id="closeBtn" value="저장">
			</div>
			
			</div>
		</div>
		</div>	
	
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

		 function execPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }	  
		                
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('zipCode').value = data.zonecode;
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("address2").focus();
		                
		                console.dir(document.getElementById("addressName").value);
		                console.dir(document.getElementById("address").value);
		                console.dir(document.getElementById("address2").value);
		                
		            }
		        }).open();
		    }
		 
		/*  window.onload = function(event){
		       
		   		document.getElementById("closeBtn").onclick = function(){
		   			
		   			var addressName = document.getElementById("addressName").value;
		   			var address = document.getElementById("address").value;
		   			var address2 = document.getElementById("address2").value;
		        	
		   			window.opener.document.getElementById("addressName").value = addressName;
		   			window.opener.document.getElementById("address").value = address;
		   			window.opener.document.getElementById("address2").value = address2;
			        window.close();
		   	 }
			}  */
	</script>
</body>

</html>