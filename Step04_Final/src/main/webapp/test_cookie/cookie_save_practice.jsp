<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = request.getParameter("msg");
	Cookie cook1 = new Cookie("savedMsg",msg);
	cook1.setMaxAge(60);
	response.addCookie(cook1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_cookie/cookie_save_practice.jsp</title>
</head>
<body>
	<p>웹 브라우저에 savedMsg 라는 키값으로 "<%=msg %>" 를 저장했습니다.</p>
	<a href="cookie_read_practice.jsp">저장된 문자 보러가기</a>
</body>
</html>