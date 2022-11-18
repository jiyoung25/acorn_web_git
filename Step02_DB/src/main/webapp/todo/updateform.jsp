<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.sql.Date"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String[] nums = request.getParameterValues("update");
    int rowCount = 0;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
		crossorigin="anonymous"
	>
</head>
<body>
<hr class="border border-warning border-4 opacity-50">
	<div class="container">
		<h1>할 일 수정하기</h1>
		<br>
		<% if(nums==null){ %>
			<script>
				alert("수정할 내용을 선택해주세요.");
				location.href="${pageContext.request.contextPath}/todo/list.jsp"
			</script>
		<% } else { %>
			<form method = "post" action="${pageContext.request.contextPath }/todo/update.jsp" onsubmit='return update_chk()'>
				<% for(String tmp:nums){
						
			   			int num = Integer.parseInt(tmp);
			   			TodoDao.getInstance().getData(num).getContent();
			 			String content = TodoDao.getInstance().getData(num).getContent();
			    		Date regdate = TodoDao.getInstance().getData(num).getRegDate();
				   		TodoDto dto = new TodoDto(num, content, regdate);
			%>
				<div>
					<input type="hidden" name="num" value="<%=num%>">
					<div class="input-group mb-3">
						<label class="input-group-text" for="num">번호</label>
						<input class="form-control" type="text" id="num" value="<%=num%>" disabled>
					</div>
					<div class="input-group mb-3">
						<label class="input-group-text" for="content">할 일</label>
						<input class="form-control" type="text" id="content" value="<%=content%>" name="content" autofocus>
					</div>
					<div class="input-group mb-3">
						<label class="input-group-text" for="regdate">기한</label>
						<input class="form-control" type="date" id="regdate" value="<%=regdate%>" name="regdate">
					</div>
					<br>
				</div>
			
				<% } %>
		<%} %>
			<input class="btn btn-dark" type="submit" value="수정하기">
			<button class="btn btn-dark" type="button" onclick="location.href='${pageContext.request.contextPath}/todo/list.jsp'">리스트로 돌아가기</button>
		</form>
	</div>
</body>
</html>