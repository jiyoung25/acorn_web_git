<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

	List<CafeDto> list = CafeDao.getInstance().getRowList(dto);
	
	//JSTL + EL을 테스트하기 위해서 필요한 값을 request영역에 담기
	//list라는 키값으로 request scope에 담기
	request.setAttribute("list", list);
	//페이징 처리에 필요한 값을 request scope에 담기
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("startPageNum", startPageNum);
	request.setAttribute("endPageNum", endPageNum);
	request.setAttribute("totalPageCount", totalPageCount);
	//아래의 jsp페이지에서 java code를 모두 EL과 JSTL을 활용한 코드로 바꿔보세요.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list2.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
</head>
<body>
<%-- 
	<%if(id==null) {%>
		<jsp:include page="/include/navbar.jsp">
			<jsp:param value="cafe" name="thisPage" />
		</jsp:include>
	<%} else{ %>
		<jsp:include page="/include/navbar2.jsp">
			<jsp:param value="cafe" name="thisPage" />
		</jsp:include>
	<%} %>--%>
	
	<%-- 페이지를 include시킬 때에는 WEB-INF폴더에 있는 페이지도 include가 가능하다.(client와 상관이 없는 이동이기 때문에. servlet->jsp로 forward시킬 때와 마찬가지임--%>
	<jsp:include page="/WEB-INF/include/navbar.jsp">
		<jsp:param value="cafe" name="thisPage" />		
	</jsp:include>
	
	<div class="container">
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/cafe/private/insertform.jsp">새 글 작성
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-vector-pen" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M10.646.646a.5.5 0 0 1 .708 0l4 4a.5.5 0 0 1 0 .708l-1.902 1.902-.829 3.313a1.5 1.5 0 0 1-1.024 1.073L1.254 14.746 4.358 4.4A1.5 1.5 0 0 1 5.43 3.377l3.313-.828L10.646.646zm-1.8 2.908-3.173.793a.5.5 0 0 0-.358.342l-2.57 8.565 8.567-2.57a.5.5 0 0 0 .34-.357l.794-3.174-3.6-3.6z"/>
  				<path fill-rule="evenodd" d="M2.832 13.228 8 9a1 1 0 1 0-1-1l-4.228 5.168-.026.086.086-.026z"/>
			</svg>
		</a>
		<hr class="border border-warning border-4 opacity-50">
		<h3>카페 글 목록입니다.</h3>
		<hr class="border border-warning border-4 opacity-50">
		<table class = "table table-striped">
			<thead class = "table-dark">
				<tr>
					<th>글 번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.getNum() }</td>
						<td>${tmp.writer }</td>
						<td><a href="${pageContext.request.contextPath}/cafe/detail.jsp?num=${tmp.num}">${tmp.title }</a></td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
				<%--<%for(CafeDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td><a class="btn btn-dark" href = "${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
						<td><%=tmp.getViewCount() %></td>
						<td><%=tmp.getRegdate() %></td>
					</tr>
				<%} %> --%>
			</tbody>
		</table>
	<div class = "container-lg">
      <nav>
      	<ul class="pagination">
      		<c:if test="${startPageNum ne 1 }">
      			<li class="page-item"><a href="list.jsp?pageNum=${startPageNum - 1}" class="page-link">PREVIOUS</a></li>
      		</c:if>
      		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
      			<li class="page-item ${pageNum == i? 'active':'' }">
      				<a href="list2_jstl.jsp?pageNum=${i }" class="page-link ">${i }</a>
      			</li>
      		</c:forEach>
      		<c:if test="${endPageNum lt totalPageCount }">
      			<li class="page-item"><a href="list.jsp?pageNum=${endPageNum +1}" class="page-link">Next</a></li>
      		</c:if>
      		<%--<%if(startPageNum!=1){%>
      			<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=startPageNum -1%>">PREVIOUS</a></li>
      		<%} %>
      		<%for(int i=startPageNum; i<=endPageNum; i++){%>
      			<li class="page-item"><a class="page-link <%=pageNum == i? "active":"" %>" href="list.jsp?pageNum=<%=i%>"><%=i %></a></li>
      		<%}%>
      		<%if(endPageNum<totalPageCount){ %>
      			<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=endPageNum +1%>">NEXT</a></li>
      		<%} %> --%>
      	</ul>
      </nav>
	</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>