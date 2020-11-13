<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>addNotice</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
		<h1>공지사항 입력</h1>
		<form action="${pageContext.request.contextPath}/admin/addNotice" method="post">
			<table class="table table-bordered">
				<tr>
					<td>공지 제목</td>
					<td>
						<input class="form-control" type="text" name="noticeTitle">
					</td>
				</tr>
				<tr>
					<td>공지 내용</td>
					<td>
						<input class="form-control" type="text" name="noticeContent">
					</td>
				</tr>
			</table>
			<button class="btn btn-primary" type="submit">등록하기</button>
		</form>
	</div>
</div>
</body>
</html>