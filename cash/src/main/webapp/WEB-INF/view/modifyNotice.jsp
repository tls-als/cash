<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>modifyNotice</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
	<h1>공지사항 수정</h1><br>
	<form method="post" action="/admin/modifyNotice">
		<table class="table table-bordered table-striped">
		<c:forEach var="c" items="${noticeList}">
			<tr>
				<td>noticeId</td>
				<td>
					<input class="form-control" type="text" name="noticeId" readonly="readonly" value="${c.noticeId}">
				</td>
			</tr>
			<tr>
				<td>noticeTitle</td>
				<td>
					<input class="form-control" type="text" name="noticeTitle" value="${c.noticeTitle}">
				</td>
			</tr>
			<tr>
				<td>noticeContent</td>
				<td>
					<textarea class="form-control" rows="5" cols="80" name="noticeContent">${c.noticeContent}</textarea>
				</td>
			</tr>
			<tr>
				<td>noticeDate</td>
				<td>
					<input class="form-control" type="text" name="noticeDate" readonly="readonly" value="${c.noticeDate}">
				</td>
			</tr>
		</c:forEach>
		</table>
		<button class="btn btn-primary" type="submit">수정하기</button>
	</form>
	</div>
</div>
</body>
</html>