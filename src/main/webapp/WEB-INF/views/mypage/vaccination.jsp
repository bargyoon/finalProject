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
<link href="/resources/css/mypage/vaccination.css" rel="stylesheet">
<!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<!-- bootStrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- fullCalendar -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>
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
		      <li><a href="/mypage/vaccination" class="nav-link">일정표</a></li>
		    </ul>
		</nav>
		
		<div style="margin: 0 auto; width: 800px;">
			
			<div class="modal">
				<form action="/mypage/vaccination" method="post" style="margin: auto auto;">
					<div class="mb-3">
						<label class="form-label">등록할 펫 선택:</label>
						<select class="form-select" name="petIdx" required="required">
							<!-- foreach문 -->
							<option value="" selected="selected">--Please choose an option--</option>
							<c:forEach var="pet" items="${petList}">
								<option value="${pet.petIdx}">${pet.petName}/${pet.species}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="mb-3">
						<label class="form-label">예방접종항목 선택:</label>
						<select class="form-select" name="viIdx" required="required">
							<!-- foreach문 -->
							<option value="">--Please choose an option--</option>
							<c:forEach var="vaccineInfo" items="${vaccineInfoList}">
								<option value="${vaccineInfo.viIdx}">${vaccineInfo.viName}/${vaccineInfo.species}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="mb-3">
						<label class="form-label">마지막 접종일 선택:</label><br>
						<input type="date" name="criterionDate" required="required">
					</div>
					
					<hr class="my-3">
					
					<div style="display: flex;">
						<button class="w-50 btn btn-primary" type="submit">등록</button>
						<button class="w-50 btn btn-primary" type="button" onclick="close_modal()">취소</button>
					</div>
					
				</form>
			</div>
			
			<div id="calendar" class="calendar" style="background-color: white; border: ridge 20px;"></div>
			
			<!-- fullCalendar -->
			<script type="text/javascript">
			function close_modal(){
				document.querySelector('.modal').style.display= 'none';
			}
			
			document.addEventListener('DOMContentLoaded', function() {
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView: 'dayGridMonth',
					headerToolbar: {
						left: 'title',
						center: 'addEventButton',
						right: 'prev next today'
					},
					locale: 'ko',
					dayMaxEvents: true,
					views: {
						dayGrid: {
							dayMaxEvents: 2
						}
					},
					customButtons: {
						addEventButton: {
							text: "예방접종일정 추가",
							click: ()=>{
								document.querySelector('.modal').style.display= 'flex';
							}
						}
					},
					events: [
						<c:forEach var="vaccination" items="${vaccinationList}" varStatus="status">
							{
								title: "${vaccination.PET_NAME}-${vaccination.VI_NAME}",
								start: "${vaccination.NEXT_DATE}",
								allDay: true
							}
							<c:if test="${!status.last}">, </c:if>
						</c:forEach>
					]
					
				});
				calendar.render();
			});
			</script>
			
		</div>
	</div>
</section>

<aside class="fixed-up-btn btn badge-rank" id="up_btn" type="button" onclick="window.scrollTo(0,0)" style="float: right;">
    <i class="fas fa-arrow-alt-circle-up"></i>
</aside>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<%@ include file="/WEB-INF/views/include/mainJs.jsp"%>

</body>
</html>