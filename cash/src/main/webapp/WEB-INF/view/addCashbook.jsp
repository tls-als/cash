<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>addCashbook</h1>
	<form method="post" action="/addCashbook">
		<table class="table table-bordered table-striped">
			<tr>
				<td>cashbook_date</td>
				<td>
					<input type="text" class="form-control" name="cashbookDate" value="${param.currentYear}-${param.currentMonth}-${param.currentDay}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>cashbook_kind</td>
				<td>
					<div class="form-check">
						<input type="radio" class="form-check-input" name="cashbookKind" value="수입">수입
					</div>
					<div class="form-check">
						<input type="radio" class="form-check-input" name="cashbookKind" value="지출">지출
					</div>
					
				</td>
			</tr>
			<tr>
				<td>cashbook_name</td>
				<td>
					<select class="form-control" name="categoryName">
						<c:forEach var="c" items="${categoryList}">
							<option value="${c.categoryName}">${c.categoryName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>cashbook_price</td>
				<td>
					<input type="text" class="form-control" name="cashbookPrice">
				</td>
			</tr>
			<tr>
				<td>cashbook_content</td>
				<td>
					<input type="text" class="form-control" name="cashbookContent">
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-success">저장하기</button>
	</form>
</body>
</html>