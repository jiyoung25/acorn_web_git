<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
	<div id="loginForm" class="container">
		<hr class="border border-info border-4 opacity-50">
		<h3>회원가입 폼입니다.</h3>
		<hr class="border border-info border-4 opacity-50">
		<form action="signup.jsp" mehthod="post" id="signupForm">
			<div>
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" v-bind:class="[isIdValid? 'is-valid': 'is-invalid']" v-on:input="inputId" type="text" name="id" id="id" />
				<small class = "form-text text-muted">영문자 소문자로 시작하고 5-10글자 이내로 입력하세요.</small>
				<div class="valid-feedback">이 아이디를 사용할 수 있습니다.</div>
				<div class="invalid-feedback">이 아이디는 사용할 수 없습니다.</div>
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" v-bind:class="[isPwdValid? 'is-valid': 'is-invalid']" v-on:input="inputPwd" type="password" name="pwd" id="pwd" />
				<small class = "form-text text-muted">특수문자를 하나 이상 조합하세요.</small>
				<div class="invalid-feedback">비밀번호를 다시 확인해주세요.</div>
			</div>
			<div>
				<label class="control-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control" v-bind:class="[isEmailValid? 'is-valid': 'is-invalid']" v-on:input="inputEmail" type="password" name="pwd2" id="pwd2" />
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
	new Vue({
		el: "#loginForm",
		data:{
			isIdValid: false,
			isPwdValid: false,
			isEmailValid: false
		},
		methods:{
			inputId(e){
				const inputId = e.target.value;
				console.log("inputId:"+inputId);
				const regId = new RegExp("^[a-z].{4,9}$");
				const isMatch = regId.test(inputId);
				if(!isMatch){
					isIdValid=false;
					return;
				} else{
					fetch("checkId.jsp?inputId="+inputId)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						if(data.isExist){
							isIdValid=false;
						} else{
							isIdValid=true;
						}
					})
				}
			},
			inputPwd(){
				
			},
			inputEmail(){
				
			}
		}
		
	})
	/*
	//융합 여부를 지정할 변수를 만들고 초기값 대입
		let isIdValid = false;
		let isPwddValid = false;
		let isEmailValid = false;
		
		
		
		$("#id").on("input", function(){
			const inputId = $(this).val();
			$(this).removeClass("is-invalid is-valid");
			
			//정규표현식을 통과하면 비동기식 응답을 받는 방법
			const regId=/^[a-z].{4,9}$/;
			const reg = new RegExp("^[a-z].{4,9}$"); //이렇게 해도 됨
			const isMatch = regId.test(inputId);
			if(!isMatch){
				isIdValid = false;
				$("#id").addClass("is-invalid");
				return;
			} else{
				$.ajax({
					url:"checkId.jsp?inputId="+inputId,
					success: function(data){
						console.log(data);
						if(data.isExist){
							isIdValid = false;
							$("#id").addClass("is-invalid");
						} else{
							isIdValid = true;
							$("#id").addClass("is-valid");
						}
					}
				})
			}
		})
		
		function checkPwd(){
			$("#pwd").removeClass("is-valid is-invalid");
			const pwd = $("#pwd").val();
			console.log("pwd: "+pwd);
			const pwd2 = $("#pwd2").val();
			console.log("pwd2: "+pwd2);
			
			//정규식 검증 후 비밀번호 비교
			let regPwd = /[\W]/;
			if(!regPwd.test(pwd)){
				isPwdValid = false;
				$("#pwd").addClass("is-invalid");
				return;
			} else{
				if(pwd==pwd2){
					isPwdValid = true;
					$("#pwd").addClass("is-valid");
				} else{
					isPwdValid = false;
					$("#pwd").addClass("is-invalid");
				}
			}
		}
		
		//선택자 다중선택 가능
		$("#pwd, #pwd2").on("input", function(){
			checkPwd();
		})
		
		$("#email").on("input",function(){
			$(this).removeClass("is-valid").removeClass("is-invalid");
			//$(this).removeClass("is-valid is-invalid"); <-도 가능하다. 스페이스로 클래스 구분 가능
			const inputEmail = $(this).val();
			
			//let reg = /@/;
			let reg = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			if(!reg.test(inputEmail)){
				$(this).addClass("is-invalid");
				isEmailValid = false;
			} else{
				$(this).addClass("is-valid");
				isEmailValid = true;
			}
		})
		
		$("#signupBtn").on("submit",function(){
			const isFormValid = isIdValid && isPwdValid && isEmailValid;
			if(!isFormValid){
				return false; //(jquery에서 submit 이벤트 리스너 함수 안에서 폼의 전송을 막는 방법)
			}
		})
		*/
			
	</script>
</body>
</html>