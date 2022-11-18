<%@page import="test.todo.dao.TodoDao2"%>
<%@page import="test.todo.dto.TodoDto2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//폼에서 전송되는 할 일을 읽어와서
	request.setCharacterEncoding("utf-8");
	String content=request.getParameter("content");
	//TodoDto2에 담고
	TodoDto2 dto = new TodoDto2();
	dto.setContent(content);
	//DB에 저장하고
	boolean isSuccess=TodoDao2.getInstance().insert(dto);
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo2/insert.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p>
				할 일을 추가했습니다.
				<a href="list.jsp">확인</a>
			</p>
		<%} else{%>
			<p>
				할 일 추가 실패!
				<a href="insertform.jsp">다시 시도</a>
			</p>
		<%} %>
	</div>
</body>
</html>