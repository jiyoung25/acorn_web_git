<%@page import="test.category.dto.CategoryDto"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="test.category.dao.CategoryDao"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.cafe.dto.CafeDto"%>
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
	int totalRow = CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	System.out.println( Math.ceil(totalRow/PAGE_ROW_COUNT));

	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount; //보정
	}

	CafeDto dto = new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<CafeDto> list = null;
	List<CategoryDto> list1 = CategoryDao.getInstance().getData(1);
	List<CategoryDto> list2 = CategoryDao.getInstance().getData(2);
	List<CategoryDto> list3 = CategoryDao.getInstance().getData(3);
	
	String category = request.getParameter("category");
	if(category.equals("all")){
		list = CafeDao.getInstance().getRowList(dto);
	} else if(category.equals("dwell")){
		list = CafeDao.getInstance().getRowList(dto, 1);
	} else if(category.equals("space")){
		list = CafeDao.getInstance().getRowList(dto, 2);
	} else if(category.equals("atmosphere")){
		list = CafeDao.getInstance().getRowList(dto, 3);
	} else{
		list = CafeDao.getInstance().getRowList(dto, category);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>/cafe/list.jsp</title>
</head>
<body>
	
	<div class="container">
		<a href="${pageContext.request.contextPath}/cafe/private/insertform.jsp">새 글 작성</a>
		<h3>카페 글 목록입니다.</h3>
		<%if(category.equals("all")){%>
			<select name="category" id="category">
				<%for(int i=0; i<list1.size();i++){ %>
					<otpgroup label="<%=list1.get(i).getTab_name() %>">
						<%for(CategoryDto tmp:list1){%>
							<option value="<%=tmp.getNum() %>"><%=tmp.getTab_sub() %></option>
						<%} %>
					</otpgroup>
				<%} %>
			</select>
		<%} %>
		<table class = "table table-striped">
			<thead class = "table-dark">
				<tr>
					<th>글 번호</th>
					<th>카테고리</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%for(CafeDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=CategoryDao.getInstance().getData((tmp.getCategory())).getTab_name() %> > <%=CategoryDao.getInstance().getData((tmp.getCategory())).getTab_sub() %> </td>
						<td><%=tmp.getWriter() %></td>
						<td><a href = "${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=tmp.getNum() %>&category=<%=category%>"><%=tmp.getTitle() %></a></td>
						<td><%=tmp.getViewCount() %></td>
						<td><%=tmp.getRegdate() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<div class = "container-lg">
      		<nav>
      			<ul class="pagination">
      				<%if(startPageNum!=1){%>
      					<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=startPageNum -1%>">PREVIOUS</a></li>
      				<%} %>
      				<%for(int i=startPageNum; i<=endPageNum; i++){%>
      					<li class="page-item"><a class="page-link <%=pageNum == i? "active":"" %>" href="list.jsp?pageNum=<%=i%>&category=<%=category%>"><%=i %></a></li>
      				<%}%>
      				<%if(endPageNum<totalPageCount){ %>
      					<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=endPageNum +1%>">NEXT</a></li>
      				<%} %>
      			</ul>
      		</nav>
		</div>
		<a href="${pageContext.request.contextPath}">인덱스로</a>
	</div>
</body>
</html>