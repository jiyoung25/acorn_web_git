<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키에 저장된 아이디와 비밀번호를 담을 변수
	String cookId = "";
	String cookPwd = "";
	//쿠키에 저장된 값을 위의 변수에 저장하는 코드를 작성해 보세요.
	Cookie[] cookies = request.getCookies();
	for(Cookie tmp:cookies){
		if(tmp.getName().equals("cookId")){
			cookId = tmp.getValue();
			System.out.println("cookId: "+cookId);
		} else if(tmp.getName().equals("cookPwd")){
			cookPwd = tmp.getValue();
			System.out.println("cookPwd: "+cookPwd);
		}
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/cookie_form3_practice.jsp</title>
</head>
<body>
<form action="login_practice.jsp" method="post" >
	<table>
		<tr>
			<th><label for="id">아이디</label></th>
			<td><input type="text" name="id" id="id" value="${cookie.cookId.value }"/></td>
		</tr>
		<tr>
			<th><label for="pwd">비밀번호</label></th>
			<td><input type="password" name="pwd" id="pwd" value="${cookie.cookPwd.value }"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<label>
					<input type="checkbox" name="isSave" value="yes" ${not empty cookie.cookId? 'checked':'' }/>
					로그인 정보 저장
				</label>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><button type="submit">로그인</button></td>
		</tr>
	</table>
</form>
</body>
</html>