<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/pwd_updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>비밀번호 수정 폼</h1>
		<form action="pwd_update.jsp" method = "post" id = "myForm">
			<div>
				<label for="pwd">기존 비밀번호</label>
				<input type="password" name="pwd" id="pwd" />
			</div>
			<div>
				<label for="newPwd">새 비밀번호</label>
				<input type="password" name="newPwd" id="newPwd" />
			</div>
			<div>
				<label for="newPwd2">새 비밀번호 확인</label>
				<input type="password" name="newPwd2" id="newPwd2" />
			</div>
			<button type="submit">수정하기</button>
			<button type="reset">리셋</button>
		</form>
		<script>
		//폼에 submit이벤트가 일어났을 떄 실행할 힘수를 등록하고
			document.querySelector("#myForm").addEventListner("submit", function(event){
				//폼 제출 막기
				//event.preventDefault();
				//새 비밀번호와 확인이 일치하면 폼 전송을 막는다.
				if(pwd1!=pwd2){
					alert("비밀번호를 확인하세요!");
					event.preventDefault();//폼 막기
					
					
				}
			});
		</script>
	</div>
</body>
</html>