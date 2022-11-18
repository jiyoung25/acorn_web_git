<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int num=Integer.parseInt(request.getParameter("num"));
    MemberDto dto = new MemberDto();
    dto.setNum(num);
    MemberDao.getInstance().delete(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- javascript를 이용하여 응답 -->
	<script>
		alert("<%=num %>번 회원을 삭제했습니다.");
		//javascript를 활용한 페이지 이동(웹브라우저가 새로운 경로로 요청을 다시하도록 한다.)
		location.href="${pageContext.request.contextPath}/member/list.jsp";
	</script>

</body>
</html>