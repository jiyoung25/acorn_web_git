<!-- deleteform -->

<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   int file_num = Integer.parseInt(request.getParameter("num"));
   
   FileDto file_dto = FileDao.getInstance().getData(file_num);
   String file_writer = file_dto.getWriter();
   System.out.println(file_writer);
   
   String user_id = (String)session.getAttribute("id");
   System.out.println(user_id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteform.jsp</title>
</head>
<body>
   <%if(file_writer.equals(user_id)){ %>
      <div class="container">
         <h3>비밀번호 확인</h3>
         <p><strong>확인을 누르면 게시물이 삭제됩니다.</strong></p>
         <form action="${pageContext.request.contextPath }/file/private/delete.jsp?" method="post">
            <label for="pwd">현재 비밀번호: </label>
            <input type="password" id = "pwd" name="check_pwd" />
            <input type="hidden" name="file_num" value="<%=file_num %>" />
            <button type="submit">확인</button>
         </form>
         <p><a href="${pageContext.request.contextPath }">인덱스로 돌아가기</a></p>
      </div>
   <%} else{%>
      <script>
         alert("자신의 게시물만 삭제할 수 있습니다.");
         location.href="../list.jsp";
      </script>
   <%} %>
</body>
