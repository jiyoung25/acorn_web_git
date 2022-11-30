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
				<div class="valid-feedback">사용 가능한 아이디입니다.</div>
				<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd" />
				<div class="invalid-feedback">비밀번호를 확인하세요.</div>
			</div>
			<div>
				<label class="control-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control" type="password" name="pwd2" id="pwd2" />
			</div>
			<div>
				<label class="control-label" for="email">이메일</label>
				<input class="form-control" type="text" name="email" id="email" />
				<div class="invalid-feedback">이메일 양식을 지켜주세요.</div>
			</div>
			<button class="btn btn-outline-primary" type="submit">가입</button>
		</form>
	</div>
	<script>
		//유효성 여부를 저장할 변수를 만들고 초기값 대입하기 (form 제출 시 사용할 예정)
		let isIdValid=false;
		let isPwdValid=false;
		let isEmailValid=false;
		
		//input시마다 id가 유효한지 판단
		//#id에 input할 때마다
		document.querySelector("#id").addEventListener("input",function(){
			//1. 입력한 아이디를 읽어와서 (input요소의 참조값을 self에 미리 담아두기)
			this.classList.remove("is-valid");
         	this.classList.remove("is-invalid");
			const self=this;
			const inputId=self.value;
			//2. 서버에 페이지 전환 없이 전송을 하고 응답을 받는다.
			fetch("checkId.jsp?inputId="+inputId)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				//3. 사용 가능 여부에 따라 아이디 입력란에 클래스의 속성 is-valid or is-invalid를 적절히 추가·제거 한다.
				if(data.isExist){
					self.classList.remove("is-valid");
					self.classList.add("is-invalid");
					isIdValid=false;
					console.log("isIdValid: "+isIdValid);
				} else{
					self.classList.remove("is-invalid");
					self.classList.add("is-valid");
					isIdValid=true;
					console.log("isIdValid: "+isIdValid);
				}
			});
		})
		
		//입력시마다 pwd가 유효한지 판단
		function checkPwd(){
			const pwd=document.querySelector("#pwd").value;
			const pwd2=document.querySelector("#pwd2").value;
			
			if(pwd!=pwd2){
				document.querySelector("#pwd").classList.remove("is-valid");
				document.querySelector("#pwd").classList.add("is-invalid");
				isPwdValid=false;
			} else{
				document.querySelector("#pwd").classList.remove("is-invalid");
				document.querySelector("#pwd").classList.add("is-valid");
				isPwdValid=true;
			}
		}
		
		document.querySelector("#pwd").addEventListener("input",function(){
			checkPwd();
		})
		document.querySelector("#pwd2").addEventListener("input",function(){
			checkPwd();
		})
		
		//email이 유효한지 판단
		document.querySelector("#email").addEventListener("input", function(){
         	this.classList.remove("is-valid");
         	this.classList.remove("is-invalid");
         	//입력한 이메일
         	const inputEmail=this.value;
         	//이메일을 검증할 정규 표현식  
         	const reg=/@/;
         	//만일 입력한 이메일이 정규표현식 검증을 통과하지 못했다면
         	if(!reg.test(inputEmail)){
         	   	this.classList.add("is-invalid");
         	   	isEmailValid=false;
         	}else{
         		//만일 입력한 이메일이 정규표현식 검증을 통과했다면
         	   	this.classList.add("is-valid");
				isEmailValid=true;
         	}
      	});
		
		//유효성 여부 검사
		//폼에 submit 이벤트가 일어났을 때 실행할 함수 등록
		document.querySelector("#signupForm").addEventListener("submit",function(event){
			//아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증 결과를 고려해서 조건부로 실행되도록 해야 한다.
			<%-- 일단 폼 전송부터 막아두고, class에 is-invalid가 있는지 일일이 확인하는 방법
			event.preventDefault(); //폼 전송 막기
			if(document.querySelector("#id").classList.value.includes("is-invalid")||
					document.querySelector("#pwd").classList.value.includes("is-invalid")||
					document.querySelector("#email").classList.value.includes("is-invalid")
			){
				alert("회원가입 폼을 다시 한번 확인해주세요.");
			} else{
				this.submit();
			}
			--%>
			
			<%-- 위에서 true or false를 변수에 담아놓고 valid를 확인하는 방법 --%>
			//폼 전체의 유효성 여부
			const isFormValid = isEmailValid&&isIdValid&&isPwdValid;
			console.log(isFormValid);
			if(!isFormValid){
				alert("회원가입 양식을 다시 확인해주세요.");
				event.preventDefault(); //폼 전송 막기
			}
		});
	</script>
</body>
</html>