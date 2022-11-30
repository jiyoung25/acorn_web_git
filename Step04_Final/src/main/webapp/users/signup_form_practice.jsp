<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>/users/signup_form.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
			<button id="signupBtn" class="btn btn-outline-primary" type="submit">가입</button>
		</form>
	</div>
	<script>
	//융합 여부를 지정할 변수를 만들고 초기값 대입
		let isIdValid = false;
		let isPwddValid = false;
		let isEmailValid = false;
		
		$("#id").on("input", function(){
			const inputId = $(this).val();
			$(this).removeClass("is-invalid is-valid");
			
			$.ajax({
				url:"checkId_practice.jsp?inputId="+inputId,
				success: function(data){
					if(data.isExist){
						$("#id").addClass("is-invalid");
						isIdValid = false;
					} else{
						$("#id").addClass("is-valid");
						isIdValid =true;
					}
				}
			})
			console.log("isIdValid: "+isIdValid);
		})
		
		function checkPwd(){
			$("#pwd").removeClass("is-invalid is-valid");
			const inputPwd = $("#pwd").val();
			const inputPwd2 = $("#pwd2").val();
			
			if(inputPwd!=inputPwd2){
				isPwdValid=false;
				$("#pwd").addClass("is-invalid");
			} else{
				isPwdValid=true;
				$("#pwd").addClass("is-valid");
			}
			console.log("isPwdValid: "+isPwdValid);
		}
		
		$("#pwd, #pwd2").on("input",function(){
			checkPwd();
		})
		
		$("#email").on("input",function(){
			$(this).removeClass("is-valid is-invalid");
			let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			let isOk = reg.test($(this).val());
			if(isOk){
				isEmailValid=true;
				$(this).addClass("is-valid");
			} else{
				isEmailValid=false;
				$(this).addClass("is-invalid");
			}
			console.log("isEmailValid: "+isEmailValid);
		})
		
		$("#signupBtn").on("submit" , function(event){
			
			const isValid = isIdValid && isPwdValid && isEmailValid;
			console.log("isValid: "+isValid);
			
			event.preventDefault();
			if(isValid){
				this.submit();
			} else{
				alert("회원가입 폼 양식에 맞게 입력해주세요.");
			}
		})
		
		/*
		
		function checkPwd(){
			document.querySelector("#pwd").classList.remove("is-valid");
			document.querySelector("#pwd").classList.remove("is-invalid");
			const inputPwd = document.querySelector("#pwd").value;
			const inputPwd2 = document.querySelector("#pwd2").value;
			console.log("inputPwd: " +inputPwd);
			console.log("inputPwd2: " +inputPwd2);
			
			if(inputPwd==inputPwd2){
				document.querySelector("#pwd").classList.add("is-valid");
				isPwdValid=true;
			} else{
				document.querySelector("#pwd").classList.add("is-invalid");
				isPwdValid=false;
			}
			console.log("isPwdValid:"+isPwdValid);
		}
		
		document.querySelector("#pwd").addEventListener("input",function(){
			checkPwd();
		})
		document.querySelector("#pwd2").addEventListener("input",function(){
			checkPwd();
		})
		
		document.querySelector("#email").addEventListener("input", function(){
			this.classList.remove("is-valid");
			this.classList.remove("is-invalid");
			
			let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			const inputEmail = document.querySelector("#email").value;
			let isOk = reg.test(inputEmail);
			
			
			if(isOk){
				this.classList.add("is-valid");
				isEmailValid=true;
			} else{
				this.classList.add("is-invalid");
				isEmailValid=false;
			}
			console.log("isEmailValid:"+isEmailValid);
		
		})
		
		document.querySelector("#signupBtn").addEventListener("submit",function(event){
			const isValid = isIdValid&&isPwdValid&&isEmailValid;
			console.log("isValid: "+isValid)
			if(!isValid){
				event.preventDefault();
				alert("폼 양식을 제대로 확인해주세요.");
			}
			
			
		})*/
		
	</script>
</body>
</html>