<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   <%--fmt: format(숫자 형식) --%>   <%-- fmt: xxx>의 형태로 사용 --%><
<%
	//sample 데이터
	request.setAttribute("size", 123456789);
	request.setAttribute("price", 2500000);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test05.jsp</title>
</head>
<body>
	<p>
		파일의 크기는 
		<fmt:formatNumber value="123456789" pattern="#,###"/> <%-- 3자리마다,를 찍고싶습니다. --%>
		byte 입니다.
	</p>
	<p>
		파일의 크기는 
		<fmt:formatNumber value="${size }" pattern="#,###"/>
		byte 입니다.
	</p>
	<p>
		가격은
		<fmt:formatNumber value="2500000" type="currency"/> <%--currency: 화폐 (type을 currency라고 하면 알아서 3자리마다 , 찍어줌) --%>
		입니다.
	</p>
	<p>
		가격은
		<fmt:formatNumber value="${price }" type="currency"/>
		입니다.
	</p>
	<p>
		가격은
		<fmt:formatNumber value="${price }" type="currency" currencySymbol="$"/><%-- currencySymbol default: \ (w에 ㅡ그어진거) --%>
		입니다.
	</p>
</body>
</html>










