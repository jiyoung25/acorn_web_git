<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	String email=request.getParameter("email");
	String profile = request.getParameter("profile");
	String nickname = UsersDao.getInstance().getData(id).getNickname();
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setNickname(nickname);
	dto.setEmail(email);
	if(!profile.equals("empty")){
		dto.setProfile(profile);
	}
	
	boolean isSuccess = UsersDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){%>
			alert("수정했습니다.");
			location.href="info.jsp";
		<%} else{%>
			alert("수정에 실패했습니다.\n다시 시도해주세요.");
			location.href="updateform.jsp";
		<%} %>
	</script>
</body>
</html>