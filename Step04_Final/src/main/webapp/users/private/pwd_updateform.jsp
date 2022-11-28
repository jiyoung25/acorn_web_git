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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<style>
		h1{
			text-align:center;
		}
		#profileImage{
			width : 50px;
			border-radius: 5px;
		}
	</style>
<title>users/private/pwd_updateform.jsp</title>
</head>
<body>
	<jsp:include page="/include/navbar2.jsp"></jsp:include>
	<div class="container">
		<hr class="border border-dark border-4 opacity-50">
		<h1>비밀번호 수정 폼</h1>
		<hr class="border border-dark border-4 opacity-50">
		<form action="pwd_update.jsp" method = "post" id = "myForm">
			<div class = "input-group mb-3">
				<span class="input-group-text" id="basic-addon1">기존 비밀번호</span>
				<input class="form-control" type="password" name="pwd" id="pwd" />
			</div>
			<div class = "input-group mb-3">
				<span class="input-group-text" id="basic-addon1">새 비밀번호</span>
				<input class="form-control" type="password" name="newPwd" id="newPwd" />
			</div>
			<div class = "input-group mb-3">
				<span class="input-group-text" id="basic-addon1">새 비밀번호 확인</span>
				<input class="form-control" type="password" name="newPwd2" id="newPwd2" />		
			</div>
			<button class="btn btn-secondary" type="submit">수정하기</button>
			<button class="btn btn-secondary" type="reset">입력취소</button>
			<button class="btn btn-secondary" type="button" onclick="location.href='${pageContext.request.contextPath}/users/private/info.jsp'">뒤로가기</button>
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
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>