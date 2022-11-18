<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("msg");
	System.out.println("msg"+msg);
	%>
	<p>
	post방식으로 <% out.print(msg); %>를 받아냄
	</p>
	<button type="button" onclick="location.href='/Step01_Servlet/index.html'">index</button>
	
</body>
</html>