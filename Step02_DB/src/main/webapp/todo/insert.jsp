<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    
    TodoDto dto=new TodoDto();
    
    try{
    	dto.setContent(request.getParameter("content"));
    	dto.setRegDate(Date.valueOf(request.getParameter("regdate")));
    } catch(Exception e){
    	e.printStackTrace();%>
    <%}

    boolean isSuccess = TodoDao.getInstance().insert(dto);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		<%if(isSuccess){%>
			alert("할 일 목록이 성공적으로 추가되었습니다.");
			location.href="${pageContext.request.contextPath}/todo/list.jsp"
		<%} else{%>
			alert("할 일 목록 추가에 실패했습니다. \n할 일을 필수로 적어주세요.");
			location.href="${pageContext.request.contextPath}/todo/insertform.jsp"
		<%}%>
	</script>
</body>
</html>		location.href="${pageContext.request.contextPath}/todo/insertform.jsp"
	</script>
</body>
</html>