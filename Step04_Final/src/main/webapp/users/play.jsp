<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = (String)session.getAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/play</title>
</head>
<body>
	<p>
		<%if(id==null){%>
			<p>로그인이 되어있지 않습니다.</p>
			<p><a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인하러 가기</a></p>
		<%} else{%>
			<p><%=id %>님 안녕하세요.</p>
		<%}%>
	</p>
</body>
</html>