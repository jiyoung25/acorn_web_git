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
	<div class="container">
		<hr class="border border-info border-4 opacity-50">
		<h3>회원가입 폼입니다.</h3>
		<hr class="border border-info border-4 opacity-50">
		<form action="signup.jsp" mehthod="post" id="signupForm" v-on:submit="onSubmit">
			<p>폼의 유효성 여부: {{isFormValid}}</p>
			<div class="mb-2">
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" v-bind:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty}" v-on:input="inputId" type="text" name="id" id="id" />
				<small class = "form-text text-muted">영문자 소문자로 시작하고 5-10글자 이내로 입력하세요.</small>
				<div class="valid-feedback">이 아이디를 사용할 수 있습니다.</div>
				<div class="invalid-feedback">이 아이디는 사용할 수 없습니다.</div>
			</div>
			<div class="mb-2">
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" v-bind:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty}" v-model="pwd" v-on:input="inputPwd" type="password" name="pwd" id="pwd" />
				<small class = "form-text text-muted">특수문자를 하나 이상 조합하세요.</small>
				<div class="invalid-feedback">비밀번호를 다시 확인해주세요.</div>
			</div>
			<div class="mb-2">
				<label class="control-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control" type="password" v-model="pwd2" v-on:input="inputPwd" name="pwd2" id="pwd2" />
			</div>
			<div class="mb-2">
				<label class="control-label" for="email">이메일</label>
				<input class="form-control" v-model ="email" v-bind:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty}" v-on:input="inputEmail" type="text" name="email" id="email" />
				<div class="invalid-feedback">이메일 양식을 맞춰주세요.</div>
			</div>
			<button id="signupBtn" class="btn btn-primary" type="submit" v-bind:disabled="!isFormValid">가입</button>
		</form>
	</div>
	<script>
	let app = new Vue({
		el: "#signupForm",
		data:{
			isIdValid: false,
			isPwdValid: false,
			isEmailValid: false,
			pwd:"",
			pwd2: "",
			email: "",
			isIdDirty:false,
			isPwdDirty:false,
			isEmailDirty:false
		},
		
		//컴퓨티드는 함수에서 리턴된 값이 바로 모델 역할을 하는 것이나 다름이 없다.
		computed:{
			isFormValid: function(){
				return this.isIdValid && this.isPwdValid && this.isEmailValid;
			}
		},
		methods:{
			inputId(e){
				const self = this; //자신의 참조값 담기
				//아이디를 한번이라도 입력하면
				self.isIdDirty = true;
				const inputId = e.target.value;
				console.log("inputId:"+inputId);
				const regId = new RegExp("^[a-z].{4,9}$");
				const isMatch = regId.test(inputId);
				if(!isMatch){
					return this.isIdValid = false;
					console.log("isIdValid: "+isIdValid);
				} else{
					fetch("checkId.jsp?inputId="+inputId)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						if(data.isExist){
							//여기서의 this는 fetch를 가리킨다.
							//1. 그러므로 inputId의 참조값을 담아둔 변수를 이용해야 한다.
							// --> self.isIdValid = false;
							//2. vue객체를 담아둔 변수를 이용해도 된다.
							//app.isIdValid = false;
							self.isIdValid = false;
							console.log("isIdValid: "+app.isIdValid);
						} else{
							self.isIdValid = true;
							console.log("isIdValid: "+app.isIdValid);
						}
					})
				}
			},
			inputPwd(){
				app.isPwdDirty = true;
				let pwd = this.pwd;
				console.log("pwd: "+pwd);
				let pwd2 = this.pwd2;
				console.log("pwd2: "+pwd2);
				let regPwd = /[\W]/;
				if(!regPwd.test(pwd)||!regPwd.test(pwd2)){
					return this.isPwdValid = false;
					console.log("isPwdValid: "+this.isPwdValid);
				} else{
					if(pwd!=pwd2){
						this.isPwdValid = false;
						console.log("isPwdValid: "+this.isPwdValid);
					} else{
						this.isPwdValid = true;
						console.log("isPwdValid: "+this.isPwdValid);
					}
				}
				
			},
			inputEmail(e){
				app.isEmailDirty = true;
				//let inputEmail = e.target.value;
				let inputEmail = this.email;
				console.log(inputEmail);
				let isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				let isHan = /[ㄱ-ㅎ가-힣]/g;
		        if (!isEmail.test(inputEmail) || isHan.test(inputEmail)) {
		        	this.isEmailValid = false;
		        	console.log("isEmailValid: "+this.isEmailValid);
				} else{
					this.isEmailValid = true;
					console.log("isEmailValid: "+this.isEmailValid);
				}
			},
			
			/* 폼 제출 막기 방법1. button요소의  속성으로 v-on:click = "submitForm" 해서 처리하기
			submitForm(e){
				let isFormValid = this.isIdValid && this.isPwdValid && this.isEmailValid;
				if(!isFormValid){
					e.preventDefault();
					alert("폼 양식을 다시 확인해주세요.");
				} else{
					e.submit();
				}
			}
			*/
			/* 폼 제출 막기 방법2. form에 v-on:submit
			onSubmit(e){
				console.log("submitIdValid: "+this.isIdValid+", submitPwdValid: "+this.isPwdValid+", submitEmailValid: "+this.isEmailValid)
				let isFormValid = isIdValid && this.isPwdValid && this.isEmailValid;
				if(!isFormValid){
					e.preventDefault();
					alert("폼 양식을 다시 확인해주세요.");
				} else{
					e.submit();
				}
			}*/
			
			/*폼 제출 막기 방법3. form에 v-on:submit + computed추가 ( true false값 자동반영)*/
			onSubmit: function(e){
				if(!isValid){
					e.preventDefault();
				}
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