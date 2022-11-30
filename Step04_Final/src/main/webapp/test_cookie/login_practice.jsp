<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//가상의 로그인페이지

	//체크박스를 체크한 상태로 로그인 버튼을 누르면 null이 아니다.(체크하지 않으면 null)
	String isSave = request.getParameter("isSave");
	System.out.println(isSave);
	if(isSave != null){
		//아이디 비밀번호를 쿠키로 응답하고 1주일동안 유지되도록 한다.
		String id = request.getParameter("id");
		Cookie cookId = new Cookie("cookId", id);
		String pwd = request.getParameter("pwd");
		Cookie cookPwd = new Cookie("cookPwd",pwd);
		
		cookId.setMaxAge(60*24*7);
		cookPwd.setMaxAge(60*24*7);
		
		response.addCookie(cookId);
		response.addCookie(cookPwd);
	} else{
		//특정 키값으로 저장된 쿠키값 삭제(value에는 아무 값이나 넣어도 상관이 없다.)
		Cookie cookId = new Cookie("cookId", "");
		Cookie cookPwd = new Cookie("cookPwd", "");
		cookId.setMaxAge(0);
		cookPwd.setMaxAge(0);
		response.addCookie(cookId);
		response.addCookie(cookPwd);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_cookie/login.jsp -쿠키테스트</title>
</head>
<body>
	<p>${param.id }님 로그인 되었습니다.</p>
	<a href="cookie_form3_practice.jsp">다시 테스트</a>
</body>
</html>