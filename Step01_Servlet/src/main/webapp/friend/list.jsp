<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>friend/list.jsp</title>
</head>
<body>
	<%
	List<String> names = new ArrayList<>(); 
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	%>
	<ul>
		<%//방법 1
		for(int i=0; i<names.size(); i++){
			out.println("<li>"+ names.get(i)+"</li>");
		}
		%>
		
	</ul>
</body>
</html>