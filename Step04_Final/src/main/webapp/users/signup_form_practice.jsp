<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>/users/signup_form.jsp</title>
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
	<jsp:include page="/include/navbar.jsp"></jsp:include>
	<div class="container">
		<hr class="border border-info border-4 opacity-50">
		<h3>회원가입 폼입니다.</h3>
		<hr class="border border-info border-4 opacity-50">
		<form action="signup.jsp" mehthod="post" id="signupForm">
			<div>
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id" />
				<div class="valid-feedback">이 아이디를 사용할 수 있습니다.</div>
				<div class="invalid-feedback">이 아이디는 사용할 수 없습니다.</div>
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd" />
				<div class="invalid-feedback">비밀번호를 다시 확인해주세요.</div>
			</div>
			<div>
				<label class="control-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control" type="password" name="pwd2" id="pwd2" />
			</div>
			<div>
				<label class="control-label" for="email">이메일</label>
				<input class="form-control" type="text" name="email" id="email" />
				<div class="invalid-feedback">이메일 양식을 맞춰주세요.</div>
			</div>
			<button class="btn btn-outline-primary" type="submit">가입</button>
		</form>
	</div>
	<script>
		document.querySelector("#id").addEventListener("input",function(){
			
			const self=this;
			const inputId=self.value;
			self.classList.remove("is-invalid");
			self.classList.remove("is-valid");
			
			fetch("checkId_practice.jsp?inputId="+inputId)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				if(data.isExist){
					self.classList.add("is-invalid");
				} else{
					self.classList.add("is-valid");
				}
			})
			
		});
	</script>
</body>
</html>