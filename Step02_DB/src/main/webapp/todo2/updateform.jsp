<%@page import="test.todo.dao.TodoDao2"%>
<%@page import="test.todo.dto.TodoDto2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//수정할 회원의 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	//해당 할 일의 정보를 DB에서 불러오기
	TodoDto2 dto=TodoDao2.getInstance().getData(num);
	//수정할 수 있는 폼을 응답한다.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="update.jsp" method="post">
			<div>
				<label for="num">번호</label>
				<input type="text" name="num" id="num", value="<%=dto.getNum()%>" readonly/>
			</div>
				<label for="content">내용</label>
				<input type="text" name="content" id="contregdate",value="<%=dto.getNum()%>"/>
			</div>
			<div>
				<label for="regdate">등록일</label>
				<input type="text" name="regdate" id="regdate", value="<%=dto.getRegdate()%>"/>
			</div>
		</form>
	</div>

</body>
</html>