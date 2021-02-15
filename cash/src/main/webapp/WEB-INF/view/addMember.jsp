<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('#id').focus();
		$('#id').blur(function() {
			// 비동기요청으로 #id값을 서버에 보내고 #id값이 중복인지 아닌지 체크
			if($('#id').val() == '') {
				$('#id').focus();
				return;
			}
			$.ajax({	// 비동기 요청을 처리하는 rest 패키지
				url:'${pageContext.request.contextPath}/admin/idCheck',	// 퍼머링크(독립된 url)는 사용자 편리를 위해 만드는 것이고 비동기요청은 퍼머링크 필요없음
				type:'post',
				data:{id:$('#id').val()},
				success:function(data) {	// data는 yes 또는 no가 넘어옴. yes이면 사용가능한 ID, no이면 사용불가 ID
					if(data == 'yes') {
						$('#msgId').text('');
						$('#pw').focus();
					}else {
						$('#msgId').text($('#id').val() + '는 사용중인 아이디입니다.');
						$('#id').select();
						$('#id').focus();
					}
				}
			});
		});
		$('#addMember').click(function() {
			if($('#pw').val() == '') {
				$('#msgPw').text('비밀번호를 입력하세요');
				$('#pw').focus();
				return;
			}
			$('#formLogin').submit();
		});
		console.log();
	});
</script>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>addMember</h1>
	<form method="post" action="${pageContext.request.contextPath}/admin/addMember" id="formLogin">
		<table class="table table-bordered">
			<tr>
				<td>ID</td>
				<td>
					<input class="form-control" type="text" id="id" name="id">
					<div id="msgId"></div>
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
					<input class="form-control" type="password" id="pw" name="pw">
					<div id="msgPw"></div>
				</td>
			</tr>
		</table>
		<div><button class="btn btn-primary" type="button" id="addMember">회원추가</button></div>	<!-- 이슈: 버튼 JS수정하기 -->
	</form>
</div>
</body>
</html>