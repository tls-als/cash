<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>index</title>
<style type="text/css">
	.sunday{color : #FF0000;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>cashbookList</h1>
	<!-- 이달 수입&합계 출력 -->
	<div>
		이번달 수입 합계 : ${sumIn}
	</div>
	<div>
		이번달 지출 합계 : ${sumOut}
	</div>
	<h3>
	<!-- 
		다이어리 캘린더
		1. 이전달 클릭시 request에 현재 연도와 (이번달-1)
		2. currentYear: 현재 연도, currentMonth: 현재 달
	 -->
		<a href="/admin/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth-1}">[이전달]</a> 
		${currentYear}년 ${currentMonth}월
		<a href="/admin/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth+1}">[다음달]</a>
	</h3>
	<div>
		<table class="table table-bordered table-dark">
			<thead>
				<tr height="50">
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<!-- lastDay+(firstDayOfWeek-1): 첫 주의 시작하는 요일을 기준으로 따라 반복되면 앞에 추가되는 공백의 크기만큼 뒤에 출력이 안되기에 설정 -->
				<!-- lastDay는 11월 기준으로 숫자 30이 들어오고 end에서 30+공백수까지 반복 -> 7일을 채움. -->
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<!-- (firstDayOfWeek-1): 앞에 채워지는 공백 -->
						<c:if test="${i-(firstDayOfWeek-1) < 1}">
							<td width="100">&nbsp;</td>
						</c:if>
					 	<c:if test="${i-(firstDayOfWeek-1) > 0}">
					 		<td width="100">
						 		<div><!-- 날짜 -->
						 			<a href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i-(firstDayOfWeek-1)}">${i-(firstDayOfWeek-1)}</a>
						 		</div>
						 		<!-- 지출,수입 목록이 있는 날짜를 cashList에서 검색 -->
						 		<c:forEach var="c" items="${cashList}">
						 			<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
						 				<c:if test="${c.cashbookKind == '수입'}">
						 					<div>수입 : ${c.cashbookPrice}</div>
						 				</c:if>
						 				<c:if test="${c.cashbookKind == '지출'}">
						 					<div>지출 : ${c.cashbookPrice}</div>
						 				</c:if>
						 			</c:if>
						 		</c:forEach>
					 		</td>
						</c:if>
						<c:if test="${i%7==0}">	<!-- 토요일이면 tr 변경 -->
							</tr><tr>
						</c:if>
					</c:forEach>
					<!-- 마지막날 후에 공백 추가하는 작업. 7로 나누어 지지 않을시 추가 -->
					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
						<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td width="50">&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>