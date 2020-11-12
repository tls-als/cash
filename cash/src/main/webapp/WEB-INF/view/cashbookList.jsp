<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>cashbookList</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<h1>cashbookList</h1>
	</div>
	<a href="/admin/cashbookListExcel">[전체 cashbookList를 엑셀파일로 다운]</a>
	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>cashbookId</th>
				<th>cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th>
				<th>cashbookContent</th>
				<th>cashbookDate</th>
				<th>createDate</th>
				<th>updateDate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${list}">
				<tr>
					<td>${c.cashbookId}</td>
					<td>${c.cashbookKind}</td>
					<td>${c.categoryName}</td>
					<td>${c.cashbookPrice}</td>
					<td>${c.cashbookContent}</td>
					<td>${c.cashbookDate}</td>
					<td>${c.createDate}</td>
					<td>${c.updateDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 네이게이션 -->
	<ul class="pagination justify-content-center">
		<!-- 현재 페이지가 1일 때 -->
		<c:if test="${currentPage == 1}">
			<li class="page-item disabled"><a class="page-link" href="/admin/cashbookList/1">처음으로</a></li>	
			<li class="page-item disabled"><a class="page-link" href="/admin/cashbookList/${currentPage-1}">이전</a></li>	
			<c:forEach var="i" begin="${navStartPage}" step="1" end="${navEndPage}">
				<c:choose>
					<c:when test="${currentPage == i}">
						<li class="page-item active"><a class="page-link" href="">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/cashbookList/${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="/admin/cashbookList/${currentPage+1}">다음</a></li>
			<li class="page-item"><a class="page-link" href="/admin/cashbookList/${lastPage}">마지막으로</a></li>
		</c:if>
		<!-- 현재 페이지가 1보다 크고 마지막페이지보다 작을 때 -->
		<c:if test="${currentPage > 1 && currentPage <lastPage}">
			<li class="page-item"><a class="page-link" href="/admin/cashbookList/1">처음으로</a></li>	 
			<li class="page-item"><a class="page-link" href="/admin/cashbookList/${currentPage-1}">이전</a></li>	 
			<c:forEach var="i" begin="${navStartPage}" step="1" end="${navEndPage}">
				<c:choose>
					<c:when test="${currentPage == i}">
						<li class="page-item active"><a class="page-link" href="">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/cashbookList/${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="/admin/cashbookList/${currentPage+1}">다음</a></li>
			<li class="page-item"><a class="page-link" href="/admin/cashbookList/${lastPage}">마지막으로</a></li>
		</c:if>
		<!-- 현재 페이지가 마지막페이지일때 -->
		<c:if test="${lastPage == currentPage}">
			<li class="page-item"><a class="page-link" href="/admin/cashbookList/1">처음으로</a></li>	
			<li class="page-item"><a class="page-link" href="/admin/cashbookList/${currentPage-1}">이전</a></li>	 
			<c:forEach var="i" begin="${navStartPage}" step="1" end="${navEndPage}">
				<c:choose>
					<c:when test="${currentPage == i}">
						<li class="page-item active"><a class="page-link" href="">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/cashbookList/${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item disabled"><a class="page-link" href="/admin/cashbookList/${currentPage+1}">다음</a></li>
			<li class="page-item disabled"><a class="page-link" href="/admin/cashbookList/${lastPage}">마지막으로</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>