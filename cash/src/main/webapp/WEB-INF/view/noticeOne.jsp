<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>noticeOne</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
		<h1>공지 상세보기 페이지</h1><br>
<<<<<<< HEAD
		<h3>[ 공지내용 ]</h3>
		<table class="table table-bordered table-striped">
			<tr>
				<td>noticeId</td>
				<td>${notice.noticeId}</td>
			</tr>
			<tr>
				<td>noticeTitle</td>
				<td>${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td>noticeContent</td>
				<td>
					${notice.noticeContent}
				</td>
			</tr>
			<tr>
				<td>noticeDate</td>
				<td>${notice.noticeDate}</td>
			</tr>
		</table>
		<br>
		<h3>[ 첨부파일 ]</h3>
		<table class="table table-bordered table-striped">
			<c:forEach var="nf" items="${notice.fileList}">
				<c:if test="${nf.noticefileName != ''}">
				<tr>
					<td>파일명</td>
					<td>
						<a href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName}</a>
					</td>
				</tr>
				<tr>
					<td>파일타입</td>
					<td>${nf.noticefileType}</td>
				</tr>
				<tr>
					<td>파일크기</td>
					<td>${nf.noticefileSize} 바이트</td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
		<hr>
		<div align="left">	
		<h3>댓글</h3>
		<!-- 댓글 내용 입력 테이블 -->
			<div class="form-group">
			  <label for="comment">댓글 입력</label>
			  <form action="${pageContext.request.contextPath}/admin/addComment" method="post">
				<table>
					<tr>
						<td>
							<input type="hidden" id="noticeId" name="noticeId" value="${notice.noticeId}">
							<textarea class="form-control" rows="3" cols="80" id="commentContent" name="commentContent"></textarea><br>
						</td>
						<td>
							<button class="btn btn-primary" type="submit" id="submitBtn">등록</button>
						</td>
					</tr>
				</table> 
			  </form>
			</div>
		</div>
		<!-- 댓글 내용 출력 테이블 -->
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>삭제하기</th>
			</tr>
			<c:forEach var="c" items="${comment}">
				<tr>
					<td>${c.commentId}</td>
					<td>${c.commentContent}</td>
					<td>
						<a href="${pageContext.request.contextPath}/admin/deleteComment?noticeId=${noticeId}&commentId=${c.commentId}" style="color: red">댓글삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<div align="right">
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/noticeList/1">뒤로가기</a>
		</div>
=======
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>noticeId</th>
					<th>noticeTitle</th>
					<th>noticeContent</th>
					<th>noticeDate</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${list}">
					<tr>
						<td>${c.noticeId}</td>
						<td>${c.noticeTitle}</td>
						<td>${c.noticeContent}</td>
						<td>${c.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/noticeList">뒤로가기</a>
>>>>>>> refs/remotes/origin/master
	</div>
</div>
</body>
</html>