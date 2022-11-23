<!-- list.jsp -->

<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final int PAGE_ROW_COUNT = 5;
	int pageNum = 1;
	int startRowNum = 1+(pageNum-1) * PAGE_ROW_COUNT;
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	
	FileDto dto = new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
    List<FileDto> list = FileDao.getInstance().getList(dto);
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
                     <a href = "${pageContext.request.contextPath}/file/private/deleteform.jsp?num=<%=tmp.getNum()%>"/>삭제</a>
                  </td>
               </tr>
            <%}%>
         </tbody>
      </table>
   </div>
   <script>
	
   </script>
</body>
</html>