<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/mypage/font.css" rel="stylesheet">
<link href="/resources/css/mypage/mypage.css" rel="stylesheet">
</head>
<body>

<section>
	
	<div class="container" style="display: flex;">
		<nav class="d-flex flex-column flex-shrink-0 p-3" style="width: 280px;">
			<span class="fs-4"><a href="/mypage/my-info" class="nav-link">회원정보</a></li></span>
			<span class="fs-4"><a href="/mypage/pet-info" class="nav-link">마이펫</a></li></span>
			<span class="fs-4"><a href="/mypage/vaccination" class="nav-link">예방접종</a></li></span>
			<span class="fs-4"><a href="/mypage/managing-board" class="nav-link">작성글</a></li></span>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li><a href="/mypage/my-info" class="nav-link">내 정보</a></li>
				<li><a href="/mypage/update-member-info" class="nav-link">회원정보 수정</a></li>
			</ul>
		</nav>
		
		<div style="margin: 0 auto;">
			<form:form style="margin: 0 auto; width: 400px;" id="frmUpdateMember"
				action="/mypage/update-member-info" method="post" enctype="multipart/form-data" modelAttribute="updateMemberForm">
				<span>닉네임</span>
				<div class="input-group">
					<input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임을 입력하세요"
						aria-describedby="btnNickNameCheck" >
					<button class="btn btn-outline-secondary" type="button" id="btnNickNameCheck">중복확인</button>
					
					<form:errors id="nickNameCheck" path="nickName" cssClass="valid-msg"/>
				</div>
				<div class="mb-3">
					<c:if test="${empty error.nickName}">
						<span id="nickNameCheck" class="valid-msg"></span>
					</c:if>
				</div>
				
				<span>변경할 비밀번호</span>
				<div class="mb-3">
					<input type="password" class="form-control" id="password" name="password" placeholder="변경 할 비밀번호를 입력해주세요.">
					
					
					<c:if test="${empty error.password}">
						<span id="passwordCheck" class="valid-msg"></span>
					</c:if>
					<form:errors id="passwordCheck" path="password" cssClass="valid-msg"/>
				</div>
				
				<span>비밀번호확인</span>
				<div class="mb-3">
					<input type="password" class="form-control" id="password2" name="password2" placeholder="동일한 비밀번호를 입력해주세요.">
					
					
					<form:errors id="passwordCheck" path="password2" cssClass="valid-msg"/>
				</div>
				
				<span>주소</span>
				<div class="">
					<input type="text" class="form-control" id="address" name="address" placeholder="클릭하여 주소를 찾아주세요">
					
				</div>
				
				<div class="mb-3">
					<input type="text" class="form-control" id="addressDetail" name="addressDetail" placeholder="상세 주소를 입력해주세요.">
				
				</div>
				
				<%-- <div class="mb-3">
				  <label for="profilePhoto" class="form-label">프로필 사진</label>
				  <input class="form-control" type="file" id="profilePhoto" name="profilePhoto" value="${member.profilePhoto}">
				</div> --%>
				
				<hr class="my-3">
				
				<button class="w-100 btn btn-primary btn-lg" type="submit" id="btnUpdateMember">회원정보 수정</button>
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