<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>chart5</title>
</head>
<body>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩 js 사용 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 차트 사용 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>chart1</h1>
	<!-- chart -->
	<div>
		<canvas id="chart1"></canvas>
	</div>
	<!-- table -->
	<div>
	</div>
</body>
<script>
	$.ajax({
			url:'',
			type:'',
			data:{},
			success:function(data) {
				/*
					data(json문자열) -> 데이터셋(chart.js..) -> chart
				*/
			}
		});
</script>
</html>