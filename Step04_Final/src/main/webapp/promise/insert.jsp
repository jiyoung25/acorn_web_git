<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//요청 파라미터 추출
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	//추출한 문자열을 콘솔창에 출력
	System.out.println(name+"|"+addr);
%>
{"isSuccess":true}  <%-- 마지막에 ; 붙이면 오류난다 --%>