<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    String[] nums = request.getParameterValues("delete");
    boolean[] isSuccesses = new boolean[nums.length];


	for(String tmp:nums){
		int num = Integer.parseInt(tmp);
		System.out.print(num);
		TodoDao.getInstance().delete(num);
	}
	
    String cPath=request.getContextPath();
    response.sendRedirect(cPath+"/todo/list.jsp");
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