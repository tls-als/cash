<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>chart6</title>
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
		<h1>연간 최대 수입/최저 수입</h1>
	</div>
	<!-- 입력받는 부분 -->
	<div class="input-group justify-content-center" style="margin-top: 20px; margin-bottom: 50px">
		<input class="form-control col-lg-3" type="text" id="year" placeholder="연도를 검색하세요">
		<div class="input-group-append">
			<button class="btn btn-dark" id="chartSearch">검색</button>
		</div>
	</div>	
	<!-- chart -->
	<div>
		<canvas id="chart6"></canvas>
	</div>
</div>
</body>
<script>
	var myChart;
	$('#chartSearch').click(function() {
		$.ajax({
			url:'/admin/chart6',
			type:'get',
			data:{year:$('#year').val()},
			success:function(data) {
				if(myChart) {
					myChart.destroy();
				}					
				var ctx = $('#chart6');
				myChart = new Chart(ctx, {
					type: 'horizontalBar',
				    data: {
				    	 labels: ['최대 수입','최소 수입'],
				    	 datasets: [{ 
				    		 label: $('#year').val()+ '년 최대/최소 수입 통계',
				             data: [data.maxIncome, data.minIncome],
				    		 backgroundColor: ['rgba(125,12,100,0.3)'
					    		 				,'rgba(85,112,185,0.3)'],
				    		 borderColor: ['rgba(125,90,15,0.3)',
				    			 			'rgba(250,10,45,0.3)'],
	    			 			data:[data.maxIncome, data.minIncome],
					      		borderWidth: 3
						 }]
				    },
				    options: {
				    	title: {	// 그래프 타이틀 설정
				            display: true,
				            text: $('#year').val() + '년 최대/최소 수입',
				            fontStyle: 'bold',
				            fontSize: 18
				        },
					}
				});	
			}
		});
	});
</script>
</html>