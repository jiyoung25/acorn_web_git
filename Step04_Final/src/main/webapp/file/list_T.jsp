<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT = 5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT = 5;
	
	//보여줄 페이지 번호 지정 (일단 초기화 페이지는 1)
	int pageNum = 1;
	
	//페이지 번호가 전달되는 파라미터로 전달되는지 읽어와본다.
	String strPageNum = request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum = Integer.parseInt(strPageNum);
	}
	
	int startRowNum = 1+(pageNum-1) * PAGE_ROW_COUNT;
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	
	//하단의 시작/끝 번호 
	int startPageNum = 1+ ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT; // int/int의 값은 int형으로 나온다.
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	//전체 글의 개수
	int totalRow = FileDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	System.out.println( Math.ceil(totalRow/PAGE_ROW_COUNT));
	
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount; //보정
	}
	
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
   <div class="container-lg list">
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
	<div class = "container-lg">
      <nav>
      	<ul class="pagination">
      		<%if(startPageNum!=1){%>
      			<li class="page-item"><a class="page-link" href="list_T.jsp?pageNum=<%=startPageNum -1%>">PREVIOUS</a></li>
      		<%} %>
      		<%for(int i=startPageNum; i<=endPageNum; i++){%>
      			<li class="page-item"><a class="page-link <%=pageNum == i? "active":"" %>" href="list_T.jsp?pageNum=<%=i%>"><%=i %></a></li>
      		<%}%>
      		<%if(endPageNum<totalPageCount){ %>
      			<li class="page-item"><a class="page-link" href="list_T.jsp?pageNum=<%=endPageNum +1%>">NEXT</a></li>
      		<%} %>
      	</ul>
      </nav>
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