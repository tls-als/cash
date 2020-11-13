<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>chart1</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<h1>1년간 수입/지출 총계</h1>
	</div>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<!-- 연도를 입력받는 부분 -->
	<div class="input-group justify-content-end" style="margin-top: 20px">
		<input class="form-control col-lg-2" type="text" id="year" placeholder="연도 검색">
		<div class="input-group-append">
			<button class="btn btn-dark" id="chartSearch">검색</button>
		</div>
	</div>
	<!-- chart -->
	<div>
		<canvas id="chart1"></canvas>
	</div>
	<!-- table -->
	<div>
	</div>
</body>
</div>
<script>
	// 1년간 수입/지출을 나타내는 바(bar) 그래프
	$('#chartSearch').click(function() {
		$.ajax({	// 비동기 요청
			url:'/admin/chart1',
			type:'get',
			data:{year:$('#year').val()},
			success:function(data) {
			// data(json문자열) -> 데이터셋(chart.js..) -> chart
				var ctx = $('#chart1');
				var chart = new Chart(ctx, {
					type: 'pie',
				    data: {
				        labels: ['수입', '지출'],
				        datasets: [{
				            label: '월별 지출 통계',
				            backgroundColor: ['rgb(103, 153, 255)', 'rgb(250, 244, 192)'],
				            borderColor: ['rgb(0, 0, 145)', 'rgb(204, 114, 61)'],
				            data: [data.income, data.outlay]
				        }]
				    },
				    options: {}
				});
			}
		});
	});

</script>
</html>