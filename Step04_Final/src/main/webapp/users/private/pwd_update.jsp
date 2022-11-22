<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String id = (String)session.getAttribute("id");
	String pwd = request.getParameter("pwd");
	String newPwd = request.getParameter("newPwd");
	String newPwd2 = request.getParameter("newPwd2");
	System.out.println(id+pwd+newPwd+newPwd2);
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	
	boolean isSuccess= true;
	
	if(newPwd.equals(newPwd2)){
		isSuccess = UsersDao.getInstance().updatePwd(dto);
	} else{ %>
		<script>
			alert("비밀번호 수정에 실패했습니다.\n다시 시도해주세요.");
			location.href="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp"
		</script>
	<%}
	
	/*
		위의 정보를 이용해서 DB를 업데이트하는 UserDao에 메소드를 만들어보세요. (updatePwd())
		
		작업 성공 여부를 리턴받아서 성공이면 로그아웃 처리를 하고 다시 로그인하는 링크를 출력하고
		
		실패이면 비밀번호가 일치하지 않는다는 메시지를 띄우고 다시 비밀번호 수정폼으로 이동할 수 있도록 해보세요.
	*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p>
			비밀번호가 성공적으로 변경되었습니다.
			다시 로그인을 시도해주세요.
			<%session.removeAttribute("id"); %>
			<a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인하러 가기</a>
		</p>
	<%} else {%>
		<script>
			alert("비밀번호 수정에 실패했습니다.\n다시 시도해주세요.");
			location.href="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp"
		</script>
	<%} %>
</body>
</html>