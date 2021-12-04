<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/member/memberCommon.css">

</head>
<body>
	<div class="sidenav">
         <div class="login-main-text">
            <h2>똑dog한<br>집사님, 어서오세요!</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
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
                  <input class="btn btn-black" type="submit" id="search-pw-bnt"value="비밀번호 찾기" /><br><br>
               </form>
            </div>
         </div>
         <div class="empty"></div>
      </div>
      
<script>
	$('#search-pw-bnt').on("click", function() {
		alert('메일을 발송하였습니다.');
	});
</script>      
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>	
</html>