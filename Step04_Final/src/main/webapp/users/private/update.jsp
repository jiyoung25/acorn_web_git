<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 회원의 정보를 읽어와서
	String id=(String)session.getAttribute("id");
	String email=request.getParameter("email");
	String profile = request.getParameter("profile"); //값 없으면 null
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	
	//만일 profile이미지를 등록했다면 (profile이미지가 !empty)
	if(!profile.equals("empty")){
		//dto에 전송된 프로필 이미지 경로를 담아준다.
		dto.setProfile(profile);
	}
	
	//2.DB에 수정 반영
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
			alert("수정 실패");
			location.href="updateform.jsp";
		<%} %>
	</script>
</body>
</html>