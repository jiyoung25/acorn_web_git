<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    
    int num = 0;
    String content = "";
    Date regdate = null;
    
    String[] nums = request.getParameterValues("num");
    String[] contents = request.getParameterValues("content");
    String[] regdates = request.getParameterValues("regdate");
    boolean[] isSuccesses = new boolean[nums.length];

    TodoDto dto = null;
	String[] msgs = new String[nums.length];  
	
	for(int i=0; i<nums.length; i++){
		
		num = Integer.parseInt(nums[i]);
		content = contents[i];
		try{
			regdate = Date.valueOf(regdates[i]);
		} catch(Exception e){
			e.printStackTrace();
		}
		dto = new TodoDto(num, content, regdate);
		
		isSuccesses[i]= TodoDao.getInstance().update(dto);
		
		
		if(isSuccesses[i]){
			msgs[i]=num+"번째 할 일의 수정에 성공했습니다.";
		} else{
			msgs[i] = num+"번째 할 일 수정에 실패했습니다.\n할 일을 필수로 적어주세요.";
		}
	}
	

	for(int i=0; i<nums.length; i++){

	}

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul>
			<%for(String tmp:msgs){%>
				<li><%=tmp %></li>
			<%}%>	
		</ul>
	</div>
	<div>
		<button type="button" onclick=location.href="${pageContext.request.contextPath}/todo/list.jsp">
			리스트로 돌아가기
		</button>
	</div>
</body>
</html>