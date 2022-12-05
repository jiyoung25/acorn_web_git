<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   int num=Integer.parseInt(request.getParameter("num"));
	System.out.println("num: "+num);
   
   String id=(String)session.getAttribute("id");
   String writer=CafeDao.getInstance().getData(num).getWriter();
   System.out.println("writer: "+writer);

   if(!writer.equals(id)){
      response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의글 삭제하기 없기!");
      return;
   }
   
   CafeDao.getInstance().delete(num);

   String cPath=request.getContextPath();
   response.sendRedirect(cPath+"/cafe/list.jsp");
%>    