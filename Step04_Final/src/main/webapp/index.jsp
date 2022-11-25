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
		.title{
			width : 50px;
			margin-right: auto;
			margin-left: auto;
		}
	</style>
</head>
<body>
	<%if(id==null) {%>
		<jsp:include page="/include/navbar.jsp"></jsp:include>
	<%} else{ %>
		<jsp:include page="/include/navbar2.jsp"></jsp:include>
	<%} %>
	<div class="container">
		<hr class="border border-danger border-4 opacity-50">
		<h1 class = "title">INDEX</h1>
		<hr class="border border-danger border-4 opacity-50">
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>