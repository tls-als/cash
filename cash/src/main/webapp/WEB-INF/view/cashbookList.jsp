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
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<h1>cashbookList</h1>
	</div>
	<a href="${pageContext.request.contextPath}/admin/cashbookListExcel">[전체 cashbookList를 엑셀파일로 다운]</a>
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
			<c:if test="${lastPage == 0}">
				<tr>
					<td colspan="8">조회된 내용이 없습니다.</td>
				</tr>
			</c:if>
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
		<!-- 조회되는 리스트가 없을 때 -->
		<c:if test="${lastPage == 0}">
			<li class="page-item disabled"><a class="page-link" href="">처음으로</a></li>	
			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>	
			<li class="page-item active"><a class="page-link" href="">1</a></li>
			<li class="page-item disabled"><a class="page-link" href="">다음</a></li>
			<li class="page-item disabled"><a class="page-link" href="">마지막으로</a></li>
		</c:if>
		<!-- 현재 페이지가 1일 때 -->
		<c:if test="${currentPage == 1 && lastPage > 1}">
			<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">처음으로</a></li>	
			<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}">이전</a></li>	
			<c:forEach var="i" begin="${navStartPage}" step="1" end="${navEndPage}">
				<c:choose>
					<c:when test="${currentPage == i}">
						<li class="page-item active"><a class="page-link" href="">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}">다음</a></li>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${lastPage}">마지막으로</a></li>
		</c:if>
		<!-- 라스트페이지가 엔드페이징보다 작을 때 -->
		<c:if test="${lastPage != 0 && lastPage < navEndPage && currentPage != lastPage}">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">처음으로</a></li>	 
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}">이전</a></li>	 
			<c:forEach var="i" begin="${navStartPage}" step="1" end="${lastPage}">
				<c:choose>
					<c:when test="${currentPage == i}">
						<li class="page-item active"><a class="page-link" href="">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}">다음</a></li>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${lastPage}">마지막으로</a></li>
		</c:if>
		<!-- 라스트페이지가 엔드페이징보다 클 때 -->
		<c:if test="${lastPage > navEndPage && currentPage != 1}">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">처음으로</a></li>	 
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}">이전</a></li>	 
			<c:forEach var="i" begin="${navStartPage}" step="1" end="${navEndPage}">
				<c:choose>
					<c:when test="${currentPage == i}">
						<li class="page-item active"><a class="page-link" href="">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}">다음</a></li>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${lastPage}">마지막으로</a></li>
		</c:if>
		<!-- 현재 페이지가 마지막페이지일때 -->
		<c:if test="${lastPage == currentPage}">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">처음으로</a></li>	
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}">이전</a></li>	 
			<c:forEach var="i" begin="${navStartPage}" end="${lastPage}">
				<c:choose>
					<c:when test="${currentPage == i}">
						<li class="page-item active"><a class="page-link" href="">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}">다음</a></li>
			<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${lastPage}">마지막으로</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>