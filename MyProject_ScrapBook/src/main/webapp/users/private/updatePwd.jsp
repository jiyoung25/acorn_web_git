<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String pwd = request.getParameter("pwd");
	boolean isSuccess = UsersDao.getInstance().updatePwd(pwd, id);
%>
<%if(isSuccess){%>
	{"isSuccess":isSuccess}
<%} else{%>
	{"isSuccess":!isSuccess}
<%} %>