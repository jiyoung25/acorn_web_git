<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int file_num = Integer.parseInt(request.getParameter("num"));
	String current_pwd = request.getParameter("current_pwd");
	
	FileDto file_dto = FileDao.getInstance().getData(file_num);
	String file_writer = file_dto.getWriter();
	UsersDto users_dto = UsersDao.getInstance().getData(file_writer);
	
	String users_pwd = users_dto.getPwd();
	
	if(current_pwd.equals(users_pwd)){
		
	} else{
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>