<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//폼에서 전송되는 닉네임을 읽어와서
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	
	//session scope에 "nick"이라는 key값으로 저장하기
	session.setAttribute("nick", nick);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/save.jsp</title>
</head>
<body>
	<p><strong><%=nick %></strong>이라는 닉네임을 기억하겠습니다.</p>
	<p>30분 동안 아무런 요청을 하지 않거나 웹부라우저를 닫으면 자동으로 삭제됩니다.</p>
	<a href="../index.jsp">인덱스로 이동하기</a>
</body>
</html>