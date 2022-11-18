<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jsp=java server page -->

<title>fortune.jsp</title>
</head>
<body>

   <%
   String[] fortunes = { "동쪽으로 가면 귀인을 만나요",
         "오늘은 집에만 계세요", "너무 멀리가지 마세요",
         "오늘은 뭘해도 되는 날이에요",
         "로또가 당첨돼요" };
   
   //랜덤한 숫자 얻기
   Random ran = new Random();
   int ranNum = ran.nextInt(fortunes.length);
   %>
   <p>오늘의 운세 1: <%=fortunes[ranNum] %></p>;
   <p>오늘의 운세 2: <% out.print(fortunes[ranNum]); %></p>
   

</body>
</html>