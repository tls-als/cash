<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>login</title>
</head>
<body>	
<div class="container">
	<div style="margin-top: 50px" align="center">
		<h1>로그인</h1>
		<form action="/login" method="post">
			<table>
				<tr>
					<td>ID</td>
					<td>
						<input class="form-control col-sm-10" type="text" name="id">
					</td>
				</tr>
				<tr>
					<td>PW</td>
					<td>
						<input class="form-control col-sm-10" type="password" name="pw">
					</td>
				</tr>
			</table><br>
			<div>
				<button class="btn btn-success" type="submit">로그인</button>
			</div>
		</form><br>		
		<h1>공지사항</h1>
		<div>
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>notice_id</th>
						<th>notice_title</th>
						<th>notice_date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${noticeList}">
						<tr>
							<td>${n.noticeId}</td>
							<td>${n.noticeTitle}</td>
							<td>${n.noticeDate}</td>	 <!-- n.getNoticeContent(). setter&getter는 점으로 호출 -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>	 
	</div>
</div>
</body>
</html>