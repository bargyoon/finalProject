<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<body>
	<div class="dataTables_paginate paging_simple_numbers float-right"
		id="zero_config_paginate">
		<ul class="pagination">
			<li class="paginate_button page-item previous disabled"
				id="zero_config_previous"><a aria-controls="zero_config"
				data-dt-idx="0" tabindex="0" class="page-link"
				onclick="prevBtn(${pageUtil.curPage})">Previous</a></li>
			<c:if test="${pageUtil.blockEnd eq 1}">
				<li class="paginate_button page-item active"><a href="#"
					aria-controls="zero_config" data-dt-idx="1" tabindex="0"
					class="page-link">1</a></li>
			</c:if>
			<c:if test="${pageUtil.blockEnd > 1}">
				<c:forEach var="i" begin="1" step="1" end="${pageUtil.blockEnd}">

					<li class="paginate_button page-item" data-page= ${i}><a href="#"
						aria-controls="zero_config" class="page-link" 
						onclick="changePage(${i})">${i}</a></li>
				</c:forEach>
			</c:if>


			<li class="paginate_button page-item next" id="zero_config_next"><a
				href="#" aria-controls="zero_config" class="page-link"
				onclick="nextBtn(${pageUtil.curPage},${pageUtil.blockEnd})">Next</a></li>
		</ul>
	</div>
</body>
</html>