<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<style>
		#profileImage{
			width : 50px;
			border-radius: 5px;
		}
		h3{
			text-align:center;
		}
	</style>
</head>
<body>
	<jsp:include page="/include/navbar2.jsp"></jsp:include>
	<div class="container">
		<hr class="border border-warning border-4 opacity-50">
		<h3>파일 업로드 폼입니다.</h3>
		<hr class="border border-warning border-4 opacity-50">
		<!-- 
			파일 업로드 폼 작성법
			1. method="post"
			2. enctype="multipart/form-data"
			3. <input type="file" />
			
			-enctype = "multipart/form-data"가 설정된 폼을 전송하면
			 폼에서 전송된 내용을 추출할 때 HttpServletRequest 객체로 추출을 할 수 없다.
			 MultipartRequest객체를 이용해서 추출해야 한다.
		 -->
		 <form action="upload.jsp" method="post" enctype="multipart/form-data">
		 	<div class="input-group mb-3">
		 		<span class="input-group-text" id="basic-addon1">제목</span>
		 		<input class="form-control" type="text" name="title" id="title" />
		 	</div>
		 	<div class="input-group mb-3">
		 		<span class="input-group-text" id="basic-addon1">첨부파일</span>
		 		<input class="form-control" type="file" name="myFile" id= "myFile" />
		 	</div>
		 	<button class="btn btn-warning" type="submit">업로드</button>
		 	<button class="btn btn-warning" type="reset">
				작성 내용 초기화
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
				</svg>
			</button>
			<button class="btn btn-warning" type="button" onclick = "location.href='${pageContext.request.contextPath}/file/list_T.jsp'">
				뒤로가기
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
				</svg>
			</button>
		 </form>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>