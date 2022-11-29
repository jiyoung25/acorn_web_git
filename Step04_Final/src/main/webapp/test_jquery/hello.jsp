<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    			*******************jquery*******************
    							
    	1. $("선택자").action1().action2()....와 같은 형태(chain형태)로 사용 가능
    	
    	2. $( ) 함수는 jquery의 기능이 추가된 배열을 리턴한다.
    	
    	3. $( ) 함수가 리턴하는 배열에는 "선택자"에 부합하는 문서객체(body, p, div, input 등)의 참조값이 들어있다.
    	
    	4. $( ).action1( )처럼 특정 동작을 하면 배열 안에 들어있는 모든 문서객체에 동작이 적용된다. (for문이나 forEach을 사용할 필요가 없다.)
    	
    	5. $( ).action1( ).action2( )... 처럼 chain형태의 동작은 가능할 때도 있고 아닐 때도 있다.
    	 -> 만일 어떤 동작이 무언가를 읽어오는 동작이면 뒤에 chain 형태의 동작은 불가능하다.
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/hello.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h3>jquery test</h3>
	<p id="one"></p>
	<p id="two"></p>
	<div>div1</div>
	<div class="my-class">div2</div>
	<div>div3</div>
	<div class="my-class">div4</div>
	<div>div5</div>
	<input class="my-class" type="text" id="inputMsg" />
	<button id="sendBtn">전송</button>
	<script>
	/*위의 모든 div의 innerText를 김구라로 바꾸려면?
		
		//방법 1. javascript이용
		const divs=document.querySelectorAll("div");
		for(i=0; i<divs.length; i++){
			divs[i].innerText = "김구라";
		}	
		
		//방법2. jquery이용 . (반복문을 돌 필요가 없다.)
		$("div").text("김구라");
	*/
	
	//id가 one인 요소의 innerText를 "김구라", 글자의 색을 blue로 조작하기
	$("#one").text("김구라").css("color","blue");
	
	//id가 two인 요소의 innerText를 여러분의 이름, 글자의 크기를 20px, 배경색을 yellow로 조작해보세요.
	$("#two").text("이지영").css("font-size","20px").css("background-color","yellow");
	
	//모든 div요소의 글자색을 pink로 바꾸기
	$("div").css("color","pink");
	
	/*
		이벤트 리스너 함수를 등록하는 방법
		$("").on("이벤트명", 콜백 함수);
	*/
	$("#sendBtn").on("click",function(){
		//id가 inputMsg인 곳에 입력한 값을 읽어와서 상수 msg에 담는다.
		const msg = $("#inputMsg").val();  //val은 value이다. value값을 msg에 저장한 것이다.
		alert(msg+"를 전송합니다.")
	})
	
	//전송버튼을 눌렀을 때 실행할 함수 등록
	//$("#sendBtn").on("click",function(){
	//	alert("전송합니다.");
	//})
	</script>
</body>
</html>