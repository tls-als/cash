<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>modifyCashbook</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
	<h1>modifyCashbook 수정폼</h1><br>
	<div>
		<h5><span class="text-primary">[${currentYear}년 ${currentMonth}월 ${currentDay}일]</span></h5>
	</div>
	<form action="/admin/modifyCashbook/${currentYear}/${currentMonth}/${currentDay}" method="post">
		<table class="table table-bordered table-striped">
			<c:forEach var="c" items="${cashbookList}">
				<tr>
					<td>cashbookId</td>
					<td>
						<input class="form-control" type="text" name="cashbookId" value="${c.cashbookId}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>cashbookKind</td>
					<td>
						<input class="form-control" type="text" name="cashbookKind" value="${c.cashbookKind}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>categoryName</td>
					<td>
						<input class="form-control" type="text" name="categoryName" value="${c.categoryName}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>cashbookPrice</td>
					<td>
						<input class="form-control" type="text" name="cashbookPrice" value="${c.cashbookPrice}">
					</td>
				</tr>
				<tr>
					<td>cashbookContent</td>
					<td>
						<input class="form-control" type="text" name="cashbookContent" value="${c.cashbookContent}">
					</td>
				</tr>
				<tr>
					<td>cashbookDate</td>
					<td>
						<input class="form-control" type="date" name="cashbookDate" value="${c.cashbookDate}">
					</td>
				</tr>
				<tr>
					<td>createDate</td>
					<td>
						<input class="form-control" type="text" name="createDate" value="${c.createDate}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>updateDate</td>
					<td>
						<input class="form-control" type="text" name="updateDate" value="${c.updateDate}" readonly="readonly">
					</td>
				</tr>
			</c:forEach>
		</table>
		<button type="submit"  class="btn btn-success">수정하기</button>
	</form>
</div>
</body>
</html>