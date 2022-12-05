<%@page import="test.category.dao.CategoryDao"%>
<%@page import="test.category.dto.CategoryDto"%>
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
	
	String category = request.getParameter("category");
	String categoryName = CategoryDao.getInstance().getData(dto.getCategory()).getTab_name();
	String categorySub = CategoryDao.getInstance().getData(dto.getCategory()).getTab_sub();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/post.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h3>글 상세보기</h3>
		<%if(category.equals("dwell")){ %>
			<select name="category" id="category">
				<optgroup>
					<%for(CategoryDto tmp:CategoryDao.getInstance().g) %>
				</optgroup>
			</select>
		}
		<table>
			<tr>
				<th>글 번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td> <%=categoryName %> > <%=categorySub %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td>
					<pre><%=dto.getContent() %></pre>
				</td>
			</tr>
		</table>
		<%if(dto.getWriter().equals(id)){ %>
        	<a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
       		<a href="javascript:" onclick="deleteConfirm()">삭제</a>
        	<script>
          		function deleteConfirm(){
              		const isDelete=confirm("이 글을 삭제 하겠습니까?");
             		if(isDelete){
                		location.href="private/delete.jsp?num=<%=dto.getNum()%>";
              		}
           		}
       		</script>
     	<%}%>
		
		<a href="${pageContext.request.contextPath}/cafe/list.jsp?category=<%=category %>">리스트 목록으로</a>
	</div>
	
</body>
</html>