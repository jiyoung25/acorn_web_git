<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertform</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
		crossorigin="anonymous"
	>
</head>
<body>
<hr class="border border-warning border-4 opacity-50">
	<div class="container">
		<h1>할 일 목록 추가하기</h1>
		<br>
		<div class="input-group mb-3">
			<form action="${pageContext.request.contextPath}/todo/insert.jsp">
				<label class="input-group-text">이름<input class="form-control" type="text" name="name"></label>
				<label class="input-group-text">주소<input class="form-control" type="text" name="addr"></label>
				<br>
				<button class="btn btn-dark" type="submit">추가하기</button>
			</form>
		</div>
	</div>

</body>
</html>