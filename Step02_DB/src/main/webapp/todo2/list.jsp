<%@page import="test.todo.dao.TodoDao2"%>
<%@page import="test.todo.dto.TodoDto2"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//TodoDao 객체를 이용해서 할 일 목록을 얻어온다.
	List<TodoDto2> list=TodoDao2.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<style>
	.nav-pills>.nav-item> a {
		color:rgb(246,255,204) !important;
	}
	.nav-pills>.nav-item> a:hover{
		color:rgb(210, 229, 168)!important;
	}
	table{
		margin-right:auto;
		margin-left:auto;
	}
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-success navbar-dark">
		<div class="container">
			<a class = "navbar-brand active" href="${pageContext.request.contextPath}/">
				<img src="https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
				Acorn
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNav">
    			<ul class="nav nav-pills">
    				<li class="nav-item">
    					<a class="nav-link " href="${pageContext.request.contextPath}/member/list.jsp">회원 목록</a>
    				</li>
    				<li class="nav-item">
    					<a class="nav-link " href="${pageContext.request.contextPath}/todo/list.jsp">할 일 목록</a>
    				</li>
    				<li class="nav-item">
    					<a class="nav-link " href="${pageContext.request.contextPath}/todo2/list.jsp">할 일 목록(in 수업시간)</a>
    				</li>
    			</ul>
    		</div>
		</div>
	</nav>
	<div class="container">
		<hr class="border border-danger border-2 opacity-50">
		<h1>할 일 목록입니다.</h1>
		<hr class="border border-danger border-2 opacity-50">
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>등록일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(TodoDto2 tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td><a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
						<td><a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	<div class="container">
		<a href="${pageContext.request.contextPath}/member/insertform.jsp" class="btn btn-warning" role="button">
			할 일 목록 추가하러 가기
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brush" viewBox="0 0 16 16">
  				<path d="M15.825.12a.5.5 0 0 1 .132.584c-1.53 3.43-4.743 8.17-7.095 10.64a6.067 6.067 0 0 1-2.373 1.534c-.018.227-.06.538-.16.868-.201.659-.667 1.479-1.708 1.74a8.118 8.118 0 0 1-3.078.132 3.659 3.659 0 0 1-.562-.135 1.382 1.382 0 0 1-.466-.247.714.714 0 0 1-.204-.288.622.622 0 0 1 .004-.443c.095-.245.316-.38.461-.452.394-.197.625-.453.867-.826.095-.144.184-.297.287-.472l.117-.198c.151-.255.326-.54.546-.848.528-.739 1.201-.925 1.746-.896.126.007.243.025.348.048.062-.172.142-.38.238-.608.261-.619.658-1.419 1.187-2.069 2.176-2.67 6.18-6.206 9.117-8.104a.5.5 0 0 1 .596.04zM4.705 11.912a1.23 1.23 0 0 0-.419-.1c-.246-.013-.573.05-.879.479-.197.275-.355.532-.5.777l-.105.177c-.106.181-.213.362-.32.528a3.39 3.39 0 0 1-.76.861c.69.112 1.736.111 2.657-.12.559-.139.843-.569.993-1.06a3.122 3.122 0 0 0 .126-.75l-.793-.792zm1.44.026c.12-.04.277-.1.458-.183a5.068 5.068 0 0 0 1.535-1.1c1.9-1.996 4.412-5.57 6.052-8.631-2.59 1.927-5.566 4.66-7.302 6.792-.442.543-.795 1.243-1.042 1.826-.121.288-.214.54-.275.72v.001l.575.575zm-4.973 3.04.007-.005a.031.031 0 0 1-.007.004zm3.582-3.043.002.001h-.002z"/>
			</svg>
		</a>
	</div>
</body>
</html>