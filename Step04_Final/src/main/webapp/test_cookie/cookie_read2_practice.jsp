<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//디코딩 방법 익히기
	
	//HttpServletRequest 객체를 이용해서 요청과 함께 전달된 쿠키 읽어내기
	Cookie[] cookies = request.getCookies();
	//"savedMsg" 라는 키값으로 저장된 문자열을 저장할 변수
	String savedMsg = null;
	for(Cookie tmp:cookies){
		String cookieName = tmp.getName();
		if(cookieName.equals("savedMsg")){
			savedMsg = tmp.getValue();
		}
	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/cookie_read2_practice.jsp</title>
</head>
<body>
<p>savedMsg  라는 키값으로 저장된 문자열 : ${cookie.savedMsg.value}, <%=savedMsg %> </p>
<a href="cookie_form2.jsp">다시 테스트</a>
</body>
</html>




