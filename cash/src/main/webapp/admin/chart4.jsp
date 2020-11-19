<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>chart1</title>
</head>
<body>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩 js 사용 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 차트 사용 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="jumbotron">
		<h1>월별 평균 수입 통계</h1>
	</div>
	<!-- 입력받는 부분 -->
	<div class="input-group justify-content-center" style="margin-top: 20px; margin-bottom: 50px">
		<input class="form-control col-lg-3" type="text" id="year" placeholder="연도를 검색하세요">
		<div class="input-group-append">
			<button class="btn btn-dark" id="chartSearch">검색</button>
		</div>
	</div>	
	<!-- chart 출력하는 부분 -->
	<div>
		<canvas id="chart4"></canvas>
	</div>
	<!-- table 출력하는 부분 -->
	<div>
	</div>
</div>
</body>
<script>
	var myChart;
	$('#chartSearch').click(function() {
		$.ajax({
			url:'/admin/chart4',
			type:'get',
			data:{year:$('#year').val()},
			success:function(data) {
				if(myChart) {
					myChart.destroy();
				}					
				var ctx = $('#chart4');
				myChart = new Chart(ctx, {
					type: 'line',
				    data: {
				    	 labels: ['January','February','March','April','May','June','July','August','September','October','November','Decepber'],
				    	 datasets: [{ 
				    		 label: $('#year').val()+ '년 평균 수입 통계',
				             data: [data.jan, data.feb, data.mar, data.apr,
								 	data.may, data.jun, data.jul, data.aug,
								 	data.sep, data.octob, data.nov, data.decem],
				    		 backgroundColor: 'rgba(107,102,255,0.3)',
				    		 borderColor: 'rgba(93,93,93,0.3)',
				    		 pointBackgroundColor: 'rgba(0,0,0,0.1)',
				    		 pointStyle: 'circle',
				    		 borderWidth: 3
					   	 }]
				    },
				    options: {}
				});					
			}
		});
	});
</script>
</html>