<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<style>
	.nav-pills>.nav-item> a {
		color:rgb(246,255,204) !important;
	}
	.nav-pills>.nav-item> a:hover{
		color:rgb(210, 229, 168)!important;
	}
	header.carousel {

		height: 30%;

	}
	toobig{
		width: 50% !important;
		height: 50% !important;
	}
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-success navbar-dark">
		<div class="container">
			<a class = "navbar-brand active" href="${pageContext.request.contextPath}/">
				<img src="https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
				Acorn
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNav">
    			<ul class="nav nav-pills">
    				<li class="nav-item">
    					<a class="nav-link " href="${pageContext.request.contextPath}/member/list.jsp">회원 목록</a>
    				</li>
    				<li class="nav-item">
    					<a class="nav-link " href="${pageContext.request.contextPath}/todo/list.jsp">할 일 목록</a>
    				</li>
    				<li class="nav-item">
    					<a class="nav-link " href="${pageContext.request.contextPath}/todo2/list.jsp">할 일 목록(in 수업시간)</a>
    				</li>
    			</ul>
    		</div>
		</div>
	</nav>



	<div class="container">
		<hr class="border border-danger border-4 opacity-50">
		<h1>인덱스 페이지입니다.</h1>
		<hr class="border border-danger border-4 opacity-50">
	</div>
	
	<div id="carouselExampleIndicators" class="container carousel slide" data-bs-ride="true" style="width: 524px;">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${pageContext.request.contextPath}/img/member.png" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/img/todo1.png" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/img/todo2.png" class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</body>
</html>