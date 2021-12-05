<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/memberCommon.css">

</head>
<body>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
             <div id=page-logo><img src="/resources/assets/img/dog-and-cat-yellow.png" alt="..." /></div><br><br>  
			 <h3>비밀번호 찾기</h3><br><hr>
               <form method="post" class="form-signin" action="/member/search-pw" name="findform">
                  <div class="form-group">
                     <label>아이디를 입력해주세요</label>
                     <input type="text" class="form-control" name="userId" id="userId" placeholder="ID">
                  </div>
                  <div class="form-group">
                     <label>회원가입 시 작성한 이메일을 입력해주세요</label>
                     <input type="text" class="form-control" name="email" id="email"placeholder="email">
                  </div>
                  <input class="btn btn-secondary" type="submit" id="search-pw-bnt"value="비밀번호 재설정하기" /><br><br>
	
	              <c:if test="${check == 1}">
					<label class="search-id-box"><b>일치하는 정보가 존재하지 않습니다.</b></label>
				  </c:if>				
				  <c:if test="${check == 0 }">
						<div><br><hr>
							<label>비밀번호를 변경해주세요.</label>
						</div>
						<div class="form-label-group">
							<input type="hidden" id="userId" name="userId" value="${userId}">					
							<input type="password" id="password" name="password" class="form-control" placeholder="password"/>
						</div><br>					
						<div class="form-label-group">
							<input type="password" id="confirmpassword" name="confirmpwd" class="form-control" placeholder="confirmPassword "/>
						</div>					
						<div class="form-label-group">
							<input class="btn btn-secondary" id="updatePw" type="button" value="비밀번호 저장하기" onclick="updatePassword()">
						</div>
				  </c:if>
				</form> 
            </div>
         </div>
         <div class="empty"></div>
      </div>
      
<script type="text/javascript">
	function updatePassword(){
		if(document.findform.password.value==""){
			alert("비밀번호를 입력해주세요.");
			document.findform.password.focus();
		} else if(document.findform.password.value != document.findform.confirmpwd.value){
			alert("비밀번호가 일치하지 않습니다.");
			document.findform.confirmpwd.focus();
		} else {
			document.findform.action="update-pw";
			document.findform.submit();
		}
	}
	
	$('#updatePw').on("click", function() {
		alert('비밀번호를 수정하였습니다.');
	});
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>	
</html>