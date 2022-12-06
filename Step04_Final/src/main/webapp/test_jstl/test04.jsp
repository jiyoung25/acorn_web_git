<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
	// test 를 위해 sample data 를 request 영역에 담기
	request.setAttribute("jumsu", 55);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/test04.jsp</title>
</head>
<body>
	<%-- c:if는 test안의 내용이 true면 출력을 하고 false면 출력을 하지 않는다. --%>
	<c:if test="true">
		<p>오잉 true네</p>
	</c:if>
	<c:if test="${ 10%2 eq 0 }">
		<p>10 은 짝수 입니다.</p>
	</c:if>
	
	<c:if test="${ 11%2 eq 0 }">
		<p>11 은 짝수 입니다.</p>
	</c:if>
	<c:if test="${jumsu%2 eq 0 }">
		<p>${jumsu } 는 짝수 입니다.</p>
	</c:if>
	
	<p> 획득한 점수는 <strong>${jumsu }</strong> 입니다.</p>
	<p>
		따라서 이번 학기 학점은
		<c:choose><%-- jstl의 if else문 --%>
			<c:when test="${jumsu ge 90 }">A</c:when>
			<c:when test="${jumsu ge 80 }">B</c:when>
			<c:when test="${jumsu ge 70}">C</c:when>
			<c:when test="${jumsu ge 60 }">D</c:when>
			<c:otherwise>F</c:otherwise>
		</c:choose>
		입니다
	</p>
	<p>
		<strong>${jumsu }</strong> 는
		<c:choose>
			<c:when test="${jumsu%2 eq 0}">
				짝수
			</c:when>
			<c:otherwise>
				홀수
			</c:otherwise>
		</c:choose>
		입니다.
	</p>
	<p>
		<c:choose>
			<c:when test="%{jumsu%2 eq 0}">
				jumsu는 짝수이다.
			</c:when>
			<c:otherwise>
				jumsu는 홀수이다.
			</c:otherwise>
		</c:choose>
	</p>
	<p>
		<c:choose>
			<c:when test="${jumsu gt 90 }">
				A학점입니다.
			</c:when>
			<c:when test="${jumsu gt 80 }">
				B학점입니다.
			</c:when>
			<c:when test="${jumsu gt 70 }">
				C학점입니다.
			</c:when>
			<c:when test="${jumsu gt 60 }">
				D학점입니다.
			</c:when>
			<c:otherwise>
				F입니다. 재수강하세요.
			</c:otherwise>
		</c:choose>
	</p>
	
	<%
		String id=(String)session.getAttribute("id");
	%>
	
	<%if(id == null){ %>
		<p> 로그인이 필요 합니다.</p>
	<%}else{ %>
		<p> <strong><%=id %></strong> 님 로그인중...</p>
	<%} %>
	
	<c:choose>
		<c:when test="${ empty id }">
			<p>로그인이 필요 합니다.</p>
		</c:when>
		<c:otherwise>
			<p> <strong>${id }</strong> 님 로그인중...</p>
		</c:otherwise>
	</c:choose>
</body>
</html>















