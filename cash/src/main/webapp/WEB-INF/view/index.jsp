<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>index</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>index</h1>
	<!-- 공지사항 -->
	<div><a href="/admin/noticeList">more</a></div>
	<div>
		<table border="1">
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
						<td>${n.noticeDate}</td>	<!-- n.getNoticeContent(). setter&getter는 점으로 호출 -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><br>
	<!-- 수입,지출 -->
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>날짜</th>
					<th>수입</th>
					<th>지출</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="io" items="${inOutList}">
					<tr>
						<td>${io["날짜"]}</td>	<!-- io.get("날짜"). map은 대괄호로 호출 -->
						<td>${io["수입"]}</td>
						<td>${io["지출"]}</td>
						<td>${io["합계"]}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>