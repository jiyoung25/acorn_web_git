<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<a href="${pageContext.request.contextPath}/users/signupform.jsp">회원가입</a>
	<a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
	<h1>스크랩북</h1>
	<ul>
		<li><a href="">전체 게시물</a>
			<ul>
				<li></li>
			</ul>
		</li>
		<li><a href="">그룹 게시물</a></li>
	</ul>
</body>
</html>