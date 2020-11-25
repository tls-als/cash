<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
		<h1>addCashbook</h1><br>
		<form method="post" action="${pageContext.request.contextPath}/admin/addCashbook">
			<table class="table table-bordered table-striped">
				<tr>
					<td>cashbook_date</td>
					<td>
						<input type="text" class="form-control" name="cashbookDate" value="${currentYear}-${currentMonth}-${currentDay}" readonly="readonly">
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
	</div>
</div>
</body>
</html>