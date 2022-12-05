<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	String nickname=null;
	if(id!=null){
		nickname = UsersDao.getInstance().getData(id).getNickname();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%if(id==null){%>
		<a href="${pageContext.request.contextPath}/users/signupform.jsp">회원가입</a>
		<a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
	<%} else{ %>
		<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=nickname %>님 어서오세요.</a>
		<a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
	<%} %>
	<h1>스크랩북</h1>
	<a href="${pageContext.request.contextPath}/cafe/private/insertform.jsp?category=all">글쓰기</a>
	<ul>
		<li><a href="${pageContext.request.contextPath}/cafe/list.jsp?category=all">전체 게시글</a></li>
		<li><a href="${pageContext.request.contextPath}/cafe/list.jsp?category=dwell">주거 형태</a></li>
		<li><a href="${pageContext.request.contextPath}/cafe/list.jsp?category=space">방의 종류</a></li>
		<li><a href="${pageContext.request.contextPath}/cafe/list.jsp?category=atmosphere">분위기</a></li>
	</ul>
</body>
</html>