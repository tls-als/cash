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
		<h1>월별 수입/지출 통계</h1>
	</div>
	<!-- 연도를 입력받는 검색창 -->
	<div class="input-group justify-content-center" style="margin-top: 20px; margin-bottom: 50px">
		<input class="form-control col-lg-3" type="text" id="year" placeholder="연도를 검색하세요.">
		<div class="input-group-append">
			<button class="btn btn-dark" id="chartSearch">검색</button>
		</div>
		<div class="input-group justify-content-end">
			<select class="form-control col-lg-2" id="cashbookKind">
				<option value="수입">수입</option>
				<option value="지출">지출</option>
			</select>
		</div>
	</div>
	<!-- chart -->
	<div>
		<canvas id="chart2"></canvas>
	</div>
	<!-- table -->
	<div>
	</div>
</div>
</body>
<script>
	let i;
	for(i=0; i<120; i++) {
		i += 10;
	}
	$('#chartSearch').click(function() {
		$.ajax({
				url:'/admin/chart2',
				type:'get',
				data:{year:${'#year'}.val(), cashbookKind:${'#cashbookKind'}.val()},
				success:function(data) {
					let ctx = $('#chart2')
					myChart = new Chart(ctx, {
						type: 'bar',
					    data: {
					    	labels:['1','2','3','4','5','6','7','8','9','10','11','12'],
					        datasets: [{
					        	label: '1년간 월별 지출',
					            data: [data.jan, data.feb, data.mar, data.apr,
									  data.may, data.jun, data.jul, data.aug,
									  data.sep, data.octob, data.nov, data.decem],
					      		backgroundColor:['rgba(255, i, 132, 0.2)'],
					      		borderColor:['rgba(255, 20, i, 0.2)'],
					      		borderWidth: 1
					        }]
					    },
					    options: options
					});
				}
			});
		)};
</script>
</html>