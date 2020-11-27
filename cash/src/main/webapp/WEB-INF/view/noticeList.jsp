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
	<div class="jumbotron">
		<h1>공지사항 LIST</h1>
	</div>
		<!-- 공지 추가하기 -->
		<div><a class="btn btn-outline-info" href="${pageContext.request.contextPath}/admin/addNotice">공지 추가하기</a></div>
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
					<th><a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/modifyNotice/${c.noticeId}">수정</a></th>
					<th><a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/admin/removeNotice/${c.noticeId}">삭제</a></th>
					<th><a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin/noticeOne/${c.noticeId}">상세보기</a></th>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 네비게이션 작성-->
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${lastPage > 1 && currentPage == 1}">
					<!-- 현재 페이지가 1 / 1페이지 이상일 때 네비게이션 출력 -->
					<li class="page-item disabled"><a class="page-link">처음으로</a></li>
					<li class="page-item disabled"><a class="page-link">이전</a></li>
					<c:if test="${navEndPage > lastPage}">
						<c:forEach var="i" begin="${navStartPage}" end="${lastPage}">
							<c:choose>
								<c:when test="${currentPage == i}">
									<li class="page-item active"><a class="page-link" href="">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
					<!-- 네비게이션 엔드페이지보다 마지막페이지가 크면 네비게이션 인덱스 10까지 출력 -->
					<c:if test="${navEndPage < lastPage}">
						<c:forEach var="i" begin="${navStartPage}" end="${navEndPage}">
							<c:choose>
								<c:when test="${currentPage == i}">
									<li class="page-item active"><a class="page-link" href="">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}">다음</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}">마지막으로</a></li>
				</c:when>
				<c:when test="${lastPage < navEndPage && currentPage != lastPage}">
					<!-- 네비게이션 엔드페이지보다 마지막페이지가 작을때 네이게이션 인덱스 마지막페이지까지, 현재 페이지가 마지막 페이지가 아닐 때 -->
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/1">처음으로</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}">이전</a></li>
					<c:forEach var="i" begin="${navStartPage}" end="${lastPage}">
						<c:choose>
							<c:when test="${currentPage == i}">
								<li class="page-item active"><a class="page-link" href="">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}">다음</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}">마지막으로</a></li>
				</c:when>
				<c:when test="${lastPage > navEndPage && currentPage != lastPage}">
					<!-- 마지막페이지가 네비게이션 엔드페이지보다 클때 네비게이션 10까지 출력, 현재 페이지가 라스트페이지가 아닐때 -->
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/1">처음으로</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}">이전</a></li>
					<c:forEach var="i" begin="${navStartPage}" end="${navEndPage}">
						<c:choose>
							<c:when test="${currentPage == i}">
								<li class="page-item active"><a class="page-link" href="">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}">다음</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}">마지막으로</a></li>
				</c:when>
				<c:when test="${lastPage > 1 && currentPage == lastPage}">
					<!-- 마지막페이지가 1페이지보다 크고 현재페이지가 마지막 페이지일때 -->
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/1">처음으로</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}">이전</a></li>
					<c:forEach var="i" begin="${navStartPage}" end="${lastPage}">
						<c:choose>
							<c:when test="${currentPage == i}">
								<li class="page-item active"><a class="page-link" href="">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item disabled"><a class="page-link">다음</a></li>
					<li class="page-item disabled"><a class="page-link">마지막으로</a></li>
				</c:when>	
			</c:choose>
		</ul>
	</div>
</body>
</html>