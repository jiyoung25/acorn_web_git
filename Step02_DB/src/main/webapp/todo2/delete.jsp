<%@page import="test.todo.dao.TodoDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 번호
	int num=Integer.parseInt(request.getParameter("num"));
	//삭제하기
	TodoDao2.getInstance().delete(num);
	//리다이렉트 응답하기(특정 경로로 요청을 다시 하라고 강요하는 응답)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/todo2/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo2/delete</title>
</head>
<body>

</body>
</html>