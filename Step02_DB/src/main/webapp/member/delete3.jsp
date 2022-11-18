<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int num=Integer.parseInt(request.getParameter("num"));
    MemberDto dto = new MemberDto();
    dto.setNum(num);
    MemberDao.getInstance().delete(dto);
    
    /**/
    //별다른 메시지를 띄우지 않고 HttpServletResponse객체를 이용해 강제로 웹페이지의 경로를 이동시키는 것으로 응답하기.
    /*
    	요청을 한 클라이언트의 웹브라우저에게 새로운 경로로 요청을 다시하라고 강요하는 응답을 HttpServletResponse객체를 이용해서 할 수 있다.
    	이것이 바로 Redirect응답이다.
    	리다이랙트 응답은 "새로운 경로로 요청을 다시 하라고 강요"하는 응답이다.
    	절대경로로 사용하는 것이 좋다.
    	이것 자체가 응답이기 때문에 아래의 html형식의 문자열은 의미가 없다.
    */
    
    
    //${pageContext.request.contextPath}(EL)은 html영역에서 읽히는 것이지, java영역에서 읽히는 문자가 아니다
    //그렇다고 상대 경로(/Step02_DB/)는 좋지 않다.
    //java code영역에서 context path는 HttpSelvletRequest객체의 메소드를 이용해서 얻어낸다.
    String cPath=request.getContextPath();
    response.sendRedirect(cPath+"/member/list.jsp");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>