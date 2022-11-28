<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//session scope에 id라는 키값으로 저장된 값이 있는지 읽어와본다.(없으면 null)
    	String id = (String)session.getAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<style>
		#profileImage{
			width : 50px;
			border-radius: 5px;
		}
		h1{
			text-align: center;	
		}
		.msg{
			background-color: black;
			color: white;
			border-radius: 100px;
		}
	</style>
</head>
<body>
	<%if(id==null) {%>
		<jsp:include page="/include/navbar.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>
	<%} else{ %>
		<jsp:include page="/include/navbar2.jsp"></jsp:include>
	<%} %>
	
	<div class="container">
		<hr class="border border-danger border-4 opacity-50">
		<h1>INDEX</h1>
		<hr class="border border-danger border-4 opacity-50">
		<div class="alert alert-success alert-dismissible fade show" >
            <strong>안녕하세요.</strong> 로그인을 하면 더 많은 활동을 즐기실 수 있습니다.
            <button type="button" class="btn-close" data-bs-dismiss="alert" ></button>
        </div>
        <div class="row">
        	<div class="col-3"></div>
			<div id="carouselExampleCaptions" class="carousel slide box col-6" data-bs-ride="false">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  				</div>
  				<div class="carousel-inner">
    				<div class="carousel-item active">
    					<a href = ${pageContext.request.contextPath}/cafe/list.jsp>
      						<img src="${pageContext.request.contextPath}/images/cafe_list.svg" class="d-block w-100" alt="cafe_list">
      						<div class="carousel-caption d-none d-md-block msg">
        						<h5>게시글</h5>
        						<p>회원들이 올린 게시글을 볼 수 있습니다.</p>
      						</div>
      					</a>
    				</div>
    				<a href = ${pageContext.request.contextPath}/file/list_T.jsp>
    					<div class="carousel-item">
      						<img src="${pageContext.request.contextPath}/images/image.svg" class="d-block w-100" alt="image_list">
      						<div class="carousel-caption d-none d-md-block msg">
        						<h5>자료실</h5>
        						<p>자료실을 사용할 수 있습니다.</p>
      						</div>
    					</div>
    				</a>
    				<a href = ${pageContext.request.contextPath}/private/game.jsp>
					<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/images/private.svg" class="d-block w-100" alt="forMember">
      				<div class="carousel-caption d-none d-md-block msg">
        				<h5>회원 전용 공간</h5>
        				<p>회원들만 사용할 수 있는 전용 공간입니다.</p>
      				</div>
    				</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    				<span class="visually-hidden">Previous</span>
  				</button>
  				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    				<span class="carousel-control-next-icon" aria-hidden="true"></span>
    				<span class="visually-hidden">Next</span>
  				</button>
  			</div>
  			<div class="col-3"></div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>