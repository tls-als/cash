<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>addNotice</title>
</head>
<body>
	<h1>공지사항 입력</h1>
	<form action="/admin/addNotice" method="post">
		<table>
			<tr>
				<td>noticeTitle</td>
				<td>
					<input type="text" name="noticeTitle">
				</td>
			</tr>
			<tr>
				<td>noticeContent</td>
				<td>
					<input type="text" name="noticeContent">
				</td>
			</tr>
		</table>
		<button type="submit">등록하기</button>
	</form>
</body>
</html>