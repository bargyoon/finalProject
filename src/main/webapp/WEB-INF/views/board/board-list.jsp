<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/board/board-list.css">
        </head>
        <body>
            <div class="board_list_wrap">
                <table class="board_list">
                    <caption>게시판 목록</caption>
                    <div class="paging">
                        <a href="/board/info" class="bt">정보게시판</a>
                        <a href="/board/dog" class="bt">강아지</a>
                        <a href="/board/cat" class="bt">고양이</a>
                        <a href="/board/review" class="bt">후기</a>
                        <a href="/board/meet" class="bt">모임게시판</a>
                        <a href="/board/consulting" class="bt">상담게시판</a>
                    </div>
                    <br>
                    <br>

                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>작성일</th>
                            <th>추천수</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${bList}" var="bList" varStatus="status">
                        <tr>
                            <td>${length - status.index}</td>
                            <td class="tit">
                                <a href="#">${bList.BD_TITLE}</a>
                            </td>
                            <td>${bList.NICKNAME}</td>
                            <td><fmt:formatDate value="${bList.REG_DATE}" pattern="yyyy-MM-dd"/></td>
                            <td>${bList.REC_COUNT}</td>
                            <td>${bList.VIEW_COUNT}</td>
                        </tr>
                        </c:forEach>
                        
                    </tbody>
                </table>
                <br>
                <div style="float: right;" class="btn">
                <a onclick="javascript:location.href=location.pathname+'/form'">글쓰기</a>
                </div>
                <br>
                <div class="paging">
                    <a href="#" class="bt">첫 페이지</a>
                    <a href="#" class="bt">이전 페이지</a>
                    <a href="#" class="num on">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="bt">다음 페이지</a>
                    <a href="#" class="bt">마지막 페이지</a>
                </div>
                <br>
                <div class="seach">
                    
                    <select name="job">
                        <option value="">작성자</option>
                        <option value="학생">아이디</option>
                        <option value="회사원">닉네임</option>
                        <option value="기타">글 제목</option>
                    </select>
                    <td><input type="text" class="inp"></td>
                <button>조회하기</button>
           
            </td>    
            </div>


            </div>
        </body>
</html>