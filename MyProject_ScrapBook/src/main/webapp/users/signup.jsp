<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
    	String nickname = request.getParameter("nickname");
   		String pwd = request.getParameter("pwd");
    	String email = request.getParameter("email");
    	
    	UsersDto dto =new UsersDto();
    	dto.setId(id);
    	dto.setNickname(nickname);
    	dto.setPwd(pwd);
    	dto.setEmail(email);
    	boolean isSuccess = UsersDao.getInstance().insert(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<h3>알림</h3>
		<p><strong><%=id %></strong>님 가입되었습니다.</p>
		<a href="loginform.jsp">로그인</a>
		<a href="${pageContext.request.contextPath}">index로</a>
	<%} else{%>
		<h3>알림</h3>
		<p>회원가입에 실패하셨습니다.</p>
		<a href="${pageContext.request.contextPath}/users/signupform.jsp">다시 시도</a>
		<a href="${pageContext.request.contextPath}">index로</a>
	<%} %>
</body>
</html>