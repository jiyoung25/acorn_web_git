<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test01.jsp</title>
</head>
<body>
	<h1>비동기 테스트</h1>
	<script>
	
		//가상의 주어진 작업을 처리 하는 함수 (주어진 작업을 처리하는데  random 한 시간이 걸린다고 가정하자)
		function work(job, callback){
			
			//0 ~ 5000 사이의 랜덤한 숫자 얻어내기
			let ranTime=Math.random()*5000;
			
			// 첫번째 인자로 전달된 함수를 random 한 이후에 호출하기 
			setTimeout(function(){
				console.log(job+" 을(를) 수행 했습니다.");
				//callback(); //call back안에는 function type에 들어있다는 가정하에서 해당 변수를 호출한다.
			}, ranTime);
			
		}
		
		/*
		work("달리기", function(){
			work("쉬기", function(){
				work("잠자기", function(){
					
				});
			});
		});
		*/
	
		//셋 중 어느 작업이 먼저 시작되고, 나중에 끝날지 알 수 없다. why? setTime이 랜덤이기 때문에.)
		work("냉장고 문을 연다.", function(){
			work("코끼리를 넣는다." function(){
				work("냉장고 문을 닫는다.", function(){
					
				});
			})
		});
		//위와 같이 js는 함수 안에 함수를 넣고 또 넣고... 반복 가능
		work()
		
		//1. Promise 객체를 생성해서 참조값을 p1 에 담기
		let p1=new Promise(function(resolve){
			/*
				함수의 인자로 전달되는 resolve는 함수이다.
				resolve 는 작업을 완료 했을때 호출 해야하는 함수
				resolve 함수가 호출되면 .then() 안에 있는 함수가 자동 호출된다.
			*/
			resolve();
		});
		
		//아래는 p1(resolve함수)을 수행한 후, 그 다음 then안에 있는 함수가 실행됨.
		p1.then(function(){
			console.log("then 안에 있는 함수가 호출되었습니다.");
		});
		
	</script>
</body>
</html>













