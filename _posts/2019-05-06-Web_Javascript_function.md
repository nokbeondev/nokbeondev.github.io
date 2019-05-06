---
layout: post
title: "[Javascript] function"
comments: true
categories: Web
---

### 1. 메소드(함수) 선언, 인풋 인자 대입

```xml
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
f1 = function(){}
f1();
f1("hello");

f2 = function(p1){
	console.log(p1);
}
f2('hello'); //hello
f2();//undefined

f3 = function(p1, p2){
	console.log(p1);
	console.log(p2);
}
f3(1,2); //p1에1대입, p2에2대입
f3(1,2,3,4,5);//p1에1대입, p2에2대입
f3(1); //p1에1대입,p2에 undefined
</script>
<title>function.html</title>
</head>
<body>

</body>
</html>
```

### 2. 이전, 다음 페이지로 이동
`go()`매소드로 앞, 뒤로 이동할 수 있다. -1은 이전, 1은 다음으로 이동을 의미한다.

```xml
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>history_function.html</title>
<script>
//window.history
history.go(-1);
</script>
</head>
<body>

</body>
</html>
```

### 3. 특정 url로 이동

`location`을 통해 특정 url로 이동할 수 있다.

```xml
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>location_function.html</title>
<script>
//window.location.
location.href="http://localhost:8888";//url이 이동됨
</script>
</head>
<body>

</body>
</html>
```

### 4. 알림창 띄우기, 새 창 띄우기

```xml
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>window_function.html</title>
<script>
window.alert("경고!");

var f=function(){
	alert("짠!!!!!!");
}
var ms=3*1000; //3초
setTimeout(f,ms); // 3초 뒤에 f함수 진행
setInterval(f, ms); // 3초 마다 f함수 진행, 즉, 3초에 한 번씩 계속해서 알림창이 뜬다.
//setTimeout(f(), ms); //(X) - 잘못된 표현식

// 아래처럼 인터벌 설정하여 3초마다 알림창을 띄우는 함수를 변수 interval_id에 담고
// clearInterval(interval_id)에 담으면
// 알림창이 한 번만 뜨고 멈춘다.
var interval_id = setInterval(function(){
	                          alert("짠!!!!!!");
	                         }, ms);
clearInterval(interval_id);

var url="https://www.daum.net";
var opt="width=100px, height=100px"; // 새창에서 열릴 시 크기 설정(크롬에서는 잘 안됨..)
var name="w2";
window.open(url,name, opt); // 이 함수를 통해 새로운 특정 url로 이동 가능
window.open(url,name, opt);
</script>
</head>
<body>

</body>
</html>
```

























