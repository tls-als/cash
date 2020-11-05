<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>noticeList</title>
</head>
<body>
	<h1>noticeList 페이지</h1>
	<!-- 공지 추가하기 -->
	<div><a href="/admin/addNotice">추가하기</a></div>
	<!-- 공지리스트 -->
	<table border="1">
		<thead>
			<tr>
				<th>noticeId</th>
				<th>noticeTitle</th>
				<th>noticeDate</th>
				<th>수정</th>
				<th>삭제</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${noticeList}">
			<tr>
				<td>${c.noticeId}</td>
				<td>${c.noticeTitle}</td>
				<td>${c.noticeDate}</td>
				<th><a href="/admin/modifyNotice">수정</a></th>
				<th><a href="/admin/removeNotice">삭제</a></th>
				<th><a href="/admin/noticeOne?noticeId=${c.noticeId}">상세보기</a></th>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 -->
	<div>
		<c:choose>
			<c:when test="${currentPage == 1}">
				<a href="/admin/noticeList?currentPage=${currentPage+1}">다음</a>
			</c:when>
			<c:when test="${currentPage > 1 && currentPage != lastPage}">
				<a href="/admin/noticeList?currentPage=${currentPage-1}">이전</a>
				<a href="/admin/noticeList?currentPage=${currentPage+1}">다음</a>
			</c:when>
			<c:when test="${currentPage == lastPage}">
				<a href="/admin/noticeList?currentPage=${currentPage-1}">이전</a>
			</c:when>	
		</c:choose>
	</div>
</body>
</html>