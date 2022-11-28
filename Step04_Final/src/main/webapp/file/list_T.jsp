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
	<style>
		#profileImage{
			width : 50px;
			border-radius: 5px;
		}
		.pagination{
			justify-content: center;
		}
		h3{
			text-align: center;
		}
	</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
	<%if(id==null) {%>
		<jsp:include page="/include/navbar.jsp">
			<jsp:param value="file" name="thisPage"/>
		</jsp:include>
	<%} else{ %>
		<jsp:include page="/include/navbar2.jsp">
			<jsp:param value="file" name="thisPage"/>
		</jsp:include>
	<%} %>
	
   	<div class="container-lg list">
      	<a class="btn btn-primary" href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기
      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-vector-pen" viewBox="0 0 16 16">
 				<path fill-rule="evenodd" d="M10.646.646a.5.5 0 0 1 .708 0l4 4a.5.5 0 0 1 0 .708l-1.902 1.902-.829 3.313a1.5 1.5 0 0 1-1.024 1.073L1.254 14.746 4.358 4.4A1.5 1.5 0 0 1 5.43 3.377l3.313-.828L10.646.646zm-1.8 2.908-3.173.793a.5.5 0 0 0-.358.342l-2.57 8.565 8.567-2.57a.5.5 0 0 0 .34-.357l.794-3.174-3.6-3.6z"/>
				<path fill-rule="evenodd" d="M2.832 13.228 8 9a1 1 0 1 0-1-1l-4.228 5.168-.026.086.086-.026z"/>
			</svg>
      	</a>
      	<hr class="border border-warning border-4 opacity-50">
      	<h3>자료실 목록 보기</h3>
      	<hr class="border border-warning border-4 opacity-50">
      	<table class = "table table-striped">
         	<thead class = "table table-dark">
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
                     <a class="btn btn-dark" href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a>
                  </td>
                  <td><%=tmp.getFileSize() %></td>
                  <td><%=tmp.getRegdate() %></td>
                  <td>
                  	<%-- id는 null이 될 가능성이 있으므로, 글 작성자가 로그인된 아이디와 같을 때에만 삭제 링크를 제공한다. --%>
                  	<%if(tmp.getWriter().equals(id)){ %>
                     	<a class="btn btn-dark" href = "javascript:deleteConfirm(<%=tmp.getNum()%>)">
                     		삭제
                     		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
 								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  								<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
							</svg>
                     	</a>
                    <%} %>
                  </td>
               </tr>
            <%}%>
         </tbody>
      </table>
	</div>
	<div class = "container-lg">
      <nav>
      	<ul class="pagination" >
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
				location.href = "delete_T.jsp?num="+num;
			}
		}
   </script>
   <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>