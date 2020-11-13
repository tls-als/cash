<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>cashbookByDay.jsp</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
		<h1>cashbookByDay</h1><br>
		<div>
			<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}">이전</a>
				 <span class="text-success">${currentYear}년 ${currentMonth}월 ${currentDay}일</span>
			<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}">다음</a>
		</div><br>
		<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">수입/지출 입력</a>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>cashbookId</th>
					<th>cashbookKind</th>
					<th>categoryName</th>
					<th>cashbookPrice</th>
					<th>cashbookContent</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${cashbookList != null}">
					<c:forEach var="c" items="${cashbookList}">
						<tr>
							<td>${c.cashbookId}</td>
							<td>${c.cashbookKind}</td>
							<td>${c.categoryName}</td>
							<td>${c.cashbookPrice}</td>
							<td>${c.cashbookContent}</td>
							<td><a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/modifyCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">수정</a></td>
							<td><a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/admin/deleteCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">삭제</a></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty cashbookList}">
					<tr>
						<td colspan="7" align="center" height="50">데이터가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>