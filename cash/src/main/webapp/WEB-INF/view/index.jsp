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
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- 공지사항 -->
	<div class="jumbotron">
		<h1>Home</h1>
	</div>
		<h5><span class="text-success">공지사항</span></h5>
		<div align="right"><a href="${pageContext.request.contextPath}/admin/noticeList/1" class="btn btn-outline-info btn-sm">more</a></div>
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
							<td>${n.noticeDate}</td>	<!-- n.getNoticeContent(). setter&getter는 점으로 호출 -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><br>
		<!-- 수입,지출 -->
		<h5><span class="text-success">최근 수입/지출 내역 요약</span></h5>
		<div>
			<table class="table table-bordered">
				<c:forEach var="io" items="${inOutList}">
					<tr align="center">
						<th colspan="2">${io["날짜"]}</th>
					</tr>
					<tr>
						<td>수입</td>
						<td>${io["수입"]}</td> <!-- io.get("날짜"). map은 대괄호로 호출 -->
					</tr>
					<tr>
						<td>지출</td>
						<td>${io["지출"]}</td>
					</tr>
					<tr>
						<td>합계</td>
						<td>${io["합계"]}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
</body>
</html>