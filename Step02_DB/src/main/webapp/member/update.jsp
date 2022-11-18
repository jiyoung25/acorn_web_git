<!-- 수업시간 update -->
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //1. 폼에서 전송되어 온 수정할 회원의 정보를 읽어온다.
    request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("num"));
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");
    //회원 한 명의 정보를 MemberDto객체에 담는다.
    MemberDto dto = new MemberDto(num, name, addr);
    
    //2. MemberDao객체를 이용해서 DB에 저장한다.
    boolean isSuccess = MemberDao.getInstance().update(dto);
    
    //3. 응답한다.
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
	<%--방법1. 웹페이지에 띄우기
	<%if(isSuccess){ %>
	<p><%=num %>번 회원의 정보가 정상적으로 수정되었습니다.</p>
	<%} else{%>
	<p><%=num %>번 회원 정보 수정에 실패하였습니다. 다시 시도해주세요.</p>
	<%} %>
	<a href="${pageContext.request.contextPath}/member/list.jsp">목록으로 돌아가기</a>
	--%>
	 
	<%--방법2. javascript 이용하기 --%>
		<%if(isSuccess){ %>
		<script>
			alert("<%=num%>번 회원의 정보를 수정했습니다.");
			location.href="list.jsp";
		</script>
	<%} else{%>
		<script>
			alert("수정 실패!");
			location.href="updateform.jsp?num=<%=num%>";
		</script>
	<%} %>
	<a href="${pageContext.request.contextPath}/member/list.jsp">목록으로 돌아가기</a>
	--%>
</body>
</html>