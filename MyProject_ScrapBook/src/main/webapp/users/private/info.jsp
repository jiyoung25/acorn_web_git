<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
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
    	System.out.println(dto.getNickname());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
</head>
<body>
	<div class="container">
		<h3>My information</h3>
		<div>
			<table>
				<tr>
					<td colspan="2">
						<%if(dto.getProfile() == null){%>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-bounding-box" viewBox="0 0 16 16">
  								<path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z"/>
  								<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							</svg>
						<%} else{
							dto.getProfile();
						} %>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=id %></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><%=dto.getNickname() %></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<% for(int i=0; i<dto.getPwd().length(); i++){%>
							*
						<%} %>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=dto.getEmail() %></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><%=dto.getRegdate() %></td>
				</tr>
			</table>
		</div>
		<button onclick="location.href='${pageContext.request.contextPath}/users/private/updatePwdForm.jsp?id=<%=id%>'">비밀번호 변경하기</button>
		<button onclick="location.href='${pageContext.request.contextPath}/users/private/updateform.jsp?id=<%=id%>'">개인정보 수정하기</button>
	</div>
</body>
</html>