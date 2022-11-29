<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg =null;
	Cookie[] cookies = request.getCookies();
	for(Cookie tmp:cookies){
		String cookieName = tmp.getName();
		if(cookieName.equals("savedMsg")){
			msg=tmp.getValue();
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/cookie_read.jsp</title>
</head>
<body>
	읽은 쿠키 메시지: <%=msg %>
	${cookie.savedMsg.value }
</body>
</html>




