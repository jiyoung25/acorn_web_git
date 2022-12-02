<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    	String url = request.getParameter("url");
    	System.out.println(url);
    	
    	String encodedUrl=URLEncoder.encode(url);
    	
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	
    	UsersDto dto = new UsersDto();
    	dto.setId(id);
    	dto.setPwd(pwd);
    	boolean isValid = UsersDao.getInstance().isValid(id);
    	
    	if(isValid){
    		session.setAttribute("id", id);
    	}
    	
    	boolean isIdChecked = Boolean.parseBoolean(request.getParameter("idCheck"));
    	if(isIdChecked){
    		Cookie cookId = new Cookie("cookId", id);
    		cookId.setMaxAge(60*60*24*7);
    		response.addCookie(cookId);
    	} else{
    		Cookie cookId = new Cookie("cookId", id);
    		cookId.setMaxAge(0);
    		response.addCookie(cookId);
    	}
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
		<p>
		<strong><%=id %>님</strong> 로그인에 성공하셨습니다.</p>
		<p><a href="<%=url %>">확인</a></p>
	<%} else{ %>
		<p>로그인 실패. 아이디나 비밀번호를 다시 확인해주세요.</p>
		<p><a href="${pageContext.request.contextPath}/users/loginform.jsp?url=<%=encodedUrl %>">로그인 화면으로 돌아가기</a></p>
	<%} %>
</body>
</html>