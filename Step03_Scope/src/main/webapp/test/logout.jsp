<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//nick이라는 key값으로 저장된 값을 session영역에서 삭제하기
	session.removeAttribute("nick");
	
	//session영역 초기화
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>로그아웃 했습니다.</p>
	<a href="${pageContext.request.contextPath}">인덱스로 가기</a>
</body>
</html>