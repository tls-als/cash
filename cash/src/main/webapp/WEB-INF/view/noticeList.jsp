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
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
		<h1>공지사항 LIST</h1><br>
		<!-- 공지 추가하기 -->
		<div><a class="btn btn-outline-info" href="/admin/addNotice">공지 추가하기</a></div>
		<!-- 공지리스트 -->
		<table class="table table-bordered table-striped">
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
					<th><a class="btn btn-outline-primary" href="/admin/modifyNotice/${c.noticeId}">수정</a></th>
					<th><a class="btn btn-outline-danger" href="/admin/removeNotice/${c.noticeId}">삭제</a></th>
					<th><a class="btn btn-outline-dark" href="/admin/noticeOne/${c.noticeId}">상세보기</a></th>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 -->
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${currentPage == 1}">
					<li class="page-item disabled"><a class="page-link">이전</a></li>
					<c:forEach var="i" begin="1" end="5">
						<li class="page-item">
							<a class="page-link" href="/admin/noticeList/${i}">${i}</a>
						</li>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="/admin/noticeList/${currentPage+1}">다음</a></li>
				</c:when>
				<c:when test="${currentPage > 1 && currentPage != lastPage}">
					<li class="page-item"><a class="page-link" href="/admin/noticeList/${currentPage-1}">이전</a></li>
					<c:forEach var="i" begin="1" end="5">
						<li class="page-item">
							<a class="page-link" href="/admin/noticeList/${i}">
									${i}
							</a>
						</li>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="/admin/noticeList/${currentPage+1}">다음</a></li>
				</c:when>
				<c:when test="${currentPage == lastPage}">
					<li class="page-item"><a class="page-link" href="/admin/noticeList/${currentPage-1}">이전</a></li>
					<c:forEach var="i" begin="1" end="5">
						<li class="page-item">
							<a class="page-link" href="/admin/noticeList/${i}">
									${i}
							</a>
						</li>
					</c:forEach>
					<li class="page-item disabled"><a class="page-link">다음</a></li>
				</c:when>	
			</c:choose>
		</ul>
	</div>
</div>
</body>
</html>