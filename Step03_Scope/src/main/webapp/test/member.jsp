<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto dto = new MemberDto();
	dto = (MemberDto)request.getAttribute("dto");
	int num = dto.getNum();
	String name = dto.getName();
	String addr = dto.getAddr();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/member.jsp</title>
</head>
<body>
	<h3>회원 한 명의 정보입니다.</h3>
	<p>번호: <strong><%=num %></strong></p>
	<p>이름: <strong><%=name %></strong></p>
	<p>주소: <strong><%=addr %></strong></p>
</body>
</html>