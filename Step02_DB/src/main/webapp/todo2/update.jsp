<%@page import="test.todo.dao.TodoDao2"%>
<%@page import="test.todo.dto.TodoDto2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //수정할 할일의 번호와 내용을 읽어온다.
   request.setCharacterEncoding("utf-8");
   int num=Integer.parseInt(request.getParameter("num"));
   String content=request.getParameter("content");
   
   //TodoDto 에 담고
   TodoDto2 dto=new TodoDto2();
   dto.setNum(num);
   dto.setContent(content);
   
   //수정반영
   boolean isSuccess=TodoDao2.getInstance().update(dto);
   
   //응답
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
   <script>
      <%if(isSuccess){%>
         alert("수정 했습니다.");
         location.href="list.jsp";
      <%}else{%>
         alert("수정 실패!");
         location.href="updateform.jsp?num=<%=num %>";
      <%}%>
   </script>
</body>
</html>






