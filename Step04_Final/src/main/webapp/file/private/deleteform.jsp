<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int file_num = Integer.parseInt(request.getParameter("num"));
	FileDto file_dto = FileDao.getInstance().getData(file_num);
	String file_writer = file_dto.getWriter();
	
	UsersDto users_dto = UsersDao.getInstance().getData(file_writer);
	String pwd = users_dto.getPwd();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteform.jsp</title>
</head>
<body>
	<div class="container">
		<h3>비밀번호 확인</h3>
		<p>현재 비밀번호를 입력해주세요.</p>
		<form action="delete.jsp?=<%=file_num%>">
			<label>현재 비밀번호: <input type="password" name="current_pwd" /></label>
			<button type="submit">확인</button>
		</form>
	</div>
</body>
</html>