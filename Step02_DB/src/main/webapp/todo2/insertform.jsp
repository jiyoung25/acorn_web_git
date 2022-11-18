<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr class="border border-warning border-4 opacity-50">
	<div class="container">
		<h1>할 일 목록 추가하기</h1>
		<br>
		<div>
			<form action="insert.jsp" method="post">
				<div class="input-group mb-3">
					<label class="input-group-text" for="content">할 일</label>
					<input type="text" name="content" id="content">
				</div>
				<button class="btn btn-dark" type = "submit" >추가 </button>
			</form>
		</div>
	</div>
</body>
</html>