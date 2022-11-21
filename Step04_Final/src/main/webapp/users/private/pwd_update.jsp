<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pwd = request.getParameter("update_pwd");
	String id = (String)session.getAttribute("id");
	boolean isSuccess = UsersDao.getInstance().update_pwd(id, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			alert("비밀번호를 성공적으로 수정했습니다.");
			location.href="${pageContext.request.contextPath}/users/private/info.jsp"
		<%} else{%>
			alert("비밀번호 수정에 실패했습니다.\n다시 시도해주세요.");
			location.href="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp"
		<%} %>
	</script>
</body>
</html>