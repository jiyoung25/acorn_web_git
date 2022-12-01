<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signupform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="container">
		<h3>회원가입 폼입니다.</h3>
		<form action="signup.jsp" method="post" id="signupForm">
			<div class="mb-2">
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" 
					v-bind:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty}" 
					v-on:input="inputId" 
					type="text" 
					name="id" 
					id="id" />
				<small class = "form-text text-muted">영문자 소문자로 시작하고 5-10글자 이내로 입력하세요. 특수문자는 '-'와'_'만 가능합니다.</small>
				<div class="valid-feedback">이 아이디를 사용할 수 있습니다.</div>
				<div class="invalid-feedback">이 아이디는 사용할 수 없습니다.</div>
			</div>
			<div class="mb-2">
				<label class="control-label" for="nickname">닉네임</label>
				<input class="form-control" 
					v-bind:class="{'is-valid':isNickValid, 'is-invalid':!isNickValid && isNickDirty}" 
					v-on:input="inputNick"
					v-model ="nickname"
					type="text" 
					name="nickname" 
					id="nickname"
					v-bind:disabled="!isIdValid"	/>
				<small class = "form-text text-muted">닉네임을 비워둔 경우, 아이디가 닉네임이 됩니다.
					<br>5-10글자 이내로 입력해주세요. 특수문자는 '-'와'_'만 가능합니다.</small>
				<div class="valid-feedback">이 닉네임을 사용할 수 있습니다.</div>
				<div class="invalid-feedback">이 닉네임은 사용할 수 없습니다.</div>
			</div>
			<div class="mb-2">
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" 
					v-bind:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty}" 
					v-model="pwd" 
					v-on:input="inputPwd" 
					type="password" 
					name="pwd" 
					id="pwd" />
				<small class = "form-text text-muted">특수문자를 하나 이상 조합하세요.</small>
				<div class="invalid-feedback">비밀번호를 다시 확인해주세요.</div>
			</div>
			<div class="mb-2">
				<label class="control-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control"
					type="password" 
					v-model="pwd2" 
					v-on:input="inputPwd" 
					name="pwd2" 
					id="pwd2" />
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
				isNickValid: false,
				isPwdValid: false,
				isEmailValid: false,
				nickname:"",
				pwd:"",
				pwd2: "",
				email: "",
				isIdDirty:false,
				isNickDirty: false,
				isPwdDirty:false,
				isEmailDirty:false
			},
		
			computed:{
				isFormValid: function(){
					return this.isIdValid && this.isPwdValid && this.isEmailValid && this.isNickValid;
				}
			},
			methods:{
				inputId(e){
					const self = this; //자신의 참조값 담기
					self.isIdDirty = true;
					const inputId = e.target.value;
					const regId = /^[a-z][a-zA-Z0-9_\-]{5,10}$/;
					const isMatch = regId.test(inputId);
					if(!isMatch){
						return this.isIdValid = false;
					} else{
						fetch("checkId.jsp?inputId="+inputId)
						.then(function(response){
							return response.json();
						})
						.then(function(data){
							if(data.isExist){
								self.isIdValid = false;
						} else{
							self.isIdValid = true;
						}
					})
				}
			},
			
			inputNick(){
				const self = this; //자신의 참조값 담기
				self.isNickDirty = true;
				const inputNick = this.nickname;
				const regNick = /^[a-z][a-zA-Z0-9_\-]{5,10}$/;
				const isMatch = regNick.test(inputNick);
				if(inputNick==null){
					return this.nickname=this.id;	
				}
				if(!isMatch){
					return this.isNickValid = false;
					console.log("isNickValid: "+isNickValid);
				} else{
					fetch("checkNick.jsp?inputNick="+inputNick)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						if(data.isExist){
							self.isNickValid = false;
					} else{
						self.isNickValid = true;
					}
				})
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
			inputEmail(){
				app.isEmailDirty = true;
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
			
			onSubmit: function(e){
				if(!isValid){
					e.preventDefault();
				}
			}
		}
	})
</body>
</html>