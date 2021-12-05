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
               <form action="/member/login" method="post">               
               	  <div id=page-logo><img src="/resources/assets/img/dog-and-cat-yellow.png" alt="..." /></div><br><hr>
                  <div class="form-group">
                     <span>아이디</span>
                     <input type="text" class="form-control" placeholder="ID" name="userId">
                  </div>
                  <div class="form-group">
                     <span>비밀번호</span>
                     <input type="password" class="form-control" placeholder="Password" name="password">
                  </div>
                  <c:if test="${not empty message}">
					<span class='valid-msg' >${message}</span>
				  </c:if><br>
                  <button class="btn btn-secondary">로그인</button>
                  <a class="btn btn-secondary"  href='/member/join'>회원가입</a><br><br>
                  <a href='/member/search-id' style="color: gray">아이디 찾기  |  </a>
                  <a href='/member/search-pw' style="color: gray">비밀번호 찾기</a><br><hr>
                  <a href="javascript:kakaoLogin()"><img src="/resources/img/kakao_login.png" width="100%"></a>
               </form>
            </div>
         </div>
         <div class="empty"></div>
      </div>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="/resources/js/member/kakaoLogin.js"></script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>	
</html>