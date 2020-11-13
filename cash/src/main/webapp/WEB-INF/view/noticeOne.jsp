<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>noticeOne</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
		<h1>공지 상세보기 페이지</h1><br>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>noticeId</th>
					<th>noticeTitle</th>
					<th>noticeContent</th>
					<th>noticeDate</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${list}">
					<tr>
						<td>${c.noticeId}</td>
						<td>${c.noticeTitle}</td>
						<td>${c.noticeContent}</td>
						<td>${c.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/noticeList">뒤로가기</a>
	</div>
</div>
</body>
</html>