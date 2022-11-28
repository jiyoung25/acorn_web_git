<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
	String thisPage=request.getParameter("thisPage");
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
	%>
    
	<nav class="navbar navbar-expand-lg bg-light">
  		<div class="container-fluid">
    		<a class="navbar-brand nav-link active" aria-current="page" href="${pageContext.request.contextPath}"><strong>Final
    			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-binoculars" viewBox="0 0 16 16">
  					<path d="M3 2.5A1.5 1.5 0 0 1 4.5 1h1A1.5 1.5 0 0 1 7 2.5V5h2V2.5A1.5 1.5 0 0 1 10.5 1h1A1.5 1.5 0 0 1 13 2.5v2.382a.5.5 0 0 0 .276.447l.895.447A1.5 1.5 0 0 1 15 7.118V14.5a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 14.5v-3a.5.5 0 0 1 .146-.354l.854-.853V9.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v.793l.854.853A.5.5 0 0 1 7 11.5v3A1.5 1.5 0 0 1 5.5 16h-3A1.5 1.5 0 0 1 1 14.5V7.118a1.5 1.5 0 0 1 .83-1.342l.894-.447A.5.5 0 0 0 3 4.882V2.5zM4.5 2a.5.5 0 0 0-.5.5V3h2v-.5a.5.5 0 0 0-.5-.5h-1zM6 4H4v.882a1.5 1.5 0 0 1-.83 1.342l-.894.447A.5.5 0 0 0 2 7.118V13h4v-1.293l-.854-.853A.5.5 0 0 1 5 10.5v-1A1.5 1.5 0 0 1 6.5 8h3A1.5 1.5 0 0 1 11 9.5v1a.5.5 0 0 1-.146.354l-.854.853V13h4V7.118a.5.5 0 0 0-.276-.447l-.895-.447A1.5 1.5 0 0 1 12 4.882V4h-2v1.5a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V4zm4-1h2v-.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5V3zm4 11h-4v.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5V14zm-8 0H2v.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5V14z"/>
				</svg></strong>
    		</a>
    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNavDropdown">
      			<ul class="navbar-nav">
        			<li class="nav-item">
          				<a class="nav-link" href="${pageContext.request.contextPath}/file/list_T.jsp">자료실</a>
        			</li>
       				<li class="nav-item">
          				<a class="nav-link" href="${pageContext.request.contextPath}/cafe/list.jsp">글 목록 보기</a>
  					</li>
        			<li class="nav-item dropdown">
          				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				회원 전용 공간
          				</a>
          				<ul class="dropdown-menu">
            				<li><a class="dropdown-item" href="${pageContext.request.contextPath}/private/study.jsp">공부</a></li>
            				<li><a class="dropdown-item" href="${pageContext.request.contextPath}/private/game.jsp">게임</a></li>
            				<li><hr class="dropdown-divider"></li>
          				</ul>
        			</li>
     			</ul>
     			<ul class="navbar-nav nav ms-auto">
     				<li class="nav-item dropdown">
          				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				<%if(dto.getProfile()==null){%>
								<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
        							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
        							<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
   								</svg>
							<%} else{%>
								<img id="profileImage" 
                     				src="${pageContext.request.contextPath }<%=dto.getProfile()%>">
							<%} %>
            				<strong><%=id %></strong>님 어서오세요
          				</a>
          				<ul class="dropdown-menu">
            				<li><a class="dropdown-item" href="${pageContext.request.contextPath}/users/private/info.jsp">개인 정보</a></li>
            				<li><a class="dropdown-item" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a></li>
          				</ul>
          			</li>
     			</ul>
   	 		</div>
		</div>
	</nav>