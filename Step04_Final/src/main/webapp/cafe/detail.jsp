<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
	String writer = dto.getWriter();
	String title = dto.getTitle();
	String content = dto.getContent();
	int viewCount = dto.getViewCount()+1;
	String regdate = dto.getRegdate();
	
	CafeDao.getInstance().addViewCount(num,viewCount);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/post.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<style>
		.content{
			border: 1px solid black
		}
		#profileImage{
			width : 50px;
			border-radius: 5px;
		}
		h3{
			text-align:center;
		}
	</style>
</head>
<body>
	<%if(id==null) {%>
		<jsp:include page="/include/navbar.jsp"></jsp:include>
	<%} else{ %>
		<jsp:include page="/include/navbar2.jsp"></jsp:include>
	<%} %>
	<div class="container">
		<hr class="border border-success border-4 opacity-50">
		<h3>글 상세보기</h3>
		<hr class="border border-success border-4 opacity-50">
		<table class="table table-light">
			<tr>
				<th>글 번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>
			<%--
				textarea를 이용해서 문자열을 입력받으면 tab 기호, 공백, 개행기호도 같이 입력받는다.
				해당 기호를 재현하는 방법은 3가지가 있다.
				1. textarea에 출력하기
				2. <pre></pre> 요소 안에 출력
				3. 개행기호를 찾아서 <br>로 대체
				4. div에 내용 넣기
			 --%>
			<tr class = "table-success">
				<th>글 내용</th>
				<%-- <td><textarea rows="10" readonly><%=dto.getContent() %></textarea></td> --%>
				<td><pre><%=dto.getContent() %></pre></td>
				<%-- <td><%=dto.getContent().replaceAll("\n", "<br>") %></td>--%>
				<%-- <td colspan = "2">
					<div><%=dto.getContent() %></div>
				</td> --%>
			</tr>
		</table>
		<%
			//위에 선언해둔 string id: 로그인된 아이디 ( null의 가능성 염두해두기 )
		%>
		<%--만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
		<%if(dto.getWriter().equals(id)){ %>
        	<a class="btn btn-success" href="private/updateform.jsp?num=<%=dto.getNum()%>">
        		수정
        		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
  					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  					<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
				</svg>	
        	</a>
       		<a class="btn btn-success" href="javascript:" onclick="deleteConfirm()">
       			삭제
       			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
 					<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  					<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
				</svg>
       		</a>
        	<script>
          		function deleteConfirm(){
              		const isDelete=confirm("이 글을 삭제 하겠습니까?");
             		if(isDelete){
                		location.href="private/delete.jsp?num=<%=dto.getNum()%>";
              		}
           		}
       		</script>
     	<%}%>
		
		<a class="btn btn-success" href="${pageContext.request.contextPath}/cafe/list.jsp">
			리스트 목록으로
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
			</svg>
		</a>
	</div>
	
</body>
</html>