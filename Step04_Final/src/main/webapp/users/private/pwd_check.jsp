<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/pwd_check.jsp</title>
</head>
<body>
	<div class="container">
		<h1>현재 비밀번호 확인</h1>
		<form action="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp">
			<label for="current_pwd">현재 비밀번호를 입력해주세요.
				<input type="password" id="current_pwd" name="current_pwd" />
			</label>
			<button type="submit">확인</button>
		</form>
	</div>
</body>
</html>