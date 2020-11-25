<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>chart3</title>
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
		<h1>월별 지출 통계</h1>
	</div>
	<!-- 연도를 입력받는 검색창 -->
	<div class="input-group justify-content-center" style="margin-top: 20px; margin-bottom: 50px">
		<input class="form-control col-lg-3" type="text" id="year" placeholder="연도를 검색하세요">
		<div class="input-group-append">
			<button class="btn btn-dark" id="chartSearch">검색</button>
		</div>
	</div>
	<!-- chart 출력부분 -->
	<div>
		<canvas id="chart3"></canvas>
	</div>
</div>
</body>
<script>
	var myChart;
	$('#chartSearch').click(function() {
		$.ajax({
			url:'/admin/chart3',
			type:'get',
			data:{year:$('#year').val()},
			success:function(data) {
				if(myChart) {
					myChart.destroy();	// 기존에 그래프 객체가 있으면 삭제
				}
				var ctx = $('#chart3');
				myChart = new Chart(ctx, {
					type:'bar',
				    data: {
				        labels: ['January','February','March','April','May','June','July','August','September','October','November','Decepber'],
				        datasets: [{
				            label: $('#year').val()+ '년 지출 통계',
				            data: [data.jan, data.feb, data.mar, data.apr,
								 	data.may, data.jun, data.jul, data.aug,
								 	data.sep, data.octob, data.nov, data.decem],
				            backgroundColor: [
				            	'rgba(125, 50, 132, 0.2)',
					      		'rgba(54, 162, 25, 0.2)',
				                'rgba(255, 206, 186, 0.2)',
				                'rgba(75, 25, 192, 0.2)',
				                'rgba(15, 102, 255, 0.2)',
				                'rgba(205, 159, 64, 0.2)',
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)'
				            ],
				            borderColor: [
				            	'rgba(255, 20, 58, 0.2)',
					      		'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)',
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {}
				});
			}
		});
	});
</script>
</html>