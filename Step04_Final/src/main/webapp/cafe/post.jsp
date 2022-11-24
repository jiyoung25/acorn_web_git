<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
	String writer = dto.getWriter();
	String title = dto.getTitle();
	String content = dto.getContent();
	int viewCount = dto.getViewCount()+1;
	String regdate = dto.getRegdate();
	
	CafeDao.getInstance().countUpdate(num,viewCount);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/post.jsp</title>
	<style>
		.content{
			border: 1px solid black
		}
	</style>
</head>
<body>
	<div class="container">
		<div>
			<span>제목: <%=title %></span>
		</div>
		<div>
			<span>글쓴이: <%=writer %></span>
			<span>조회수: <%=viewCount %></span>
			<span>글 작성일: <%=regdate %></span>
		</div>
		<fieldset>
			<legend>글 내용</legend>
			<p>
				<%=content %>
			</p>
		</fieldset>
		
		<a href="${pageContext.request.contextPath}/cafe/list.jsp">목록으로</a>
	</div>
	
</body>
</html>