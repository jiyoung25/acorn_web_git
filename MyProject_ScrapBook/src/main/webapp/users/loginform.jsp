<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = request.getParameter("url"); // /MyProject_ScrapBook/url
	System.out.println(url);
	
	if(url==null){
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
	
	Cookie[] cooks = request.getCookies();
	String cookId = "";
	boolean isIdChecked = false;
	for(Cookie tmp:cooks){
		if(tmp.getName().equals("cookId")){
			isIdChecked = true;
			cookId = tmp.getValue();
		}
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="container">
		<h1>로그인 폼</h1>
		<form action="login.jsp" method="post" id="loginForm">
			<input type="hidden" name="url" value="<%=url %>" />
			<div>
				<label class="form-label" for="id">아이디</label>
				<input class="form-control" type="text" value="<%=cookId %>" name="id" id="id" />
			</div>
			<div>
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd" />
			</div>
			<br>
			<button class="btn btn-primary" type="submit">로그인</button>
			<label>아이디 기억하기<input type="checkbox" value="true" name = "idCheck" v-bind:checked="isIdChecked"/></label>
		</form>
		<small><a href="signupform.jsp">회원가입 하러가기</a></small>
		<br />
		<small><a href="${pageContext.request.contextPath}">인덱스로 가기</a></small>
	</div>
	<script>
		new Vue({
			el:"#loginForm",
			data:{
				id:"",
				pwd:"",
				isIdChecked:<%=isIdChecked %>
			}
		})
	</script>
</body>
</html>