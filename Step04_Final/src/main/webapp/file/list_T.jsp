<!-- list.jsp -->

<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디를 읽어온다. // id는 null일 가능성도 있다. (로그인하지 않고 접근 가능한 주소임)
	String id = (String)session.getAttribute("id");
	
	List<FileDto> list = FileDao.getInstance().getList();

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
</head>
<body>
   <div class="container">
      <a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
      <h3>자료실 목록 보기</h3>
      <table>
         <thead>
            <tr>
               <th>번호</th>
               <th>작성자</th>
               <th>제목</th>
               <th>파일명</th>
               <th>크기</th>
               <th>등록일</th>
               <th>삭제</th>
            </tr>
         </thead>
         <tbody>
            <%for(FileDto tmp:list){%>
               <tr>
                  <td><%=tmp.getNum() %></td>
                  <td><%=tmp.getWriter() %></td>
                  <td><%=tmp.getTitle() %></td>
                  <td>
                     <a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a>
                  </td>
                  <td><%=tmp.getFileSize() %></td>
                  <td><%=tmp.getRegdate() %></td>
                  <td>
                  	<%-- id는 null이 될 가능성이 있으므로, 글 작성자가 로그인된 아이디와 같을 때에만 삭제 링크를 제공한다. --%>
                  	<%if(tmp.getWriter().equals(id)){ %>
                     	<a href = "javascript:deleteConfirm(<%=tmp.getNum()%>)">삭제</a>
                    <%} %>
                  </td>
               </tr>
            <%}%>
         </tbody>
      </table>
   </div>
   <script>
		function deleteConfirm(num){
			let isDelete = confirm("삭제하시겠습니까?");
			if(isDelete){
				location.href = "delete_T.jsp? num="+num;
			}
		}
   </script>
</body>
</html>