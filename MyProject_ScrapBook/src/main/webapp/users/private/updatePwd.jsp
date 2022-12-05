<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String pwd = request.getParameter("pwd");
	boolean isSuccess = UsersDao.getInstance().updatePwd(pwd, id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/updatePwd2.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("비밀번호 변경에 성공했습니다.");
			location.href="${pageContext.request.contextPath}/users/private/info.jsp";
		</script>
	<%} else{ %>
		<script>
			alert("비밀번호 변경에 실패했습니다.\n다시 시도해주세요.");
			location.href="${pageContext.request.contextPath}/users/private/updatePwdForm.jsp";
		</script>
	<%} %>
</body>
</html>