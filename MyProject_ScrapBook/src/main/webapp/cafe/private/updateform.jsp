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
</head>
<body>
	<div class="container">
		<h3>글 수정 폼</h3>
		<form action="update.jsp">
				<input type="hidden" name = "num" value="<%=dto.getNum() %>" />
				<span>카테고리</span>
				<select name="category" id="category">
					<optgroup label="주거형태">
						<option value="1-1">아파트</option>
						<option value="1-2">원룸</option>
						<option value="1-3">빌라</option>
						<option value="1-4">오피스텔</option>
						<option value="1-5">사무실</option>
					</optgroup>
					<optgroup label="방의 형태">
						<option value="2-1">거실</option>
						<option value="2-2">안방</option>
						<option value="2-3">작은방</option>
						<option value="2-4">부엌</option>
						<option value="2-5">화장실</option>
					</optgroup>
					<optgroup label="분위기">
						<option value="3-1">모던</option>
						<option value="3-2">귀여움</option>
						<option value="3-3">자연</option>
					</optgroup>
				</select>
			<div>
				<span>제목</span>
				<input type="text" name = "title" id = "title" value="<%=dto.getTitle() %>" />
			</div>
			<div> <!-- 내용 -->
				<textarea name = "content" id="content" ><%=dto.getContent() %></textarea>
			</div>
			<button type="submit" onclick = " submitContents(this) ">수정하기</button>
			<button type="reset">작성 내용 초기화</button>
			<button type="button" onclick = "location.href='${pageContext.request.contextPath}/cafe/AllList.jsp'" >리스트로 돌아가기</button>
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