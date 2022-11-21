<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//1. 폼에서 전송되는 아이디와 비밀번호 읽어오기
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	//2. DB에 실제로 존재하는 정보인지 확인한다.
    	UsersDto dto = new UsersDto();
    	dto.setId(id);
    	dto.setPwd(pwd);
    	boolean isValid = UsersDao.getInstance().isValid(dto);
    	
    	//2-1. session scope에 id라는 키값으로 로그인된 아이디 담기
    	if(isValid){
    		session.setAttribute("id", id);
    	}
    	//3. 응답
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%if(isValid){ %>
		<p class="alert alert-success">
		<strong><%=id %>님</strong> 로그인에 성공하셨습니다.</p>
		<p><a href="../index.jsp">index로 돌아가기</a></p>
	<%} else{ %>
		<p class="alert alert-danger">로그인 실패. 아이디나 비밀번호를 다시 확인해주세요.</p>
		<p><a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인 화면으로 돌아가기</a></p>
	<%} %>
</body>
</html>