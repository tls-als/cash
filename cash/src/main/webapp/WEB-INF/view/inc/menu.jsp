<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand">CashBook</a>
	<ul class="nav nav-tabs">
		<li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath}/">index</a>
		</li>
		<li class="nav-item">
		  	<a class="nav-link" href="${pageContext.request.contextPath}/admin/cashbookByMonth/now/-1/-1">cashbook</a>
		</li>
	 	<li class="nav-item">
	  		<a class="nav-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">cashbookList</a>
		</li>
		<li class="nav-item dropdown">
	      	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">통계자료</a>
		      <div class="dropdown-menu">
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/chart1.jsp">연간 수입/지출</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/chart2.jsp">연간 월별 수입</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/chart3.jsp">연간 월별 지출</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/chart4.jsp">월별 평균 수입</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/chart5.jsp">월별 평균 지출</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/chart6.jsp">chart6</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/chart7.jsp">chart7</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/chart8.jsp">chart8</a>
		        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/chart9.jsp">chart9</a>
		      </div>
	    </li>
	<li class="nav-item">
	 	<a class="nav-link" href="${pageContext.request.contextPath}/admin/addMember">사용자등록</a>
	</li>
	<li class="nav-item">
	  	<a class="nav-link" href="${pageContext.request.contextPath}/admin/logout">logout</a>
	</li>
	</ul>
</nav>
