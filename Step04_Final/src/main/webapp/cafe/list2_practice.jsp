<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/cafe/private/insertform.jsp">새 글 작성</a>
		<h3>카페 글 목록입니다.</h3>
		<table>
			<thead>
				<tr>
					<th>글 번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%for(CafeDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td><a href = "${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
						<td><%=tmp.getViewCount() %></td>
						<td><%=tmp.getRegdate() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<div>
			<ul>
				<%for(int i=startPageNum; i<=endPageNum; i++){%>
					<li><a href="${pageContext.request.contextPath}/cafe/list2.jsp?pageNum=<%=i%>"><%=i%></a></li>
				<%}%>
			</ul>
		</div>
	</div>
</body>
</html>