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
		<li class="nav-item">
	 	<a class="nav-link" href="${pageContext.request.contextPath}/admin/chart1.jsp">통계자료</a>
	</li>
	<li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Dropdown link
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
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
