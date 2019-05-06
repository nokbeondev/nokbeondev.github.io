---
layout: post
title: "[HTML] DOM 트리에서 객체를 찾아 표현하는 예제"
comments: true
categories: Web
---

### 1. 예제로 이해하기

 DOM 트리에서 원하는 객체를 찾아 경고창, 콘솔에 출력하는 예제

```xml
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dom.html</title>
</head>
<body>
 <button id="bt1">버튼1</button>
 <button>버튼2</button>
 <div>
   <ol>
     <li>ONE</li>
     <li>TWO</li>
   </ol>
   DIV1입니다.
 </div>
 <button id="bt3">버튼3</button>
 <br>
 <span>
   <input type="checkbox" checked value="JAVA">자바&nbsp;&nbsp;
   <input type="checkbox" value="C#">C#
 </span>
 <br>
 <span>
   <select>
     <option>서울</option>
     <option>경기</option>
     <option>부산</option>
   </select>
 </span>

 <script>
   //window.document
   //var obj = document.getElementById("bt1");
   var obj = document.querySelector("#bt1");
   console.log(obj);

   //var arr = document.getElementsByTagName("button");
   var arr = document.querySelectorAll("button");
   //arr[0] arr[1]
   //console.log(arr);

/*
   obj.addEventListener("click", function(){
	   alert(this.innerText + "이 클릭되었습니다.");
   });
*/
   for(var i=0; i<arr.length; i++){
	   arr[i].addEventListener("click", function(){
		   alert(this.innerText + "이 클릭되었습니다.");
	   });
   }

   var divObj = document.querySelector("div");
   console.log(divObj.innerHTML);
   console.log(divObj.innerText);

   var bt3Obj = document.querySelector("#bt3");
   bt3Obj.addEventListener("click", function(){
	   var liObj = document.querySelector("div>ol>li");
	   alert(liObj.innerText);
   });

   //dom트리에서 input태그의 type속성값이 checkbox인 객체들 찾기
   var cArr = document.querySelectorAll("input[type=checkbox]");

   //각checkbox객체에서 click이벤트가 발생하면 
   //checked속성값이 true이면 value속성값+선택했습니다.
   //               false이면 value속성값+선택해제했습니다
   //alert으로 보여주기
   for(var i=0; i<cArr.length; i++){
	 cArr[i].addEventListener("click", function(){
		 if(this.checked){//(this.checked == true){
		 	alert(this.value+"을 선택했습니다");
		 }else{
			 alert(this.value+"을 선택해제했습니다");
		 }
	 });
   }

   //dom트리에서 select객체1개 찾기
   var selectObj = document.querySelector("select");
   //click이벤트가 발생하면 "clicked"를 console.log로 출력
   /* selectObj.addEventListener("click", function(){
	 console.log(this.value + " clicked");
   }); */
   selectObj.addEventListener("change",function(){
	 console.log(this.value + " 로 changed");
   });
 </script>
</body>
</html>
```

