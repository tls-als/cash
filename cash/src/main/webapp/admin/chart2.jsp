<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>chart1</title>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<h1>chart2</h1>
	</div>
	<!-- chart -->
	<div>
		<canvas id="chart1"></canvas>
	</div>
	<!-- table -->
	<div>
	</div>
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