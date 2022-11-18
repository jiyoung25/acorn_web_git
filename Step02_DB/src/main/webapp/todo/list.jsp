<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<TodoDto> list = TodoDao.getInstance().getList();
	int num = 0;
	String content="";
	Date regdate=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
		crossorigin="anonymous"
	>
	<style>
	.nav-pills>.nav-item> a {
		color:rgb(246,255,204) !important;
	}
	.nav-pills>.nav-item> a:hover{
		color:rgb(210, 229, 168)!important;
	}
	.nav-link:focus,
	.nav-link:active,
	.nav-link.active {
   		background-color: #469840;
   		border-color: #000000;
	}
	</style>
</head>
<body>
	<%--
	include해 온 jsp파일의 파라미터를 다르게 하고 싶을 때 jsp:param 이용
	아래는 thisPage라는 파라미터 명으로 todo라는 문자열을 전달하는 것이다.
	그러면 마치 navbar.jsp?thisPage=member을 요청한 것과 비슷한 효과가 돼서
	navbar.jsp내부에서
	
	String thisPage = request.getParameter("thisPage");
	
	코드를 수행하면 thisPage안에는 "todo"라는 문자열이 들어있게 된다.
	 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="todo" name="thisPage" />
	</jsp:include>
	
	<div class="container">
		<hr class="border border-danger border-2 opacity-50">
		<h1>할 일 목록 보기</h1>
		<hr class="border border-danger border-2 opacity-50">
		<form id="frm" name="frm" method = "post">
			<table class="table table-striped">
				<thead class="table-primary" >
					<tr>
						<th>번호</th>
						<th>할 일</th>
						<th>기한</th>
						<th><input type="submit" value="수정" onclick="javascript: form.action='${pageContext.request.contextPath}/todo/updateform.jsp'" class="btn btn-light"></th>
						<th><input type='submit' value='삭제' onclick="javascript: form.action='../todo/delete.jsp'" class="btn btn-light"></th>
					<tr>
				</thead>
				<tbody>
					<%for(TodoDto tmp:list){
					num=tmp.getNum();
					content=tmp.getContent();
					regdate=tmp.getRegDate();
					%>
					<tr>
						<td><%=num%></td>
						<td><%=content%></td>
						<td><%=regdate%></td>
						<td class="check"><input type="checkbox" name ="update" value="<%=num%>"></td>
						<td class= "check"><input type="checkbox" name ="delete" value="<%=num%>"></td>
					<tr>
						<%} %>
					
				</tbody>
			</table>
		</form>
	<div class="container">
		<a href="${pageContext.request.contextPath}/todo/insertform.jsp" class="btn btn-warning" role="button">
			할 일 목록 추가하러 가기
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brush" viewBox="0 0 16 16">
  				<path d="M15.825.12a.5.5 0 0 1 .132.584c-1.53 3.43-4.743 8.17-7.095 10.64a6.067 6.067 0 0 1-2.373 1.534c-.018.227-.06.538-.16.868-.201.659-.667 1.479-1.708 1.74a8.118 8.118 0 0 1-3.078.132 3.659 3.659 0 0 1-.562-.135 1.382 1.382 0 0 1-.466-.247.714.714 0 0 1-.204-.288.622.622 0 0 1 .004-.443c.095-.245.316-.38.461-.452.394-.197.625-.453.867-.826.095-.144.184-.297.287-.472l.117-.198c.151-.255.326-.54.546-.848.528-.739 1.201-.925 1.746-.896.126.007.243.025.348.048.062-.172.142-.38.238-.608.261-.619.658-1.419 1.187-2.069 2.176-2.67 6.18-6.206 9.117-8.104a.5.5 0 0 1 .596.04zM4.705 11.912a1.23 1.23 0 0 0-.419-.1c-.246-.013-.573.05-.879.479-.197.275-.355.532-.5.777l-.105.177c-.106.181-.213.362-.32.528a3.39 3.39 0 0 1-.76.861c.69.112 1.736.111 2.657-.12.559-.139.843-.569.993-1.06a3.122 3.122 0 0 0 .126-.75l-.793-.792zm1.44.026c.12-.04.277-.1.458-.183a5.068 5.068 0 0 0 1.535-1.1c1.9-1.996 4.412-5.57 6.052-8.631-2.59 1.927-5.566 4.66-7.302 6.792-.442.543-.795 1.243-1.042 1.826-.121.288-.214.54-.275.72v.001l.575.575zm-4.973 3.04.007-.005a.031.031 0 0 1-.007.004zm3.582-3.043.002.001h-.002z"/>
			</svg>
		</a>
	</div>
	</div>
</body>
</html>