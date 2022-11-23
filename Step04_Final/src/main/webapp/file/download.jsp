<%@page import="java.io.File"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="application/octet-stream; charset=UTF-8" pageEncoding="UTF-8"%>
 <%-- 원래 contentType은 /*text/html;이다. html로 읽어줘!
 	application/octet-stream으로 file관련 작업을 한다는 것을 미리 webserver에 알려준다.
  --%>
<%
	//1. GET 방식 파라미터로 전달되어 온, 다운로드 시켜줄 파일의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	/*
		2. DB에서 다운로드 시켜줄 파일의 정보를 읽어온다.
		  어떤 파일 명으로 upload폴더에 저장되어있는지 => saveFileName
		  업로드 당시 원본 파일명은 무엇이었는지 =>orgFileName
		  파일의 사이즈는 어떻게 되는지 => fileSize
		-다운로드 시켜주기 위해서는 위의 3가지 정보가 필요하다.
	*/
	System.out.println(num);
	FileDto dto = FileDao.getInstance().getData(num);
	System.out.println(dto.getNum());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file/download.jsp</title>
</head>
<body>
	<%
	   //3. 서버의 파일시스템(upload) 에 저장된 파일에서 바이트 알갱이를 읽어서 출력한다(다운로드)
	   String orgFileName=dto.getOrgFileName();
	   String saveFileName=dto.getSaveFileName();
	   //다운로드 시켜줄 파일의 실제 경로 구성하기 
	   String path=application.getRealPath("/upload") + File.separator + saveFileName;
	   System.out.println(File.separator);  // File.separator 은 / \ |이런거다. linux window 등의 운영체제에 따라 separator가 다르다.
	   //다운로드할 파일에서 읽어들일 스트림 객체 생성하기
	   FileInputStream fis=new FileInputStream(path);
	   //다운로드 시켜주는 작업을 한다. (실제 파일 데이터와 원본파일명을 보내줘야한다.)
	   //다운로드 시켜주는 작업을 한다. 
	   String encodedName=null;
	   
	   //한글 파일명 세부처리 
	   if(request.getHeader("User-Agent").contains("Firefox")){
	      //벤더사가 파이어 폭스인경우 
	      encodedName=new String
	         (orgFileName.getBytes("utf-8"),"ISO-8859-1");
	   }else{ //그외 다른 벤더사 
	      encodedName=URLEncoder.encode(orgFileName, "utf-8");
	      //파일명에 공백이있는 경우 처리 
	      encodedName=encodedName.replaceAll("\\+"," ");
	   }
	   
	   //응답 헤더 정보 설정
	   response.setHeader("Content-Disposition","attachment;filename="+encodedName);
	   response.setHeader("Content-Transfer-Encoding", "binary");
	   
	   //다운로드할 파일의 크기 읽어와서 다운로드할 파일의 크기 설정
	   response.setContentLengthLong(dto.getFileSize());
	   
	   //Exception이 발생하지 않도록(response.getOutputStream()호출 전에 해야한다.)
	   //자세한 내용 : 2022.11.23 텍스트폴더 파일에 존재
	   out.clear();
	   out=pageContext.pushBody();
	   
	   //클라이언트에게 출력할수 있는 스트림 객체 얻어오기
	   BufferedOutputStream bos=
	      new BufferedOutputStream(response.getOutputStream());
	   //한번에 최대 1M byte 씩 읽어올수 있는 버퍼
	   byte[] buffer=new byte[1024*1024];
	   int readedByte=0;
	   //반복문 돌면서 출력해주기
	   while(true){
	      //byte[] 객체를 이용해서 파일에서 byte 알갱이 읽어오기
	      readedByte = fis.read(buffer);
	      if(readedByte == -1)break; //더이상 읽을 데이터가 없다면 반복문 빠져 나오기
	      //읽은 만큼 출력하기
	      bos.write(buffer, 0, readedByte);
	      bos.flush(); //출력
	   }
	   //FileInputStream 닫아주기 
	   fis.close();   
	%>
</body>
</html>