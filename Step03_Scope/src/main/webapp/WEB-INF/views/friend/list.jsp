<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = (List)request.getAttribute("list");
	int num =1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>친구 목록입니다.</h3>
	<%for(String tmp:list){%>
		<p>친구<%=num %>: <strong><%=tmp%></strong></p>
	<% num++;
	} %>
</body>
</html>