<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>addNotice</title>
</head>
<body>
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
			$('#fileuploadFrom').submit();
		}
	});
});
</script>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="margin-top: 50px" align="center">
		<h1>공지사항 입력</h1>
		<form action="${pageContext.request.contextPath}/admin/addNotice" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<td>공지 제목</td>
					<td>
						<input class="form-control" id="title" type="text" name="noticeTitle">
					</td>
				</tr>
				<tr>
					<td>공지 내용</td>
					<td>
						<input class="form-control" id="content" type="text" name="noticeContent">
					</td>
				</tr>
				<tr>
				<td>board_file</td>
				<td>
					<div>
						<button class="btn btn-info" type="button" id="addBtn">파일추가</button>
						<button class="btn btn-danger" type="button" id="delBtn">파일삭제</button>
					</div>
					<br>
					<div id="fileinput">
					</div>
				</td>
			</tr>
			</table>
			<button class="btn btn-primary" type="submit" id="submitBtn">등록하기</button>
		</form>
	</div>
</div>
</body>
</html>