<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //로그인된 아이디가 있는지 확인
    String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>/private/study.jsp</title>

	<style>
		#profileImage{
			width : 50px;
			border-radius: 5px;
		}
		h1{
			text-align:center;
		}
		p{
			text-align: center;
			font: 20px blue;
		}
		.what{
			font-size: 20px;
		}
		.link_list{
			text-decoration-line:none;
		}
		.link_list:link {
		  	color : black;
		}
		.link_list:visited {
		  	color : black;
		}
		.link_list:hover {
		  	color : red;
		}
		.link_list:active {
		  	color : blue
		}
		
	</style>
</head>
<body>
	<jsp:include page="/include/navbar2.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-2">
				<ul class = "list list-group">
					<li class="list-group-item list-group-item-warning"><strong>회원 전용 공간</strong></li>
					<li class="what list-group-item" style="background-color:#bcc8c6; "><a class="link_list" href="${pageContext.request.contextPath}/private/study.jsp"><strong>공부</strong></a></li>
					<li class="what list-group-item"><a class="link_list" href="${pageContext.request.contextPath}/private/game.jsp">게임</a></li>
				</ul>
			</div>
			<div class="col-10">
				<hr class="border border-success border-4 opacity-50">
				<h1>공부 페이지입니다.</h1>
				<hr class="border border-success border-4 opacity-50">
				<p>
					<svg width="50px" height="auto" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal-plus" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5z"/>
  						<path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
  						<path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
					</svg>
					<strong><%=id %></strong>님 열심히 공부해요!
					<svg width="50px" height="auto" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  						<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
					</svg>
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>