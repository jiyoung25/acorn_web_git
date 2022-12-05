<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String inputNick=request.getParameter("inputNick");
	boolean isExist = UsersDao.getInstance().checkNick(inputNick);
%>

<%if(isExist){%>
	{"isExist":true}
<%}else{%>
	{"isExist":false}
<%}%>
