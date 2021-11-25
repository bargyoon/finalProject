<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/mypage/font.css" rel="stylesheet">
</head>
<body>

<section>
	<div class="container">
		<header class="d-flex justify-content-center py-3"style="min-width: 500px;">
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="/mypage/my-info" class="nav-link active">회원정보</a></li>
				<li class="nav-item"><a href="/mypage/pet-info" class="nav-link">마이펫</a></li>
				<li class="nav-item"><a href="/mypage/vaccination" class="nav-link">예방접종</a></li>
				<li class="nav-item"><a href="/mypage/managing-board" class="nav-link">작성글</a></li>
			</ul>
		</header>
		<h4 class="mb-3">마이페이지</h4>
	</div>
	
	<div class="container" style="display: flex;">
		<nav class="d-flex flex-column flex-shrink-0 p-3" style="width: 280px;">
			<span class="fs-4">회원정보</span>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><a href="/mypage/my-info" class="nav-link">내 정보</a></li>
				<li><a href="/mypage/modify-info" class="nav-link active">회원정보 수정</a></li>
			</ul>
		</nav>
		
		<div style="margin: 0 auto;">
			<form:form style="margin: 0 auto; width: 400px;" id="frm_update"
				action="/mypage/update-member" method="post" enctype="multipart/form-data" modelAttribute="updateMemberForm">
			
				<div class="input-group form-floating mb-3">
					<input type="text" class="form-control" id="nickname" 
						name="nickname" placeholder="1" value="" 
						aria-describedby="btnNicknameCheck">
					<button class="btn btn-outline-secondary" type="button" id="btnNicknameCheck">중복확인</button>
					<label for="nickname" class="form-label">닉네임</label>
					
					<c:if test="${empty error.nickname}">
						<span id="nicknameCheck" class="valid-msg"></span>
					</c:if>
					<form:errors id="nicknameCheck" path="nickname" cssClass="valid-msg"/>
				</div>
	
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="password" placeholder="1" value="">
					<label for="password" class="form-label">변경할 비밀번호</label>
				</div>
	
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="password2" placeholder="1" value="">
					<label for="password2" class="form-label">비밀번호 확인</label>
					
					<span id="passwordCheck" class="valid-msg"></span>
					<form:errors id="passwordCheck" path="password" cssClass="valid-msg"/>
				</div>
	
				<div class="form-floating">
					<input type="text" class="form-control" id="address" placeholder="주소를 입력하세요">
					<label for="address" class="form-label">주소</label>
				</div>
				
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="address2" placeholder="1">
					<label for="address2" class="form-label">상세주소</label>
				</div>
				
				<div class="form-floating mb-3">
					<textarea class="form-control" id="introduce" placeholder="1"></textarea>
					<label for="introduce" class="form-label">자기소개</label>
				</div>
				
				<div class="mb-3">
				  <label for="profilePhoto" class="form-label">프로필 사진</label>
				  <input class="form-control" type="file" id="profilePhoto">
				</div>
				
				<hr class="my-3">
				
				<button class="w-100 btn btn-primary btn-lg" type="submit">회원정보 수정</button>
			</form:form>
		</div>
	</div>
</section>
	
<aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="window.scrollTo(0,0)" style="float: right;">
	<i class="fas fa-arrow-alt-circle-up"></i>
</aside>

<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){ 
    	//주소입력칸을 클릭하면 주소 검색창 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
            }
        }).open();
    });
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/mypage/updateMemberForm.js"></script>

</body>
</html>