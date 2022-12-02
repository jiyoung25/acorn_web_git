<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String paramId = request.getParameter("id");
	if(!id.equals(paramId)||paramId==null){ %>
		<script>
			alert("제대로 된 경로로 접근해주세요.");
			location.href="${pageContext.request.contextPath}";
		</script>
	<%		return;
	}
	String currentPwd = UsersDao.getInstance().getData(id).getPwd();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updatePwdForm.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="container">
		<h3>비밀번호 변경</h3>
		<form id="updatePwd" v-on:submit="onUpdatePwd">
			<div>
				<label for="currentPwd">현재 비밀번호</label>
				<input id="currentPwd" type="password" v-model="currentPwd" v-bind:class="{'is-invalid' : !currentCheck, 'is-valid' : currentCheck}" v-bind:disabled="!currentCheck" />
				<div class="invalid-feedback">비밀번호가 틀립니다.</div>
				<button type="button" v-on:click="checkPwd">확인하기</button>
			</div>
			<div>
				<label for="pwd">새 비밀번호</label>
				<input id="pwd" v-model="pwd" type="password" name="pwd" v-bind:disabled="currentCheck" />
				<small>특수문자를 하나 이상 포함해주세요.</small>
			</div>
			<div>
				<label for="pwd_check">새 비밀번호 확인</label>
				<input id="pwd_check" v-model="pwd_check" type="password" name="pwd_check" v-bind:disabled="currentCheck" />
			</div>
			<button v-bind:disabled="currentCheck" type="submit">변경하기</button>
		</form>
	</div>
	<script>
		new Vue({
			el : "#updatePwd",
			data : {
				currentPwd : "",
				currentCheck : true,
				pwd : "",
				pwd_check : ""
			},
			methods : {
				checkPwd: function(){
					if(this.currentPwd == "<%=currentPwd %>"){
						this.currentCheck = false;
					}
				},
				onUpdatePwd(e){
					if(this.pwd != this.pwd_check){
						e.preventDefault();
						alert("새 비밀번호와 새 비밀번호 확인을 일치시켜주세요.");
					} else{
						let regPwd = /[\W]/;
						if(!regPwd.test(pwd)){
							e.preventDefault();
							alert("특수문자를 하나 이상 입력해주세요.");
						} else{
							fetch("updatePwd.jsp")
							.then(function(response){
								return response.json();
							})
							.then(function(data){
								if(data.isSuccess){
									alert("비밀번호 변경에 성공했습니다.");
									location.href = "info.jsp";
								} else{
									alert("비밀번호 변경에 실패했습니다.\n다시 시도해주세요.");
									location.href = "updatePwdForm.jsp?id="+id;
								}
							})
						}
					}
				}
				
			}
		})
	</script>
</body>
</html>