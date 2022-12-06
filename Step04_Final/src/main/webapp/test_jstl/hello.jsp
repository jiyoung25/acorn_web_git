<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	[ taglib ]
	
	uri="import할 library의 종류"
	prefix="해당 library를 사용할 접두어 설정"
	
	만일 접두어를 prefix="gura"라고 설정한다면
	jsp페이지에서 <gura:xxx>형태의 tag를 사용할 수 있다.
	
	위의 설정(이 jsp파일)에서는 prefix="c"라고 설정했기 때문에 (core library라는 의미에서 c)
	<c:xxx>형태의 tag를 jsp페이지 내에서 사용할 수 있다.
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/hello.jsp</title>
</head>
<body>
	<h1> jstl의 core library 사용해보기 </h1>
	<c:forEach var="i" begin="0" end="9" step="1">
		<p>안녕 jstl <strong>${i }</strong></p>
	</c:forEach>
	<h1>jstl을 사용하지 않고 javacode를 활용해서 위와 같은 동작을 해보세요.</h1>
	<%for(int i=0; i<10; i++){ %>
		<p>안녕 jstl <strong><%=i %></strong></p>
	<%} %>
</body>
</html>