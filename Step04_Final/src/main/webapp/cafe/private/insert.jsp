<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	CafeDto dto = new CafeDto();
	dto.setWriter(id);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = CafeDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("새 글이 작성되었습니다.");
			location.href="${pageContext.request.contextPath}/cafe/list.jsp"	
		</script>
	<%} else{%>
		<script>
			alert("글 작성에 실패했습니다.\n다시 시도해주세요.");
			location.href = "${pageContext.request.contextPath}/cafe/private/insertform.jsp"
		</script>
	<%} %>
</body>
</html>