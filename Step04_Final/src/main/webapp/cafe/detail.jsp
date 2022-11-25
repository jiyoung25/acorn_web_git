<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
	String writer = dto.getWriter();
	String title = dto.getTitle();
	String content = dto.getContent();
	int viewCount = dto.getViewCount()+1;
	String regdate = dto.getRegdate();
	
	CafeDao.getInstance().countUpdate(num,viewCount);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/post.jsp</title>
	<style>
		.content{
			border: 1px solid black
		}
	</style>
</head>
<body>
	<div class="container">
		<h3>글 상세보기</h3>
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
			 --%>
			<tr>
				<th>글 내용</th>
				<%-- <td><textarea rows="10" readonly><%=dto.getContent() %></textarea></td> --%>
				<%-- <td><pre><%=dto.getContent() %></pre></td> --%>
				<%-- <td><%=dto.getContent().replaceAll("\n", "<br>") %></td>--%>
				<td colspan = "2">
					<div><%=dto.getContent() %></div>
				</td>
			</tr>
		</table>
		<%
			//로그인된 아이디 ( null의 가능성 염두해두기 )
			String id = (String)session.getAttribute("id");
		%>
		<%--만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
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
		
		<a href="${pageContext.request.contextPath}/cafe/list.jsp">리스트 목록으로</a>
	</div>
	
</body>
</html>