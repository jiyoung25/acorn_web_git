<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//1. 폼에서 전송되는 아이디, 비밀번호, 이메일 주소를 읽어온다.
    	//2. UsersDto에 담는다.
    	//3. UsersDao를 이용해서 DB에 저장하고
    	//4. 결과를 응답한다.
    	
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
   		String pwd = request.getParameter("pwd");
    	String email = request.getParameter("email");
    	UsersDto dto =new UsersDto();
    	dto.setId(id);
    	dto.setPwd(pwd);
    	dto.setEmail(email);
    	boolean isSuccess = UsersDao.getInstance().insert(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<style>
		#profileImage{
			width : 50px;
			border-radius: 5px;
		}
		h3{
			text-align:center;
		}
	</style>
</head>
<body>
	<div class="container">
		<p>
			<%if(isSuccess){ %>
				<div class="container">
					<hr class="border border-info border-4 opacity-50">
					<h3>알림</h3>
					<hr class="border border-info border-4 opacity-50">
					<p><strong><%=id %></strong>님 가입되었습니다.</p>
					<a class="btn btn-success" href="loginform.jsp">로그인</a>
					<a class="btn btn-success" href="${pageContext.request.contextPath}">index로</a>
				</div>
				
			<%} else{ %>
				<hr class="border border-danger border-4 opacity-50">
				<h3>알림</h3>
				<hr class="border border-danger border-4 opacity-50">
				<p>회원가입에 실패하셨습니다.</p>
				<a class="btn btn-danger" href="signup_form.jsp">다시 가입하러 가기</a>
				<a class="btn btn-danger" href="${pageContext.request.contextPath}">index로</a>
			<%} %>
		</p>
	</div>
</body>
</html>