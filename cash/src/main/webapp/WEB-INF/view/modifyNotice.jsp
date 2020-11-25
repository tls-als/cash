<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>modifyNotice</title>
<<<<<<< HEAD
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#addBtn').click(function(){
		let html = '<div><input type="file" name="noticefile" class="noticefile"></div>';
		$('#fileinput').append(html);
	});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	});

	$('#submitBtn').click(function(){
		let ck = true;
		$('.noticefile').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		});
		if(ck == false) { // if(ck)
			alert('선택하지 않은 파일이 있습니다');	
			return false;	// 오류시 false 반환 없으면 제출됨
		}else if(ck == true) {
			$('#modifyForm').submit();
		}
	});
});
</script>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
	<h1>공지사항 수정</h1><br>
	<form method="post" action="${pageContext.request.contextPath}/admin/modifyNotice" enctype="multipart/form-data" id="modifyForm">
		<table class="table table-bordered table-striped">
			<tr>
				<td>noticeId</td>
				<td>
					<input class="form-control" type="text" name="noticeId" readonly="readonly" value="${notice.noticeId}">
				</td>
			</tr>
			<tr>
				<td>noticeTitle</td>
				<td>
					<input class="form-control" type="text" name="noticeTitle" value="${notice.noticeTitle}">
				</td>
			</tr>
			<tr>
				<td>noticeContent</td>
				<td>
					<textarea class="form-control" rows="5" cols="80" name="noticeContent">${notice.noticeContent}</textarea>
				</td>
			</tr>
			<tr>
				<td>noticeDate</td>
				<td>
					<input class="form-control" type="text" name="noticeDate" readonly="readonly" value="${notice.noticeDate}">
				</td>
			</tr>
			<c:forEach var="nf" items="${notice.fileList}">
				<c:if test="${nf.noticefileName != ''}">
					<tr>
						<td>noticefileName</td>
						<td>
							<input class="form-control" type="text" readonly="readonly" value="${nf.noticefileName}">
							<div><a href="${pageContext.request.contextPath}/admin/deleteFile?noticeId=${notice.noticeId}&noticefileId=${nf.noticefileId}">기존파일삭제</a></div>
						</td>
					</tr>
				</c:if>
			</c:forEach>
				<tr>
					<td colspan="2">
						<div id="fileinput"></div>
						<div align="right">
							<button type="button" class="btn btn-light" id="addBtn">파일추가</button>
							<button type="button" class="btn btn-light" id="delBtn">추가삭제</button>
						</div>
					</td>
				</tr>
		</table>
		<button class="btn btn-primary" type="submit" id="submitBtn">수정하기</button>
=======
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
	<h1>공지사항 수정</h1><br>
	<form method="post" action="${pageContext.request.contextPath}/admin/modifyNotice">
		<table class="table table-bordered table-striped">
		<c:forEach var="c" items="${noticeList}">
			<tr>
				<td>noticeId</td>
				<td>
					<input class="form-control" type="text" name="noticeId" readonly="readonly" value="${c.noticeId}">
				</td>
			</tr>
			<tr>
				<td>noticeTitle</td>
				<td>
					<input class="form-control" type="text" name="noticeTitle" value="${c.noticeTitle}">
				</td>
			</tr>
			<tr>
				<td>noticeContent</td>
				<td>
					<textarea class="form-control" rows="5" cols="80" name="noticeContent">${c.noticeContent}</textarea>
				</td>
			</tr>
			<tr>
				<td>noticeDate</td>
				<td>
					<input class="form-control" type="text" name="noticeDate" readonly="readonly" value="${c.noticeDate}">
				</td>
			</tr>
		</c:forEach>
		</table>
		<button class="btn btn-primary" type="submit">수정하기</button>
>>>>>>> refs/remotes/origin/master
	</form>
	</div>
</div>
</body>
</html>