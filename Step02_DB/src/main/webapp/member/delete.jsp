<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   	//1. 회원 한 명의 정보를 삭제하기 (몇 번 회원을 삭제하지?)
   	
   	//2. 응답하기 (무슨 응답을 하면 적절할까?)
   	
   	
   	//get방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바꾸어준다.
   	request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("num"));
    MemberDto dto = new MemberDto();
    dto.setNum(num);
    boolean isSuccess = MemberDao.getInstance().delete(dto);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 페이지에 직접 문장을 출력해 응답 -->
	<%if(isSuccess){%>
		<p><%=num %>번 회원을 삭제했습니다.</p>
	<%} else{%>
		<p>회원 정보 삭제에 실패했습니다. 다시 시도해주세요.</p>
	<%}%>
	<a href="${pageContext.request.contextPath}/member/list.jsp">리스트로 돌아가기</a>

</body>
</html>