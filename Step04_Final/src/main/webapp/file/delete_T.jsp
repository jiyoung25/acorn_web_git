<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 삭제할 파일의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	System.out.println(request.getParameter("num"));
	//2. 해당 파일의 정보를 DB에서 읽어온다.
	FileDto dto = FileDao.getInstance().getData(num);
	
	//삭제 작업을 하기 전에 로그인된 아이디와 글 작성자가 같은지 확인해서 같을 때만 삭제하도록 한다.
	String id = (String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)){
		//sendError의 인자로 에러코드와 메시지 입력
		//금지된 요청이라고 에러메시지를 응답한다.
		response.sendError(HttpServletResponse.SC_FORBIDDEN,"남의 파일 지우면 혼난다!");
		return; //메소드 종료! 아래 코드가 실행되지 않는다.
	}
	//3. 파일시스템에서 파일을 삭제한다.(webapp/upload폴더에서 해당 파일을 삭제)
	String path = application.getRealPath("/upload") + File.separator + dto.getSaveFileName();
	//삭제할 파일의 전체 경로를 이용해서 File객체를 생성한 후 해당 파일을 삭제한다.
	File f = new File(path);
	f.delete();
	//4. DB에서도 해당 파일의 정보를 삭제한다.
	FileDao.getInstance().delete(num);
	//5. 응답하기
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/file/list_T.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/delete.jsp</title>
</head>
<body>

</body>
</html>