<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String inputId=request.getParameter("inputId");
	System.out.println(inputId);
	UsersDto dto = UsersDao.getInstance().getData(inputId);
	
%>

<%--dto가 null이면 아직 존재하지 않는 아이디 --%>
<%if(dto==null){%>
	{"isExist":false}
<%} else{%>
<%--dto가 null이 아니면 이미 존재하는 아이디 --%>
	{"isExist":true}
<%}%>
