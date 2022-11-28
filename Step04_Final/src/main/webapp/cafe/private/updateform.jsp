<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<style>
		textarea{
			width : 768px;
			height : 300px;
		}
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
		<hr class="border border-secondary border-4 opacity-50">
		<h3>글 수정 폼</h3>
		<hr class="border border-secondary border-4 opacity-50">
		<form action="update.jsp">
				<input type="hidden" name = "num" value="<%=dto.getNum() %>" />
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">제목</span>
				<input class="form-control" type="text" name = "title" id = "title" value="<%=dto.getTitle() %>" />
			</div>
			<div> <!-- 내용 -->
				<textarea name = "content" id="content" ><%=dto.getContent() %></textarea>
			</div>
			<button class="btn btn-warning" type="submit" onclick = " submitContents(this) ">
				수정하기
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
  					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  					<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
				</svg>
			</button>
			<button class="btn btn-warning" type="reset">
				작성 내용 초기화
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
				</svg>
			</button>
			<button class="btn btn-warning" type="button" onclick = "location.href='${pageContext.request.contextPath}/cafe/list.jsp'" >
				리스트로 돌아가기
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
				</svg>
			</button>
		</form>
	</div>
	<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
   <script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
   <script>
      var oEditors = [];
      
      //추가 글꼴 목록
      //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
      
      nhn.husky.EZCreator.createInIFrame({
         oAppRef: oEditors,
         elPlaceHolder: "content",
         sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",   
         htParams : {
            bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function(){
               //alert("완료!");
            }
         }, //boolean
         fOnAppLoad : function(){
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
         },
         fCreator: "createSEditor2"
      });
      
      function pasteHTML() {
         var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
         oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
      }
      
      function showHTML() {
         var sHTML = oEditors.getById["content"].getIR();
         alert(sHTML);
      }
         
      function submitContents(elClickedObj) {
         //SmartEditor 에 의해 만들어진(작성한글) 내용이 textarea 의 value 가 되도록 한다. 
         oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.
         
         // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
         
         try {
            //폼 제출하기 
            elClickedObj.form.submit();
         } catch(e) {}
      }
      
      function setDefaultFont() {
         var sDefaultFont = '궁서';
         var nFontSize = 24;
         oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
      }
   </script>
</body>
</html>