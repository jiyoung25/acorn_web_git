<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/pwd_updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>비밀번호 변경하기</h1>
		<form action="pwd_update.jsp" method="post">
			<label for="current_pwd"> 현재 비밀번호
				<input type="text" id="current_pwd" name="current_pwd"/ value="<%=dto.getPwd()%>" disabled>
			</label>
			<label for="update_pwd"> 수정할 비밀번호
				<input type="password" id="update_pwd" name="update_pwd" value="<%=dto.getPwd() %>"/>
			</label>
			<button type="submit"> 변경하기 </button>
		</form>
	</div>
</body>
</html>