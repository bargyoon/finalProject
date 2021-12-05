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
<body>
	<div class="orderList-wrapper">
		<div class="card-body">
		<div class="table-responsive mt-2 ">
			<table id="resTb" class="table table-striped table-bordered text-center">
			    <colgroup>
			        <col width="5%" />
			        <col width="8%" />
			        <col />
			        <col />
			        <col />
			    </colgroup>
				<thead>
				    <tr>
				        <th colspan="1"></th>
				        <th>주문번호</th>
				        <th>상품명</th>
				        <th>상품옵션</th>
				        <th>주문날짜</th>
				    </tr>
				</thead>
				<tbody>
				    <c:forEach var="orderList" items="${orderList}">
				        <tr>
				        	<td><input type="radio" id="orderIdx" name="chk_res" value="${orderList.ORDER_IDX}" /></td>
				        	<td>${orderList.ORDER_IDX}</td>
				        	<td>${orderList.NAME}</td>		         
				            <td>${orderList.PO_NAME}</td>
				            <td><fmt:formatDate value="${orderList.ORDER_DATE}" pattern="yyyy-MM-dd"/></td>
				            <c:if test="${orderList.length == 0}">
				        	  <td colspan="5">조회결과가 없습니다.</td>
				   		    </c:if>
				        </tr>
				    </c:forEach>
				</tbody>
			</table>
		</div>
		<input type="button" id="closeBtn" value="선택">
		</div>
	</div>

	<script type="text/javascript">
	
		
	 
		window.onload = function(event){
	       
	   		document.getElementById("closeBtn").onclick = function(){
	        	
	   			var orderIdx = $("input[name='chk_res']:checked").val();
	   			window.opener.document.getElementById("orderIdx").value = orderIdx;		        
		        window.close();
	   	 }
		}
	
	</script>
	
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
</body>

</html>