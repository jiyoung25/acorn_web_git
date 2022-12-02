<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String paramId = request.getParameter("id");
	if(!id.equals(paramId)||paramId==null){ %>
		<script>
			alert("제대로 된 경로로 접근해주세요.");
			location.href="${pageContext.request.contextPath}";
		</script>
	<%		return;
	}
	UsersDto dto = UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h3>개인정보 수정</h3>
		<form id="updateForm">
			<div>
				<label for="profile">프로필</label>
				<input type="text" value="<%=dto.getProfile() %>" />
			</div>
			<div>
				<label for="id">아이디</label>
				<input type="text" value="<%=id %>" disabled />
				<input type="hidden" name="id" value="<%=id %>" />
			</div>
			<div>
				<label for="id">닉네임</label>
				<input type="text" value="<%=dto.getNickname() %>" />
			</div>
			<div>
				<label for="id">이메일</label>
				<input type="text" value="<%=dto.getEmail() %>" />
			</div>
		</form>
	</div>
</body>
</html>