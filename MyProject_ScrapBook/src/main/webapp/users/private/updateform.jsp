<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
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
<title>/users/private/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	#imageForm{
		display:none;
	}
	#profileImage_update{
      width: 100px;
      height: 100px;
      border: 1px solid #cecece;
      border-radius: 50%;
   }
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="container">
		<h3>개인정보 수정</h3>
		<a id="profileLink" href="javascript:">
           <%if(dto.getProfile() == null){%>
              <svg id="profileImage_update" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
              </svg>
           <%}else{ %>
              <img id="profileImage_update" src="${pageContext.request.contextPath }<%=dto.getProfile()%>"> %>
           <%} %>
        </a>
		<form action="update.jsp" method="post" id="updateForm">
			<input type="hidden" name="profile" 
            value="<%=dto.getProfile()==null ? "empty" : dto.getProfile()%>"/>
			<div>
				<label for="id">아이디</label>
				<input type="text" value="<%=id %>" disabled />
				<input type="hidden" name="id" value="<%=id %>" />
			</div>
			<div>
				<label for="id">닉네임</label>
				<input type="text" name="nickname" value="<%=dto.getNickname() %>" disabled/>
				<small class = "form-text text-muted">1-10글자 이내로 입력해주세요. 특수문자는 '-'와'_'만 가능합니다.</small>
				<button type="button" v-model="nickname" v-on:click="onCheck">닉네임 확인</button>
			</div>
			<div>
				<label for="id">이메일</label>
				<input type="text" name="email" value="<%=dto.getEmail() %>" />
			</div>
			<button type="submit">수정확인</button>
			<button type="reset">취소</button>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/users/private/info.jsp'">뒤로가기</button>
		</form>
		<form id="imageForm" action="profile_upload.jsp" method = "post" enctype = "multipart/form-data">
		 	프로필 사진
		 	<input type="file" id="image" name = "image" accept =".jpg, .png, .gif" />
		 	<button type="submit">업로드</button>
		</form>
	</div>
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
   	<script>
		//프로필 이미지 링크를 클릭하면 
		document.querySelector("#profileLink").addEventListener("click", function(){
		   // input type="file" 을 강제 클릭 시킨다. 
		   document.querySelector("#image").click();
		});
		//프로필 이미지를 선택하면(바뀌면) 실행할 함수 등록
		document.querySelector("#image").addEventListener("change", function(){
			//ajax 전송할 폼의 참조값 얻어오기
			const form=document.querySelector("#imageForm");
			//gura_util.js 에 있는 함수를 이용해서 ajax 전송하기 
			ajaxFormPromise(form)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
				document.querySelector("input[name=profile]").value=data.imagePath;
			   
				//img요소를 문자열로 작성한 다음
				let img=`<img id="profileImage_update" 
				   src="${pageContext.request.contextPath }\${data.imagePath}">`;
				//id가 profileLink인 요소의 내부(자식 요소)에 덮어쓰기 하면서 html형식으로 해석해주세요. 라는 뜻 
				document.querySelector("#profileLink").innerHTML=img;
			});
		});
      
   	</script>
   	<script>
   		<%--new Vue({
   			el:"#updateForm",
   			data:{
   				nickname:"",
   				isCheck:false
   			},
   			methods:{
   				onCheck:function(){
   					const self = this;
					self.isNickDirty = true;
					const inputNick = this.nickname;
					const regNick = /^[a-zA-Z0-9가-힣_\-]{0,10}$/;
					const isMatch = regNick.test(inputNick);
					if((inputNick != <%=dto.getNickname() %>)&&!isMatch){
						this.isCheck = false;
						return;
					} else{
						fetch("checkNick.jsp?inputNick="+inputNick)
						.then(function(response){
							return response.json();
						})
						.then(function(data){
							self.isCheck = !data.isExist;
						})
					}
   				}
   			}
   		})--%>
   	</script>
</body>
</html>