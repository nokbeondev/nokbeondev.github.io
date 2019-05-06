---
layout: post
title: "[Javascript] 웹 계산기 예제 - 버튼 클릭, 함수 기능 구현 등"
comments: true
categories: Web
---

### 1. 계산기 예제 소스 코드

반복문 안에 변수를 두 개를 두어(i, j) 버튼이 담길 btArr의 인덱스로 쓰일 변수(j) 반복문에 쓰일 변수(i)로 설정했다.

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calculator.html</title>
<script>
 window.addEventListener("load",function(){
	 var inputArr = document.querySelectorAll("input");
	 var btArr = document.querySelectorAll("button");
	 var lbObj = document.querySelector("label");
	 var a = parseInt(inputArr[0].value);
	 var b = parseInt(inputArr[1].value);

	for(var i=0; i<btArr.length; i++){
	 	(function(j){
		 btArr[j].addEventListener("click",function(){
			 	if(j==0){
			 		alert(a+b);
			 	}else if(j==1){
			 		alert(a-b);
			 	}else if(j==2){
			 		alert(a*b);
			 	}else if(j==3){
			 		alert(a/b);
			 	}
		 });
	 	})(i);
	 };// end for loop
 });
</script>
</head>
<body>
<input value="3"><br>
<input value="5"><br>
<button>+</button>&nbsp;&nbsp;<button>-</button>&nbsp;&nbsp;
<button>*</button>&nbsp;&nbsp;<button>/</button><br>
<label></label>
</body>
</html>
```

