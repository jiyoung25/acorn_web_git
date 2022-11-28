<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String inputId=request.getParameter("inputId");
	UsersDto dto = UsersDao.getInstance().getData(inputId);
	System.out.println(inputId);
%>
<%if(dto == null){%>
	{"isExist":false}
<%} else{%>
	{"isExist":true}
<%}%>

