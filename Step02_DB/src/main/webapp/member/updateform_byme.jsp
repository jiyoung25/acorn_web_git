<!-- update form -->
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    int num = Integer.parseInt(request.getParameter("num"));
    MemberDto dto = MemberDao.getInstance().getData(num);
    String memberName=dto.getName();
    String memberAddr=dto.getAddr();
    MemberDao.getInstance().getData(num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateform</title>
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정하기</h1>
		<form action="${pageContext.request.contextPath}/member/update.jsp?num=<%=num%>" method="post">
			<div>
				<label>이름<input type="text" name="name" value="<%=memberName%>" autofocus></label>
			<div>
				<label>주소<input type="text" name="addr" value="<%=memberAddr%>"></label>
			</div>
			<br>
			<button type="submit">수정하기</button>
			</div>
		</form>
	</div>
</body>
</html>