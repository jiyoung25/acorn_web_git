<!-- update -->
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("num"));
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    MemberDto dto = new MemberDto(num, name, addr);
	boolean isSuccess = MemberDao.getInstance().update(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
	<p><%=num %>번 회원의 정보가 정상적으로 수정되었습니다.</p>
	<%} else{%>
	<p><%=num %>번 회원 정보 수정에 실패하였습니다. 다시 시도해주세요.</p>
	<%} %>
	<a href="${pageContext.request.contextPath}/member/list.jsp">목록으로 돌아가기</a>
</body>
</html>