<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //삭제할 글의 번호
   int num=Integer.parseInt(request.getParameter("num"));
	System.out.println("num: "+num);
   
   //글의 작성자가 로그인된 아이디와 같은지 확인해 보기
   String id=(String)session.getAttribute("id");
   String writer=CafeDao.getInstance().getData(num).getWriter();
   System.out.println("writer: "+writer);
   //글 작성자가 로그인된 아이디와 다르면
   if(!writer.equals(id)){
      response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의글 삭제하기 없기!");
      return;//메소드를 여기서 끝내기 
   }
   
   //DB 에서 삭제하고 
   CafeDao.getInstance().delete(num);
   //응답
   String cPath=request.getContextPath();
   response.sendRedirect(cPath+"/cafe/list.jsp");
%>    