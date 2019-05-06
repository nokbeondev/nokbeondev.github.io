---
layout: post
title: "[Javascript] 변수"
comments: true
categories: Web
---

### 1. 변수 선언과 var

`var` 없이 그냥 변수 a1를 정의했다고 가정한다. 그리고 `var`선언 후에 a2를 정의했다고 가정한다. 이 경우 똑같은 변수의 Scope면에서 다르다. a1은 전역 변수의 개념이고, a2는 지역 변수의 개념이다. 즉, a2는 함수 내에 선언되면 함수가 끝날 시 소멸된다. a1은 함수 내부에서 사용되더라도 함수가 끝날 때 소멸되지 않는다.

```javascript
<!-- js/variable.html -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//변수선언방법
//변수명=값대입;

//var 변수명;
//변수명=값대입

var a;
a=10;
a='hello'; // 10이 들어갔었는데 hello가 덮어씌워졌다.
console.log(window.a); //hello가 대입된다.
for(var i=0; i<10; i++){
	console.log(a);
	var forI;
	forI=99;
	console.log(forI); //99
}
console.log(i); //10
console.log(forI); //99 window.forI ==>99

var f1 = function(){
	console.log(a);
	var fI=88;//함수scope의 변수선언
	console.log("f1함수내의 변수fI=" + fI); //88
}
f1();
//console.log("f1함수밖에서 변수fI="+ fI); //????

//-----------------------------
f2 = function(){
	var f21=1;
	var f2f = function(){
		var f22=9;
		console.log(f22); //9
		console.log(f21); //1
	}
	f2f();
	//console.log(f22); //f22 is not defined
};
f2();
f3 = function(){
	f31=1;
	f3f = function(){
		f32=9;
		console.log(f32); //9
		console.log(f31); //1
	}
	f3f();
	//console.log(f32); //9
};
f3();
console.log(f31);//1 
console.log(f32);//9

var f41=100;
f4 = function(){
	f41=1;
	f4f = function(){
		f42=9;
		console.log(f42); //9
		console.log(f41); //1
	}
	f4f();
};
f4();
console.log(f41); //1
</script>
</head>
<body>

</body>
</html>
```