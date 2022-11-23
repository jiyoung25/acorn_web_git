<!-- delete.jsp -->

<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String check_pwd = request.getParameter("check_pwd");
   String user_id = (String)session.getAttribute("id");
   int file_num = Integer.parseInt(request.getParameter("file_num"));
   
   UsersDto dto = UsersDao.getInstance().getData(user_id);
   String user_pwd = dto.getPwd();
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/delete.jsp</title>
</head>
<body>
   <%if(user_pwd.equals(check_pwd)){%>
      <% boolean isSuccess = FileDao.getInstance().delete(file_num);
         if(isSuccess){%>
            <%String cPath=request.getContextPath();
            response.sendRedirect(cPath+"/file/list.jsp");%>
         <%} else{%>
            <script>
               alert("파일 삭제에 실패했습니다.\n다시 시도해주세요.");
               location.href="${pageContext.request.contextPath}/file/list.jsp";
            </script>
            <%}%>
      <%} else{%>
         <script>
            alert("비밀번호를 다시 확인해주세요.");
            location.href="${pageContext.request.contextPath}/file/private/deleteform.jsp?num=<%=file_num%>";
         </script>
      <%}%>
</body>
</html>