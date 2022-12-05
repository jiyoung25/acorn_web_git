<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insertform.jsp</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="container">
		<h3>새 글 작성 폼입니다.</h3>
		<form action="insert.jsp">
			<div>
				<span>제목</span>
				<input type="text" name = "title" id = "title" />
			</div>
			<div>
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
			</div>
			<div>
				<textarea name="content" id="content"rows="10"></textarea>
			</div>
			<button id="submitBtn" type = "submit" onclick = " submitContents(this) ">
				저장
			</button>
			<button type="reset">
				작성 내용 초기화
			</button>
			<button type="button" onclick = "location.href='${pageContext.request.contextPath}/cafe/AllList.jsp'">
				뒤로가기
			</button>
		</form>
	</div>
	
	<%--
      [ SmartEditor 를 사용하기 위한 설정 ]
      
      1. webapp 에 SmartEditor  폴더를 복사해서 붙여 넣기
      2. webapp 에 upload 폴더 만들어 두기
      3. webapp/WEB-INF/lib 폴더에 
         commons-io.jar 파일과 commons-fileupload.jar 파일 붙여 넣기
      4. <textarea id="content" name="content"> 
         content 가 아래의 javascript 에서 사용 되기때문에 다른 이름으로 바꾸고 
            싶으면 javascript 에서  content 를 찾아서 모두 다른 이름으로 바꿔주면 된다. 
      5. textarea 의 크기가 SmartEditor  의 크기가 된다.
      6. 폼을 제출하고 싶으면 onclick = "submitContents(this)" 라는 javascript가 폼 안에 있는 버튼에서 실행되면 된다.
    --%>
   
   <!-- SmartEditor 에서 필요한 javascript 로딩  -->
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